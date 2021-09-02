use aj_report_init;
CREATE TABLE if not exists `aj_report_comparestack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nums` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (1, '2021-08-23', '成功', 12);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (2, '2021-08-23', '失败', 1);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (3, '2021-08-24', '成功', 24);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (4, '2021-08-24', '失败', 5);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (5, '2021-08-25', '成功', 13);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (6, '2021-08-25', '失败', 8);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (7, '2021-08-26', '成功', 19);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (8, '2021-08-26', '失败', 3);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (9, '2021-08-27', '成功', 9);
INSERT INTO `aj_report_init`.`aj_report_comparestack`(`id`, `time`, `type`, `nums`) VALUES (10, '2021-08-27', '失败', 15);

INSERT INTO `aj_report`.`gaea_report_data_set`(`set_code`, `set_name`, `set_desc`, `source_code`, `dyn_sentence`, `case_result`, `enable_flag`, `delete_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('compare_ajreport', '柱状对比图示例数据', '', 'mysql_ajreport', 'SELECT time,type,nums from aj_report_comparestack', '[{\"time\":\"2021-08-23\",\"type\":\"成功\",\"nums\":12},{\"time\":\"2021-08-23\",\"type\":\"失败\",\"nums\":1},{\"time\":\"2021-08-24\",\"type\":\"成功\",\"nums\":24},{\"time\":\"2021-08-24\",\"type\":\"失败\",\"nums\":5},{\"time\":\"2021-08-25\",\"type\":\"成功\",\"nums\":13},{\"time\":\"2021-08-25\",\"type\":\"失败\",\"nums\":8},{\"time\":\"2021-08-26\",\"type\":\"成功\",\"nums\":19},{\"time\":\"2021-08-26\",\"type\":\"失败\",\"nums\":3},{\"time\":\"2021-08-27\",\"type\":\"成功\",\"nums\":9},{\"time\":\"2021-08-27\",\"type\":\"失败\",\"nums\":15}]', 1, 0, 'admin', '2021-08-27 13:48:33', 'admin', '2021-08-27 13:48:33', 1);
