-- 新增源端目标端字典

INSERT INTO `aj_report`.`gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('源端目标端属性', 'SOUTAR_PROPERTIES', '源端目标端属性', 'admin', NOW(), 'admin', NOW(), 1);

INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('SOUTAR_PROPERTIES', '源端', 'source', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('SOUTAR_PROPERTIES', '目标端', 'target', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('SOUTAR_PROPERTIES', '数值', 'value', NULL, 1, 'zh', NULL, NULL, 'admin', NOW(), 'admin', NOW(), 1);
