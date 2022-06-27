-- 调整gaea_report_dashboard_widget部分字段长度

ALTER TABLE `aj_report`.`gaea_report_dashboard_widget` MODIFY COLUMN `setup` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件的渲染属性json' AFTER `type`;

ALTER TABLE `aj_report`.`gaea_report_dashboard_widget` MODIFY COLUMN `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件的数据属性json' AFTER `setup`;

ALTER TABLE `aj_report`.`gaea_report_dashboard_widget` MODIFY COLUMN `collapse` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件的配置属性json' AFTER `data`;

ALTER TABLE `aj_report`.`gaea_report_dashboard_widget` MODIFY COLUMN `position` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件的大小位置属性json' AFTER `collapse`;
