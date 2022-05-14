-- 角色权限调整
-- access_role_authority
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'authorityManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'roleManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'userManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'bigScreenManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'bigScreenManage', 'view');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'bigScreenManage', 'export');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'bigScreenManage', 'import');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'excelManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'excelManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'excelManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'excelManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'fileManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'fileManage', 'upload');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'fileManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'fileManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictManage', 'fresh');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictItemManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictItemManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictItemManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('designer', 'dictItemManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'bigScreenManage', 'copy');

DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'root' AND `target` = 'reportManage' AND `action` = 'query';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'reportManage' AND `action` = 'query';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'excelManage' AND `action` = 'insert';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'excelManage' AND `action` = 'update';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'excelManage' AND `action` = 'view';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'excelManage' AND `action` = 'export';
DELETE FROM `aj_report`.`access_role_authority` WHERE `role_code` = 'viewer' AND `target` = 'dictItemManage' AND `action` = 'query';

-- access_authority
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('access', 'authorityManage', '权限管理', 'detail', '权限明细', 101, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('access', 'roleManage', '角色管理', 'detail', '角色明细', 105, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2021-07-17 20:41:46', 2);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('access', 'userManage', '用户管理', 'detail', '用户明细', 110, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'datasourceManage', '数据源管理', 'detail', '数据源明细', 200, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'resultsetManage', '数据集管理', 'detail', '数据集明细', 204, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'reportManage', '报表管理', 'detail', '报表明细', 221, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'bigScreenManage', '大屏报表', 'detail', '大屏明细', 231, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'excelManage', '表格报表', 'detail', 'excel明细', 234, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('system', 'fileManage', '文件管理', 'detail', '文件明细', 300, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('system', 'dictManage', '数据字典', 'detail', '数据字典明细', 300, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('system', 'dictItemManage', '数据字典项', 'detail', '数据字典项明细', 300, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'bigScreenManage', '大屏报表', 'copy', '复制大屏', 236, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);

UPDATE `aj_report`.`access_authority` SET `parent_target` = 'report', `target` = 'bigScreenManage', `target_name` = '大屏报表', `action` = 'view', `action_name` = '查看大屏', `sort` = 232, `enable_flag` = 1, `delete_flag` = 0, `create_by` = 'admin', `create_time` = '2019-07-23 15:59:40', `update_by` = 'admin', `update_time` = '2019-07-23 15:59:40', `version` = 1 WHERE `parent_target` = 'report' AND `target` = 'bigScreenManage' AND `action` = 'view';
