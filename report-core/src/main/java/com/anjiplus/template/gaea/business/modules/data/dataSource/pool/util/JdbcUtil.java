package com.anjiplus.template.gaea.business.modules.data.dataSource.pool.util;

import com.anjiplus.template.gaea.business.modules.data.dataSource.controller.dto.DataSourceDto;
import com.anjiplus.template.gaea.business.modules.data.dataSource.pool.datasource.PooledDataSource;
import com.anjiplus.template.gaea.business.modules.data.dataSource.pool.datasource.UnPooledDataSource;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by raodeming on 2021/3/18.
 */
@Slf4j
public class JdbcUtil {

    private static Lock lock = new ReentrantLock();

    private static Lock deleteLock = new ReentrantLock();

    //所有数据源的连接池存在map里
    static Map<Long, PooledDataSource> map = new HashMap<>();

    public static PooledDataSource getJdbcConnectionPool(DataSourceDto dataSource) {
        if (map.containsKey(dataSource.getId())) {
            return map.get(dataSource.getId());
        } else {
            lock.lock();
            try {
                log.debug(Thread.currentThread().getName() + "获取锁");
                if (!map.containsKey(dataSource.getId())) {
                    PooledDataSource pool = new PooledDataSource();
                    pool.setJdbcUrl(dataSource.getJdbcUrl());
                    pool.setUser(dataSource.getUsername());
                    pool.setPassword(dataSource.getPassword());
                    pool.setDriverClass(dataSource.getDriverName());
                    pool.init();
                    map.put(dataSource.getId(), pool);
                    log.info("创建连接池成功：{}", dataSource.getJdbcUrl());
                }
                return map.get(dataSource.getId());
            }  finally {
                lock.unlock();
            }
        }
    }

    /**
     * 删除数据库连接池
     * @param id
     */
    public static void removeJdbcConnectionPool(Long id) {
        deleteLock.lock();
        try {
            PooledDataSource pool = map.get(id);
            if (pool != null) {
                map.remove(id);
            }
        } catch (Exception e) {
            log.error(e.toString());
        } finally {
            deleteLock.unlock();
        }

    }

    /**
     * 获取连接
     * @param dataSource
     * @return
     * @throws SQLException
     */
    public static Connection getPooledConnection(DataSourceDto dataSource) throws SQLException {
        PooledDataSource pool = getJdbcConnectionPool(dataSource);
        return pool.getConnection();
    }

    /**
     * 测试数据库连接  获取一个连接
     * @param dataSource
     * @return
     * @throws ClassNotFoundException  driverName不正确
     * @throws SQLException
     */
    public static Connection getUnPooledConnection(DataSourceDto dataSource) throws SQLException {
        UnPooledDataSource source = new UnPooledDataSource();
        source.setJdbcUrl(dataSource.getJdbcUrl());
        source.setDriverClass(dataSource.getDriverName());
        source.setUser(dataSource.getUsername());
        source.setPassword(dataSource.getPassword());
        return source.getConnection();
    }



}
