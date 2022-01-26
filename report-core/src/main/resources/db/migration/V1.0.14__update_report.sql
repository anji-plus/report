use
aj_report;

-- 增加字段
ALTER TABLE `aj_report`.`gaea_report` ADD COLUMN `report_author` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表作者' AFTER `report_desc`;

ALTER TABLE `aj_report`.`gaea_report` ADD COLUMN `download_count` bigint(11) NULL DEFAULT NULL COMMENT '报表下载次数' AFTER `report_author`;

-- root权限更新
delete from access_role_authority where role_code = 'root';

INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'authorityManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'authorityManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'authorityManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'authorityManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'roleManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'roleManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'roleManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'roleManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'roleManage', 'grantAuthority');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'resetPassword');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'userManage', 'grantRole');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'datasourceManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'datasourceManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'datasourceManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'datasourceManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'resultsetManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'resultsetManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'resultsetManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'resultsetManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'reportManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'reportManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'reportManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'reportManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'bigScreenManage', 'share');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'bigScreenManage', 'view');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'bigScreenManage', 'design');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'bigScreenManage', 'export');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'bigScreenManage', 'import');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'excelManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'excelManage', 'view');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'excelManage', 'export');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'fileManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'fileManage', 'upload');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'fileManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'fileManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictManage', 'delete');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictManage', 'fresh');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictItemManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictItemManage', 'insert');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictItemManage', 'update');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default, 'root', 'dictItemManage', 'delete');

INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (237, 'report', 'excelManage', '表格报表', 'insert', '新建表格', 237, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (238, 'report', 'excelManage', '表格报表', 'update', '更新表格', 238, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (239, 'report', 'excelManage', '表格报表', 'view', '查看表格', 239, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (240, 'report', 'excelManage', '表格报表', 'export', '导出表格', 240, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);




