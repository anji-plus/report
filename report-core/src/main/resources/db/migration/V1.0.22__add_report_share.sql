INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'reportShareManage', '报表分享', 'query', '查询报表分享', 231, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'reportShareManage', '报表分享', 'detail', '查询明细', 232, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'reportShareManage', '报表分享', 'shareDelay', '分享延期', 233, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('report', 'reportShareManage', '报表分享', 'delete', '删除分享', 234, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'reportShareManage', 'query');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'reportShareManage', 'detail');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'reportShareManage', 'shareDelay');
INSERT INTO `aj_report`.`access_role_authority`(`role_code`, `target`, `action`) VALUES ('root', 'reportShareManage', 'delete');
<<<<<<< HEAD

ALTER TABLE `aj_report`.`gaea_report_share` ADD COLUMN share_password varchar(10) DEFAULT NULL COMMENT '分享码' AFTER share_url;
=======
>>>>>>> db091f0 (需求----新增报表分享菜单)
