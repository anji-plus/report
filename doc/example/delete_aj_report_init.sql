SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `aj_report_init`.`aj_report_access`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_barstack`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_common1`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_common2`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_common3`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_comparestack`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_devices`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_exper`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_fireacl`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_fireattack`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_mail`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_manus`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_nums`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_table`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_wifiamount`;
DROP TABLE IF EXISTS `aj_report_init`.`aj_report_init`;
DROP DATABASE `aj_report_init`;

DELETE FROM `aj_report`.`gaea_report` WHERE `report_code` = 'log_ajreport';
DELETE FROM `aj_report`.`gaea_report` WHERE `report_code` = 'car_ajreport';
DELETE FROM `aj_report`.`gaea_report` WHERE `report_code` = 'acc_ajreport';
DELETE FROM `aj_report`.`gaea_report` WHERE `report_code` = 'blank';
DELETE FROM `aj_report`.`gaea_report` WHERE `report_code` = 'logistics_one';

DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'log_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'car_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'acc_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'blank';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'test';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'logn_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard` WHERE `report_code` = 'logistics_one';

DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'test';
DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'acc_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'car_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'blank';
DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'logn_ajreport';
DELETE FROM `aj_report`.`gaea_report_dashboard_widget` WHERE `report_code` = 'logistics_one';

DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajdevices';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajfireacl';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajattack';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajmailfailtop5';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajmailfail';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'log_ajwifiamount';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajpro';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajsale';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajproTop5';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajsaleTop5';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajunsale';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajrework';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'car_ajreturn';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'acc_ajacc';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'acc_ajregister';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'acc_ajrt';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'acc_ajqps';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'acc_ajerror';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'amount_1';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'logis_1';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'logis_2';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'logis_3';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'logis_table';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'per';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'barstack_ajreport';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'compare_ajreport';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'aj_report_city_total';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'aj_report_single_city';
DELETE FROM `aj_report`.`gaea_report_data_set` WHERE `set_code` = 'aj_report_city_select';

DELETE FROM `aj_report`.`gaea_report_data_set_param` WHERE `set_code` = 'aj_report_city_total';
DELETE FROM `aj_report`.`gaea_report_data_set_param` WHERE `set_code` = 'aj_report_single_city';
DELETE FROM `aj_report`.`gaea_report_data_set_param` WHERE `set_code` = 'aj_report_city_select';

DELETE FROM `aj_report`.`gaea_report_data_source` WHERE `source_code` = 'mysql_ajreport';


SET FOREIGN_KEY_CHECKS = 1;
