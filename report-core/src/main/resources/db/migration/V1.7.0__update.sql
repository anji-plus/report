-- 增加日历解析属性
INSERT INTO `gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('日历属性', 'CALENDAR_PROPERTIES', '日历属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);

INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('CALENDAR_PROPERTIES', '日期', 'date', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('CALENDAR_PROPERTIES', '数据', 'data', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);

-- 增加监控视频解析属性
INSERT INTO `gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('监控视频属性', 'MONITOR_PROPERTIES', '监控视频属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);

INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('MONITOR_PROPERTIES', '视频地址', 'src', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('MONITOR_PROPERTIES', '视频名称', 'name', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
