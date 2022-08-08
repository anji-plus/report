INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'excelManage', '表格报表', 'share', '分享报表', 231, 1, 0, 'admin', now(), 'admin', now(), 1);

INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'excelManage', 'share');
