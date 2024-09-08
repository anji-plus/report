-- 分享表增加report_name
ALTER TABLE `gaea_report_share` ADD `report_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称' AFTER `report_code`;

-- 更新report_name
UPDATE `gaea_report_share` t1
    INNER JOIN `aj_report`.`gaea_report` t2 on t1.report_code=t2.report_code
    SET t1.report_name=t2.report_name;

-- 数据集复制
INSERT INTO `access_authority`(`parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`)
VALUES
('report', 'resultsetManage', '数据集管理', 'copy', '数据集复制', 204, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);

-- root用户赋权
INSERT INTO `access_role_authority`(`role_code`, `target`, `action`)
VALUES
('root', 'resultsetManage', 'copy');
