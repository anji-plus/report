use
aj_report;

-- 增加字段
ALTER TABLE `gaea_report_data_set` add COLUMN `set_type` varchar(10);
-- 将该字段值全更新为sql
update gaea_report_data_set set set_type = 'sql';

-- 字典
INSERT INTO `gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, '数据集类型', 'SET_TYPE', '数据集类型', 'admin', '2021-11-16 14:43:12', 'admin', '2021-11-16 14:43:12', 1);
INSERT INTO `gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'SET_TYPE', 'sql', 'sql', NULL, 1, 'zh', NULL, NULL, 'admin', '2021-11-16 14:43:42', 'admin', '2021-11-16 14:43:42', 1);
INSERT INTO `gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'SET_TYPE', 'http', 'http', NULL, 1, 'zh', NULL, NULL, 'admin', '2021-11-16 14:43:51', 'admin', '2021-11-16 14:43:51', 1);


