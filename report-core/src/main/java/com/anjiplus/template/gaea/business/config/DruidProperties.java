package com.anjiplus.template.gaea.business.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.anji.plus.gaea.exception.BusinessExceptionBuilder;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by raod on 2024/10/21.
 */
@Component
@ConfigurationProperties(prefix = "spring.druid")
@Data
public class DruidProperties {
    private static final Logger log = LoggerFactory.getLogger(DruidProperties.class);
    /**
     * 初始化时建立物理连接的个数。初始化发生在显示调用init方法，或者第一次getConnection时
     */
    private int initialSize;

    /**
     * 最小连接池数量
     */
    private int minIdle;

    /**
     * 最大连接池数量
     */
    private int maxActive;

    /**
     * 获取连接时最大等待时间，单位毫秒。配置了maxWait之后，缺省启用公平锁，并发效率会有所下降，如果需要可以通过配置
     */
    private int maxWait;

    /**
     * 关闭空闲连接的检测时间间隔.Destroy线程会检测连接的间隔时间，如果连接空闲时间大于等于minEvictableIdleTimeMillis则关闭物理连接。
     */
    private int timeBetweenEvictionRunsMillis;

    /**
     * 连接的最小生存时间.连接保持空闲而不被驱逐的最小时间
     */
    private int minEvictableIdleTimeMillis;

    private String validationQuery;

    /**
     * 申请连接时检测空闲时间，根据空闲时间再检测连接是否有效.建议配置为true，不影响性能，并且保证安全性。申请连接的时候检测，如果空闲时间大于timeBetweenEvictionRun
     */
    private boolean testWhileIdle;

    private boolean testOnBorrow;
    private boolean testOnReturn;

    /**
     * 开启PSCache
     */
    private boolean poolPreparedStatements;

    /**
     * 设置PSCache值
     */
    private int maxPoolPreparedStatementPerConnectionSize;

    private String filters;

    private String connectionProperties;
    private boolean useGlobalDataSourceStat;
    private boolean statViewServletEnabled;

    /**
     * 连接出错后再尝试连接三次
     */
    private int connectionErrorRetryAttempts;

    /**
     * 数据库服务宕机自动重连机制
     */
    private boolean breakAfterAcquireFailure;

    /**
     * 连接出错后重试时间间隔
     */
    private int timeBetweenConnectErrorMillis;

    public DruidDataSource dataSource(String url, String username, String password, String driverClassName){
        try {
            DruidDataSource datasource = new DruidDataSource();
            datasource.setUrl(url);
            datasource.setUsername(username);
            datasource.setPassword(password);
            datasource.setDriverClassName(driverClassName);
            //configuration
            datasource.setInitialSize(initialSize);
            datasource.setMinIdle(minIdle);
            datasource.setMaxActive(maxActive);
            datasource.setMaxWait(maxWait);

            datasource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
            datasource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
            if (driverClassName.contains("oracle")) {
                datasource.setValidationQuery(validationQuery + " FROM DUAL");
            }else {
                datasource.setValidationQuery(validationQuery);
            }
            datasource.setTestWhileIdle(testWhileIdle);
            datasource.setTestOnBorrow(testOnBorrow);
            datasource.setTestOnReturn(testOnReturn);

            datasource.setPoolPreparedStatements(poolPreparedStatements);
            datasource.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
            datasource.setFilters(filters);
            datasource.setConnectionProperties(connectionProperties);
            datasource.setUseGlobalDataSourceStat(useGlobalDataSourceStat);

            datasource.setConnectionErrorRetryAttempts(connectionErrorRetryAttempts);
            datasource.setBreakAfterAcquireFailure(breakAfterAcquireFailure);
            datasource.setTimeBetweenConnectErrorMillis(timeBetweenConnectErrorMillis);
            return datasource;
        } catch (Exception e) {
            log.error("初始化数据源失败：", e);
            throw BusinessExceptionBuilder.build("初始化数据源失败：" + e.getMessage());
        }
    }
}
