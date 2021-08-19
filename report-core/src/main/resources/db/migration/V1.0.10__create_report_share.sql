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
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='报表分享';


INSERT INTO `aj_report`.`gaea_dict`(`id`, `dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , '分享有效期', 'SHARE_VAILD', '报表分享', 'admin', '2021-08-18 13:29:19', 'admin', '2021-08-18 13:29:24', 1);


INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default , 'SHARE_VAILD', '永久有效', '0', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-18 13:30:21', 'admin', '2021-08-18 13:30:21', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '1天', '1', NULL, 1, 'zh', NULL, 2, 'admin', '2021-08-18 13:30:39', 'admin', '2021-08-18 13:30:39', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '7天', '7', NULL, 1, 'zh', NULL, 3, 'admin', '2021-08-18 13:30:51', 'admin', '2021-08-18 13:30:56', 2);
INSERT INTO `aj_report`.`gaea_dict_item`(`id`, `dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (default, 'SHARE_VAILD', '30天', '30', NULL, 1, 'zh', NULL, 4, 'admin', '2021-08-18 13:31:11', 'admin', '2021-08-18 13:31:11', 1);
