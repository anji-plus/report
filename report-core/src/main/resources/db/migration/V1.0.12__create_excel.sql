use
aj_report;


CREATE TABLE `gaea_report_excel`
(
    `id`          bigint(11) NOT NULL AUTO_INCREMENT,
    `report_code` varchar(100)  DEFAULT NULL COMMENT '报表编码',
    `set_codes`   varchar(255)  DEFAULT NULL COMMENT '数据集编码，以|分割',
    `set_param`   varchar(1024) DEFAULT NULL COMMENT '数据集查询参数',
    `json_str`    text COMMENT '报表json串',
    `enable_flag` int(1) DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag` int(1) DEFAULT '0' COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`   varchar(255)  DEFAULT NULL COMMENT '创建人',
    `create_time` datetime      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255)  DEFAULT NULL COMMENT '更新人',
    `update_time` datetime      DEFAULT NULL COMMENT '更新时间',
    `version`     int(8) DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UNIQUE_REPORT_CODE` (`report_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;


INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (234, 'report', 'bigScreenManage', '大屏报表', 'export', '导出大屏', 234, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (235, 'report', 'bigScreenManage', '大屏报表', 'import', '导入大屏', 235, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);
INSERT INTO `aj_report`.`access_authority`(`id`, `parent_target`, `target`, `target_name`, `action`, `action_name`, `sort`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES (236, 'report', 'excelManage', '表格报表', 'query', '查询报表', 236, 1, 0, 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', 1);

INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default , 'root', 'bigScreenManage', 'export');
INSERT INTO `aj_report`.`access_role_authority`(`id`, `role_code`, `target`, `action`) VALUES (default , 'root', 'bigScreenManage', 'import');


UPDATE `aj_report`.`gaea_report` SET `report_type` = 'report_screen' WHERE `report_code` in ('log_ajreport', 'car_ajreport', 'acc_ajreport');

