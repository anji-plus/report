-- 新增雷达图字典

INSERT INTO `aj_report`.`gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('雷达属性', 'RADAR_PROPERTIES', '雷达属性', 'admin', NOW(), 'admin', NOW(), 1);

INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('RADAR_PROPERTIES', '名称', 'name', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('RADAR_PROPERTIES', '雷达顶点', 'radar', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
