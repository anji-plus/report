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

-- 散点图解析属性
INSERT INTO `gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('散点图属性', 'SCATTER_PROPERTIES', '散点图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);

INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('SCATTER_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('SCATTER_PROPERTIES', '散点', 'scatter', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
