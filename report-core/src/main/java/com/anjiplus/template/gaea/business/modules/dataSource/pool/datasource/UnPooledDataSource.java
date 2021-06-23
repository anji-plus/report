package com.anjiplus.template.gaea.business.modules.dataSource.pool.datasource;

import com.anjiplus.template.gaea.business.modules.dataSource.pool.util.DriverClassUtil;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author binbin.hou
 * @since 1.0.0
 */
public class UnPooledDataSource extends AbstractDataSourceConfig {

    @Override
    public Connection getConnection() throws SQLException {
        DriverClassUtil.loadDriverClass(super.driverClass, super.jdbcUrl);
        if (StringUtils.isBlank(super.getUser()) && StringUtils.isBlank(super.getPassword())) {
            return DriverManager.getConnection(super.jdbcUrl);
        }
        return DriverManager.getConnection(super.getJdbcUrl(),
                super.getUser(), super.getPassword());
    }

}
