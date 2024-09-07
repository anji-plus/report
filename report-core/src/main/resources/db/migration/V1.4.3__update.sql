-- 分享表增加report_name
ALTER TABLE `aj_report`.`gaea_report_share` ADD `report_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称' AFTER `report_code`;

-- 更新report_name
UPDATE `aj_report`.`gaea_report_share` t1
    INNER JOIN `aj_report`.`gaea_report` t2 on t1.report_code=t2.report_code
    SET t1.report_name=t2.report_name;