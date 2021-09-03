use
aj_report;

CREATE TABLE `gaea_report_share`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `share_code`       varchar(50)  DEFAULT NULL COMMENT '分享编码，系统生成，默认UUID',
    `share_valid_type` int(2) DEFAULT NULL COMMENT '分享有效期类型，DIC_NAME=SHARE_VAILD',
    `share_valid_time` datetime     DEFAULT NULL COMMENT '分享有效期',
    `share_token`      varchar(255) DEFAULT NULL COMMENT '分享token',
    `share_url`        varchar(100) DEFAULT NULL COMMENT '分享url',
    `report_code`      varchar(50)  DEFAULT NULL COMMENT '报表编码',
    `enable_flag`      int(1) DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`      int(1) DEFAULT '0' COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`        varchar(255) DEFAULT NULL COMMENT '创建人',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(255) DEFAULT NULL COMMENT '更新人',
    `update_time`      datetime     DEFAULT NULL COMMENT '更新时间',
    `version`          int(8) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UNIQUE_SHARE_CODE` (`share_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表分享';


INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '分享有效期', 'SHARE_VAILD', '报表分享', 'admin', '2021-08-18 13:29:19', 'admin', '2021-08-18 13:29:24', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '柱状图属性', 'BAR_PROPERTIES', '柱状图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '折线图属性', 'LINE_PROPERTIES', '折线图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '柱线图属性', 'BAR_LINE_PROPERTIES', '柱线图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '饼图属性', 'PIE_PROPERTIES', '饼图、漏斗图', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '单文本图属性', 'TEXT_PROPERTIES', '仪表盘、百分比、文本框、滚动文本', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '堆叠图属性', 'STACK_PROPERTIES', '堆叠图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);
INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '地图属性', 'MAP_PROPERTIES', '地图属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);



INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'SHARE_VAILD', '永久有效', '0', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-18 13:30:21', 'admin', '2021-08-18 13:30:21', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '1天', '1', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-18 13:30:39', 'admin', '2021-08-18 13:30:39', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '7天', '7', NULL, 1, 'zh', NULL, 3, 'admin', '2021-08-18 13:30:51', 'admin', '2021-08-18 13:30:56', 2);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '30天', '30', NULL, 1, 'zh', NULL, 4, 'admin', '2021-08-18 13:31:11', 'admin', '2021-08-18 13:31:11', 1);

INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:19:35', 'admin', '2021-08-20 10:19:35', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_PROPERTIES', '柱状', 'bar', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:19:56', 'admin', '2021-08-20 10:19:56', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'LINE_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:27:39', 'admin', '2021-08-20 10:27:39', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'LINE_PROPERTIES', '折线', 'line', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:27:49', 'admin', '2021-08-20 10:27:49', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', 'x轴时间轴-时', 'xAxis-hour', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:32:11', 'admin', '2021-08-20 10:32:11', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', 'x轴时间轴-天', 'xAxis-day', NULL, 1, 'zh', NULL, 3, 'admin', '2021-08-20 10:32:25', 'admin', '2021-08-20 10:32:25', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', 'x轴时间轴-月', 'xAxis-month', NULL, 1, 'zh', NULL, 4, 'admin', '2021-08-20 10:32:38', 'admin', '2021-08-20 10:32:38', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', '时间轴-年', 'xAxis-year', NULL, 1, 'zh', NULL, 5, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', '柱状', 'bar', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:33:02', 'admin', '2021-08-20 10:33:02', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'BAR_LINE_PROPERTIES', '折线', 'line', NULL, 1, 'zh', NULL, 7, 'admin', '2021-08-20 10:33:11', 'admin', '2021-08-20 10:33:11', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'PIE_PROPERTIES', '名称name', 'name', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:35:27', 'admin', '2021-08-20 10:35:27', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'PIE_PROPERTIES', '数值value', 'value', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:35:38', 'admin', '2021-08-20 10:35:38', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'TEXT_PROPERTIES', '文本数字', 'text', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:36:04', 'admin', '2021-08-20 10:36:04', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', 'x轴时间轴-时', 'xAxis-hour', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:32:11', 'admin', '2021-08-20 10:32:11', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', 'x轴时间轴-天', 'xAxis-day', NULL, 1, 'zh', NULL, 3, 'admin', '2021-08-20 10:32:25', 'admin', '2021-08-20 10:32:25', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', 'x轴时间轴-月', 'xAxis-month', NULL, 1, 'zh', NULL, 4, 'admin', '2021-08-20 10:32:38', 'admin', '2021-08-20 10:32:38', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', '时间轴-年', 'xAxis-year', NULL, 1, 'zh', NULL, 5, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', 'y轴字段', 'yAxis', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', '柱状', 'bar', NULL, 1, 'zh', NULL, 7, 'admin', '2021-08-20 10:33:02', 'admin', '2021-08-20 10:33:02', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'STACK_PROPERTIES', '折线', 'line', NULL, 1, 'zh', NULL, 8, 'admin', '2021-08-20 10:33:11', 'admin', '2021-08-20 10:33:11', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'MAP_PROPERTIES', '名称name', 'name', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:41:00', 'admin', '2021-08-20 10:41:00', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'MAP_PROPERTIES', '数值value', 'value', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-20 10:41:11', 'admin', '2021-08-20 10:41:11', 1);
INSERT INTO `aj_report`.`gaea_report_data_set`(`set_code`, `set_name`, `set_desc`, `source_code`, `dyn_sentence`, `case_result`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('barstack_ajreport', '柱状堆叠数据', '', 'mysql_ajreport', 'select time,type,nums from aj_report_barstack', '[{\"time\":\"2021-07-27\",\"type\":\"A\",\"nums\":12},{\"time\":\"2021-07-27\",\"type\":\"B\",\"nums\":20},{\"time\":\"2021-07-27\",\"type\":\"C\",\"nums\":11},{\"time\":\"2021-07-26\",\"type\":\"A\",\"nums\":11},{\"time\":\"2021-07-26\",\"type\":\"B\",\"nums\":30},{\"time\":\"2021-07-25\",\"type\":\"B\",\"nums\":20},{\"time\":\"2021-07-25\",\"type\":\"C\",\"nums\":15}]', 1, 0, 'admin', '2021-07-27 19:50:52', 'admin', '2021-08-16 14:08:51', 7);

use
aj_report_init;
CREATE TABLE if not exists `aj_report_barstack`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `time` date         DEFAULT NULL,
    `type` varchar(255) DEFAULT NULL,
    `nums` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*堆叠图数据*/
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (1, '2021-07-27', 'A', 12);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (2, '2021-07-27', 'B', 20);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (3, '2021-07-27', 'C', 11);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (4, '2021-07-26', 'A', 11);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (5, '2021-07-26', 'B', 30);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (6, '2021-07-25', 'B', 20);
INSERT INTO `aj_report_init`.`aj_report_barstack`(`id`, `time`, `type`, `nums`) VALUES (7, '2021-07-25', 'C', 15);

