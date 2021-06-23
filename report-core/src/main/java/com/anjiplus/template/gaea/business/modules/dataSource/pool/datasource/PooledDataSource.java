package com.anjiplus.template.gaea.business.modules.dataSource.pool.datasource;

import com.anjiplus.template.gaea.business.modules.dataSource.pool.connection.IPooledConnection;
import com.anjiplus.template.gaea.business.modules.dataSource.pool.connection.PooledConnection;
import com.anjiplus.template.gaea.business.modules.dataSource.pool.exception.JdbcPoolException;
import com.anjiplus.template.gaea.business.modules.dataSource.pool.util.DriverClassUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 池化的数据源
 *
 * @author binbin.hou
 * @since 1.1.0
 */
@Slf4j
public class PooledDataSource extends AbstractPooledDataSourceConfig {

    /**
     * 内置的队列
     *
     * @since 1.1.0
     */
    private List<IPooledConnection> pool = new ArrayList<>();

    @Override
    public synchronized void init() {
        DriverClassUtil.loadDriverClass(super.driverClass, super.jdbcUrl);

        this.initJdbcPool();

        // 初始化 idle check
        this.initTestOnIdle();
    }

    @Override
    public synchronized Connection getConnection() throws SQLException {
        //1. 获取第一个不是 busy 的连接
        Optional<IPooledConnection> connectionOptional = getFreeConnectionFromPool();
        if (connectionOptional.isPresent()) {
            return connectionOptional.get();
        }

        //2. 考虑是否可以扩容
        if (pool.size() >= maxSize) {
            //2.1 立刻返回
            if (maxWaitMills <= 0) {
                throw new JdbcPoolException("Can't get connection from pool!");
            }


            //2.2 循环等待
            final long startWaitMills = System.currentTimeMillis();
            final long endWaitMills = startWaitMills + maxWaitMills;
            while (System.currentTimeMillis() < endWaitMills) {
                Optional<IPooledConnection> optional = getFreeConnectionFromPool();
                if (optional.isPresent()) {
                    return optional.get();
                }

                try {
                    TimeUnit.MILLISECONDS.sleep(1);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
                log.debug("等待连接池归还，wait for 1 mills");
            }

            //2.3 等待超时
            throw new JdbcPoolException("Can't get connection from pool, wait time out for mills: " + maxWaitMills);
        }

        //3. 扩容（暂时只扩容一个）
        log.debug("开始扩容连接池大小，step: 1");
        IPooledConnection pooledConnection = createPooledConnection();
        pooledConnection.setBusy(true);
        this.pool.add(pooledConnection);
        log.debug("从扩容后的连接池中获取连接");
        return pooledConnection;
    }

    @Override
    public void returnConnection(IPooledConnection pooledConnection) {
        // 验证状态
        if (testOnReturn) {
            checkValid(pooledConnection);
        }

        // 设置为不繁忙
        pooledConnection.setBusy(false);
        log.debug("归还连接，状态设置为不繁忙");
    }

    /**
     * 获取空闲的连接
     *
     * @return 连接
     * @since 1.3.0
     */
    private Optional<IPooledConnection> getFreeConnectionFromPool() {
        for (IPooledConnection pc : pool) {
            if (!pc.isBusy()) {
                pc.setBusy(true);
                log.debug("从连接池中获取连接");

                // 验证有效性
                if (testOnBorrow) {
                    log.debug("Test on borrow start");
                    checkValid(pc);
                    log.debug("Test on borrow finish");
                }

                return Optional.of(pc);
            }
        }
        // 空
        return Optional.empty();
    }


    /**
     * https://stackoverflow.com/questions/3668506/efficient-sql-test-query-or-validation-query-that-will-work-across-all-or-most
     * <p>
     * 真正支持标准的，直接使用 {@link Connection#isValid(int)} 验证比较合适
     *
     * @param pooledConnection 连接池信息
     * @since 1.5.0
     */
    private void checkValid(final IPooledConnection pooledConnection) {
        if (StringUtils.isNotEmpty(super.validQuery)) {
            Connection connection = pooledConnection.getConnection();
            try {
                // 如果连接无效，重新申请一个新的替代
                if (!connection.isValid(super.validTimeOutSeconds)) {
                    log.debug("Old connection is inValid, start create one for it.");

                    Connection newConnection = createConnection();
                    pooledConnection.setConnection(newConnection);
                    log.debug("Old connection is inValid, finish create one for it.");
                }
            } catch (SQLException throwables) {
                throw new JdbcPoolException(throwables);
            }
        } else {
            log.debug("valid query is empty, ignore valid.");
        }
    }

    /**
     * 初始化连接池
     *
     * @since 1.1.0
     */
    private void initJdbcPool() {
        final int minSize = super.minSize;
        pool = new ArrayList<>(minSize);

        for (int i = 0; i < minSize; i++) {
            IPooledConnection pooledConnection = createPooledConnection();

            pool.add(pooledConnection);
        }
    }

    /**
     * 创建一个池化的连接
     *
     * @return 连接
     * @since 1.1.0
     */
    private IPooledConnection createPooledConnection() {
        Connection connection = createConnection();

        IPooledConnection pooledConnection = new PooledConnection();
        pooledConnection.setBusy(false);
        pooledConnection.setConnection(connection);
        pooledConnection.setDataSource(this);

        return pooledConnection;
    }

    /**
     * 创建新连接
     *
     * @return 连接
     * @since 1.1.0
     */
    private Connection createConnection() {
        try {
            if (StringUtils.isBlank(super.getUser()) && StringUtils.isBlank(super.getPassword())) {
                return DriverManager.getConnection(super.getJdbcUrl());
            }
            return DriverManager.getConnection(super.getJdbcUrl(),
                    super.getUser(), super.getPassword());
        } catch (SQLException e) {
            throw new JdbcPoolException(e);
        }
    }


    /**
     * 初始化空闲时检验
     *
     * @since 1.5.0
     */
    private void initTestOnIdle() {
        if (StringUtils.isNotEmpty(validQuery)) {
            ScheduledExecutorService idleExecutor = Executors.newSingleThreadScheduledExecutor();

            idleExecutor.scheduleAtFixedRate(this::testOnIdleCheck, super.testOnIdleIntervalSeconds, testOnIdleIntervalSeconds, TimeUnit.SECONDS);
            log.debug("Test on idle config with interval seonds: " + testOnIdleIntervalSeconds);
        }
    }

    /**
     * 验证所有的空闲连接是否有效
     *
     * @since 1.5.0
     */
    private void testOnIdleCheck() {
        log.debug("start check test on idle");
        for (IPooledConnection pc : this.pool) {
            if (!pc.isBusy()) {
                checkValid(pc);
            }
        }
        log.debug("finish check test on idle");
    }

}
