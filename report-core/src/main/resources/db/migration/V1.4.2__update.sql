delete from gaea_dict_item where dict_code ='SOURCE_TYPE' and item_value in ('postgresql','dameng','openGauss','Kingbase');

INSERT INTO gaea_dict_item
(dict_code, item_name, item_value, item_extend, enabled, locale, remark, sort, create_by, create_time, update_by, update_time, version)
VALUES('SOURCE_TYPE', 'postgresql', 'postgresql', '[{"label":"driverName","value":"org.postgresql.Driver","labelValue":"驱动类"},{"label":"jdbcUrl","value":"jdbc:postgresql://127.0.0.1:5432/pgdb","labelValue":"连接串"},{"label":"username","value":"root","labelValue":"用户名"},{"label":"password","value":"root","labelValue":"密码"}]', 1, 'zh', NULL, 4, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);

INSERT INTO gaea_dict_item
(dict_code, item_name, item_value, item_extend, enabled, locale, remark, sort, create_by, create_time, update_by, update_time, version)
VALUES('SOURCE_TYPE', '达梦', 'dameng', '[{"label":"driverName","value":"dm.jdbc.driver.DmDriver","labelValue":"驱动类"},{"label":"jdbcUrl","value":"jdbc:dm://127.0.0.1:5236","labelValue":"连接串"},{"label":"username","value":"SYSDBA","labelValue":"用户名"},{"label":"password","value":"SYSDBA","labelValue":"密码"}]', 1, 'zh', NULL, 11, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);

INSERT INTO gaea_dict_item
(dict_code, item_name, item_value, item_extend, enabled, locale, remark, sort, create_by, create_time, update_by, update_time, version)
VALUES('SOURCE_TYPE', 'openGauss', 'openGauss', '[{"label":"driverName","value":"org.opengauss.Driver","labelValue":"驱动类"},{"label":"jdbcUrl","value":"jdbc:opengauss://127.0.0.1:5432/postgres","labelValue":"连接串"},{"label":"username","value":"gaussdb","labelValue":"用户名"},{"label":"password","value":"gaussdb","labelValue":"密码"}]', 1, 'zh', NULL, 12, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);

INSERT INTO gaea_dict_item
(dict_code, item_name, item_value, item_extend, enabled, locale, remark, sort, create_by, create_time, update_by, update_time, version)
VALUES('SOURCE_TYPE', '人大金仓', 'Kingbase', '[{"label":"driverName","value":"com.kingbase8.Driver","labelValue":"驱动类"},{"label":"jdbcUrl","value":"jdbc:kingbase8://127.0.0.1:54321/test","labelValue":"连接串"},{"label":"username","value":"SYSTEM","labelValue":"用户名"},{"label":"password","value":"123456","labelValue":"密码"}]', 1, 'zh', NULL, 13, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);

UPDATE gaea_dict_item SET sort=31 WHERE dict_code ='SOURCE_TYPE' and item_name='elasticsearch_sql';
UPDATE gaea_dict_item SET sort=32 WHERE dict_code ='SOURCE_TYPE' and item_name='kudu impala';
UPDATE gaea_dict_item SET sort=33 WHERE dict_code ='SOURCE_TYPE' and item_name='jdbc';
UPDATE gaea_dict_item SET sort=34 WHERE dict_code ='SOURCE_TYPE' and item_name='http';