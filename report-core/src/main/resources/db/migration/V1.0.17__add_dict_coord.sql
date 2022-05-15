-- 新增坐标轴字典

INSERT INTO `aj_report`.`gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('XY坐标属性', 'COORD_PROPERTIES', 'XY坐标属性', 'admin', NOW(), 'admin', NOW(), 1);

INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('COORD_PROPERTIES', '数据', 'series', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('COORD_PROPERTIES', 'X轴', 'xAxis', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('COORD_PROPERTIES', 'Y轴', 'yAxis', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
