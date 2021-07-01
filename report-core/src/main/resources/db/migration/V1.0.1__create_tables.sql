/*
 Navicat Premium Data Transfer

 Source Server         : 10.108.26.197gaea-dev
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 10.108.26.197:3306
 Source Schema         : aj_report

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 01/07/2021 16:48:21
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

CREATE
DATABASE IF NOT EXISTS aj_report DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use
aj_report;

-- ----------------------------
-- Table structure for gaea_dict
-- ----------------------------
DROP TABLE IF EXISTS `gaea_dict`;
CREATE TABLE `gaea_dict`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `dict_name`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
    `dict_code`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
    `remark`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`     int(11) NULL DEFAULT NULL COMMENT '版本',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数组字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_dict
-- ----------------------------
INSERT INTO `gaea_dict`
VALUES (4, '删除状态', 'DELETE_FLAG', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (6, '是否启用', 'ENABLE_FLAG', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (7, '文件状态', 'FILE_STATUS', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (8, '是否启用', 'FILTER_FLAG', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (9, '数据过滤类型', 'FILTER_TYPE', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (11, '指标类型', 'ITEM_TYPE', NULL, 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict`
VALUES (12, '国际化标识', 'LOCALE', 'ssssss', 'admin', '2021-03-09 16:43:09', 'admin', '2021-03-27 22:20:00', 2);
INSERT INTO `gaea_dict`
VALUES (35, '数据源类型', 'SOURCE_TYPE', '', 'admin', '2021-03-23 13:16:58', 'admin', '2021-04-13 16:43:30', 4);
INSERT INTO `gaea_dict`
VALUES (36, '数据转换类型', 'TRANSFORM_TYPE', NULL, 'admin', '2021-03-23 13:24:28', 'admin', '2021-03-23 13:24:32', 1);
INSERT INTO `gaea_dict`
VALUES (37, '是否必填', 'REQUIRED_FLAG', NULL, 'admin', '2021-03-23 13:25:50', 'admin', '2021-03-23 13:25:53', 1);
INSERT INTO `gaea_dict`
VALUES (39, '行业类型', 'SYS_CATA_TYPE', '系统所属行业类型', 'admin', '2021-03-25 13:07:38', 'admin', '2021-03-25 13:07:38', 1);
INSERT INTO `gaea_dict`
VALUES (40, '报表类型', 'REPORT_TYPE', '报表类型', 'admin', '2021-03-26 11:48:06', 'admin', '2021-03-26 11:48:11', NULL);
INSERT INTO `gaea_dict`
VALUES (45, '菜单国际化', 'MENU_LANGUAGE', '菜单国际化配置', 'admin', '2021-04-06 16:33:33', 'admin', '2021-04-06 16:33:33', 1);
INSERT INTO `gaea_dict`
VALUES (46, '报表分组', 'REPORT_GROUP', '报表分组', 'admin', '2021-04-07 09:36:40', 'admin', '2021-04-07 09:36:42', 1);
INSERT INTO `gaea_dict`
VALUES (47, '报表组件类型', 'DASHBOARD_PANEL_TYPE', '报表组件类型', 'admin', '2021-04-12 10:42:50', 'admin', '2021-04-12 10:42:55',
        1);
INSERT INTO `gaea_dict`
VALUES (48, '图表属性', 'CHART_PROPERTIES', '报表属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 3);

-- ----------------------------
-- Table structure for gaea_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `gaea_dict_item`;
CREATE TABLE `gaea_dict_item`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `dict_code`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典编码',
    `item_name`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项名称',
    `item_value`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项值',
    `item_extend` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典扩展项',
    `enabled`     int(1) NULL DEFAULT 1 COMMENT '1:启用 0:禁用',
    `locale`      varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言标识',
    `remark`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `sort`        int(11) NULL DEFAULT NULL COMMENT '排序',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`     int(11) NULL DEFAULT NULL COMMENT '版本',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_dict_item
-- ----------------------------
INSERT INTO `gaea_dict_item`
VALUES (1, 'AUDIT_FLAG', '待审核', 'waiting', NULL, 1, 'zh', '待审核', 1, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (2, 'AUDIT_FLAG', '审核中', 'ongoing', NULL, 1, 'zh', '审核中', 2, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (3, 'AUDIT_FLAG', '通过', 'approved', NULL, 1, 'zh', '通过', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (4, 'AUDIT_FLAG', '拒绝', 'rejected', NULL, 1, 'zh', '拒绝', 4, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (5, 'DELETE_FLAG', '已删除', '1', NULL, 1, 'zh', '已删除', 5, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-31 12:04:26', 2);
INSERT INTO `gaea_dict_item`
VALUES (6, 'DELETE_FLAG', '未删除', '0', NULL, 1, 'zh', '未删除', 6, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-31 12:04:49', 3);
INSERT INTO `gaea_dict_item`
VALUES (7, 'ENABLE_FLAG', '禁用', '0', NULL, 1, 'zh', '已禁用', 2, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-04-08 14:41:13', 3);
INSERT INTO `gaea_dict_item`
VALUES (8, 'ENABLE_FLAG', '启用', '1', NULL, 1, 'zh', '已启用', 1, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-04-08 14:41:18', 3);
INSERT INTO `gaea_dict_item`
VALUES (9, 'SYSTEM_CODE', 'CTS电脑端', 'CTS-PC', NULL, 1, 'zh', 'CTS电脑端', 9, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (10, 'SYSTEM_CODE', 'CTS App端', 'CTS-APP', NULL, 1, 'zh', 'CTS App端', 10, 'admin', '2021-03-09 16:43:09',
        'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (11, 'FILTER_FLAG', '已禁用', '0', NULL, 1, 'zh', '已禁用', 7, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (12, 'FILTER_FLAG', '已启用', '1', NULL, 1, 'zh', '已启用', 8, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (13, 'FILTER_TYPE', 'js脚本', 'jsCalc', NULL, 1, 'zh', 'js脚本', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (14, 'FILTER_TYPE', '新增字段', 'addField', NULL, 1, 'zh', '新增字段', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (15, 'FILTER_TYPE', '替换字段', 'replaceField', NULL, 1, 'zh', '替换字段', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (16, 'FILTER_TYPE', 'ip解析java处理', 'ipTransform', NULL, 1, 'zh', 'ip解析java处理', 3, 'admin', '2021-03-09 16:43:09',
        'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (17, 'FILTER_TYPE', 'vpn在线时长java处理', 'vpnTransform', NULL, 1, 'zh', 'vpn在线时长java处理', 3, 'admin',
        '2021-03-09 16:43:09', 'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (18, 'SETTING_TYPE', '字符串', 'input', NULL, 1, 'zh', '字符串', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (19, 'SETTING_TYPE', '数字', 'input-number', NULL, 1, 'zh', '数字', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (20, 'SETTING_TYPE', '文本区域', 'textarea', NULL, 1, 'zh', '文本区域', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (21, 'SETTING_TYPE', '数据字典', 'code-select', NULL, 1, 'zh', '数据字典', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (22, 'SETTING_TYPE', '下拉列表', 'select', NULL, 1, 'zh', '下拉列表', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (23, 'SETTING_TYPE', '单选按钮', 'radio-group', NULL, 1, 'zh', '单选按钮', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (24, 'SETTING_TYPE', '多选按钮', 'checkbox-group', NULL, 1, 'zh', '多选按钮', 10, 'admin', '2021-03-09 16:43:09',
        'admin', '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (25, 'SETTING_TYPE', '自定义表单', 'custom-form', NULL, 1, 'zh', '自定义表单', 10, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (86, 'FILE_STATUS', '生成中', 'creating', NULL, 1, 'zh', '生成中', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (87, 'FILE_STATUS', '生成成功', 'success', NULL, 1, 'zh', '生成成功', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (88, 'FILE_STATUS', '生成失败', 'failed', NULL, 1, 'zh', '生成失败', 3, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (89, 'LOCALE', '中文', 'zh', NULL, 1, 'zh', '中文', NULL, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (90, 'LOCALE', '英文', 'en', NULL, 1, 'zh', '英文', NULL, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (91, 'LOCALE', 'Chinese', 'zh', NULL, 1, 'en', 'Chinese', NULL, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (92, 'LOCALE', 'English', 'en', NULL, 1, 'en', 'English', 1, 'admin', '2021-03-09 16:43:09', 'admin',
        '2021-03-09 16:43:09', 1);
INSERT INTO `gaea_dict_item`
VALUES (130, 'SOURCE_TYPE', 'mysql', 'mysql',
        '[{\"label\":\"driverName\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"labelValue\":\"驱动类\"},{\"label\":\"jdbcUrl\",\"value\":\"jdbc:mysql://127.0.0.1:3306/test_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT%2B8\",\"labelValue\":\"连接串\"},{\"label\":\"username\",\"value\":\"root\",\"labelValue\":\"用户名\"},{\"label\":\"password\",\"value\":\"root\",\"labelValue\":\"密码\"}]',
        1, 'zh', NULL, 2, '管理员', '2021-03-23 10:54:08', 'lixiaoyan', '2021-03-26 13:22:05', 3);
INSERT INTO `gaea_dict_item`
VALUES (131, 'SOURCE_TYPE', 'oracle', 'oracle',
        '[{\"label\":\"driverName\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"labelValue\":\"驱动类\"},{\"label\":\"jdbcUrl\",\"value\":\"jdbc:mysql://127.0.0.1:3306/test_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT%2B8\",\"labelValue\":\"连接串\"},{\"label\":\"username\",\"value\":\"root\",\"labelValue\":\"用户名\"},{\"label\":\"password\",\"value\":\"root\",\"labelValue\":\"密码\"}]',
        0, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (132, 'SOURCE_TYPE', 'elasticsearch_sql', 'elasticsearch_sql',
        '[{\"label\":\"apiUrl\",\"value\":\"http://10.108.26.164:9200/_xpack/sql?format=json\",\"labelValue\":\"请求路径\"},{\"label\":\"method\",\"value\":\"POST\",\"labelValue\":\"请求方式\"},{\"label\":\"header\",\"value\":\"{\\\"Content-Type\\\":\\\"application/json\\\"}\",\"labelValue\":\"请求头\"},{\"label\":\"body\",\"value\":\"{\\\"query\\\":\\\"select 1\\\"}\",\"labelValue\":\"请求体\"}]',
        1, 'zh', NULL, 2, '管理员', '2021-03-23 10:54:08', 'admin', '2021-04-13 13:12:33', 9);
INSERT INTO `gaea_dict_item`
VALUES (133, 'SOURCE_TYPE', 'kudu impala', 'kudu_impala',
        '[{\"label\":\"driverName\",\"value\":\"org.apache.hive.jdbc.HiveDriver\",\"labelValue\":\"驱动类\"},{\"label\":\"jdbcUrl\",\"value\":\"jdbc:impala://10.108.3.111:21050/ods\",\"labelValue\":\"连接串\"},{\"label\":\"username\",\"value\":\"\",\"labelValue\":\"用户名\"},{\"label\":\"password\",\"value\":\"\",\"labelValue\":\"密码\"}]',
        1, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin', '2021-04-01 09:18:09', 3);
INSERT INTO `gaea_dict_item`
VALUES (134, 'SOURCE_TYPE', 'http', 'http',
        '[{\"label\":\"apiUrl\",\"value\":\"https://gaea.anji-plus.com/auth/login\",\"labelValue\":\"请求路径\"},{\"label\":\"method\",\"value\":\"POST\",\"labelValue\":\"请求方式\"},{\"label\":\"header\",\"value\":\"{\\\"Content-Type\\\":\\\"application/json;charset=UTF-8\\\"}\",\"labelValue\":\"请求头\"},{\"label\":\"body\",\"value\":\"{\\\"username\\\":\\\"admin\\\",\\\"password\\\":\\\"de12878c0ef5beb7d8848c3af8f54afb\\\",\\\"verifyCode\\\":\\\"\\\"}\",\"labelValue\":\"请求体\"}]',
        1, 'zh', NULL, NULL, '管理员', '2021-04-13 17:26:38', 'admin', '2021-04-13 17:26:38', 1);
INSERT INTO `gaea_dict_item`
VALUES (140, 'REQUIRED_FLAG', '必填', '1', NULL, 1, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin',
        '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (141, 'REQUIRED_FLAG', '非必填', '0', NULL, 1, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin',
        '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (150, 'TRANSFORM_TYPE', 'js脚本', 'js', NULL, 1, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin',
        '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (151, 'TRANSFORM_TYPE', 'ip转换(javaBean)', 'ipTransform', NULL, 1, 'zh', NULL, 2, 'admin', '2021-03-23 10:54:08',
        'admin', '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (152, 'TRANSFORM_TYPE', '字典翻译', 'dict',
        '{\"dict1\": {\"1\": \"男\",\"0\": \"女\"},\"dict2\": {\"mysql\": \"mysql\",\"sqlserver\": \"sqlserver\"}}', 1,
        'zh', NULL, 2, 'admin', '2021-03-23 10:54:08', 'admin', '2021-03-23 10:54:08', 1);
INSERT INTO `gaea_dict_item`
VALUES (153, 'SYS_CATA_TYPE', '行业01', '1001', NULL, 1, 'zh', NULL, 1, 'admin', '2021-03-25 13:10:32', 'admin',
        '2021-03-25 13:10:32', 1);
INSERT INTO `gaea_dict_item`
VALUES (154, 'SYS_CATA_TYPE', '行业02', '1002', NULL, 1, 'zh', NULL, 2, 'admin', '2021-03-25 13:11:01', 'admin',
        '2021-03-25 13:11:01', 1);
INSERT INTO `gaea_dict_item`
VALUES (158, 'REPORT_TYPE', 'excel报表', 'report_excel', NULL, 1, 'zh', NULL, NULL, 'admin', '2021-03-26 11:49:28',
        'admin', '2021-03-26 11:50:19', NULL);
INSERT INTO `gaea_dict_item`
VALUES (159, 'REPORT_TYPE', '大屏报表', 'report_screen', NULL, 1, 'zh', NULL, NULL, 'admin', '2021-03-26 11:50:25', 'admin',
        '2021-03-26 11:50:21', NULL);
INSERT INTO `gaea_dict_item`
VALUES (230, 'REPORT_GROUP', '分组1', 'group_1', NULL, 1, 'zh', NULL, 1, 'admin', '2021-04-07 09:39:45', 'admin',
        '2021-04-13 16:44:31', 2);
INSERT INTO `gaea_dict_item`
VALUES (231, 'REPORT_GROUP', '分组2', 'group_2', NULL, 1, 'zh', NULL, 1, 'admin', '2021-04-07 09:40:55', 'admin',
        '2021-04-07 09:40:52', 1);
INSERT INTO `gaea_dict_item`
VALUES (232, 'INF_STATUS', '审核通过', '5', NULL, 1, 'zh', NULL, 25, 'admin', '2021-04-07 11:02:42', 'admin',
        '2021-04-07 15:01:35', 3);
INSERT INTO `gaea_dict_item`
VALUES (233, 'RULE_PARAM_TYPE', 'int', 'int', NULL, 1, 'zh', NULL, 3, 'zouya', '2021-04-09 09:43:22', 'zouya',
        '2021-04-09 09:43:22', 1);
INSERT INTO `gaea_dict_item`
VALUES (234, 'PUSH_TYPE', 'APP端', 'appsp', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin', '2021-04-09 10:13:33',
        'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (240, 'DASHBOARD_PANEL_TYPE', '文本', 'text', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (241, 'DASHBOARD_PANEL_TYPE', '滚动文本', '\r\nscrollingText', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (242, 'DASHBOARD_PANEL_TYPE', '超链接', 'hyperlinks', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (243, 'DASHBOARD_PANEL_TYPE', '当前时间', 'currentTime', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (244, 'DASHBOARD_PANEL_TYPE', '图片', 'picture', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (245, 'DASHBOARD_PANEL_TYPE', '轮播图片', 'rotatePictures', NULL, 1, 'zh', 'App端推送采用推送平台Appsp', 4, 'admin',
        '2021-04-09 10:13:33', 'admin', '2021-04-09 10:14:11', 3);
INSERT INTO `gaea_dict_item`
VALUES (246, 'MENU_LANGUAGE', '图标库', 'SvgDemo', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (247, 'MENU_LANGUAGE', '代码生成', 'Generator', NULL, 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (248, 'MENU_LANGUAGE', '项目列表', 'Project', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (249, 'MENU_LANGUAGE', '生成示例-单表', 'AlipayConfig', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (250, 'MENU_LANGUAGE', '设备信息-主表', 'DeviceInfo', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (251, 'MENU_LANGUAGE', '设备类型-子表', 'DeviceModel', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (252, 'MENU_LANGUAGE', '设备日志-子表', 'DeviceLogDetail', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (253, 'MENU_LANGUAGE', 'API文档', 'API', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (254, 'MENU_LANGUAGE', '系统通告', 'Announcement', '', 1, 'zh', '', 1, 'admin', '2021-04-06 16:34:10', 'admin',
        '2021-04-06 16:34:10', 1);
INSERT INTO `gaea_dict_item`
VALUES (255, 'REPORT_GROUP', '分组3', 'group_3', NULL, 1, 'zh', NULL, 3, 'admin', '2021-04-13 16:45:28', 'admin',
        '2021-04-13 16:45:28', 1);
INSERT INTO `gaea_dict_item`
VALUES (257, 'MENU_LANGUAGE', '文件管理', 'FileManagement', NULL, 1, 'zh', NULL, 1, 'admin', '2021-04-27 13:57:58', 'admin',
        '2021-04-27 13:57:58', 1);
INSERT INTO `gaea_dict_item`
VALUES (260, 'CHART_PROPERTIES', 'x轴', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (261, 'CHART_PROPERTIES', '柱状', 'bar', NULL, 1, 'zh', NULL, 6, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (262, 'CHART_PROPERTIES', '折线', 'line', NULL, 1, 'zh', NULL, 7, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (263, 'CHART_PROPERTIES', '饼图/仪表盘name', 'name', NULL, 1, 'zh', NULL, 8, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (264, 'CHART_PROPERTIES', '饼图/仪表盘value', 'value', NULL, 1, 'zh', NULL, 9, 'admin', '2021-04-29 10:48:43',
        'admin', '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (265, 'CHART_PROPERTIES', '时间轴-时', 'xAxis-hour', NULL, 1, 'zh', NULL, 2, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (266, 'CHART_PROPERTIES', '时间轴-天', 'xAxis-day', NULL, 1, 'zh', NULL, 3, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (267, 'CHART_PROPERTIES', '时间轴-月', 'xAxis-month', NULL, 1, 'zh', NULL, 4, 'admin', '2021-04-29 10:48:43',
        'admin', '2021-04-29 10:48:50', 1);
INSERT INTO `gaea_dict_item`
VALUES (268, 'CHART_PROPERTIES', '时间轴-年', 'xAxis-year', NULL, 1, 'zh', NULL, 5, 'admin', '2021-04-29 10:48:43', 'admin',
        '2021-04-29 10:48:50', 1);

-- ----------------------------
-- Table structure for gaea_file
-- ----------------------------
DROP TABLE IF EXISTS `gaea_file`;
CREATE TABLE `gaea_file`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `file_id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成的唯一uuid',
    `file_type`        varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型，字典FILE_TYPE',
    `file_path`        varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件在linux中的完整目录，比如/app/dist/export/excel/${fileid}.xlsx',
    `url_path`         varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通过接口的下载完整http路径',
    `file_instruction` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件内容说明，比如 对账单(202001~202012)',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `create_time`      timestamp(0) NULL DEFAULT NULL,
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `update_time`      timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0),
    `version`          int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 830 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for gaea_report
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report`;
CREATE TABLE `gaea_report`
(
    `id`           bigint(11) NOT NULL AUTO_INCREMENT,
    `report_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
    `report_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表编码',
    `report_group` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组',
    `report_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型',
    `report_image` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表缩略图',
    `report_desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表描述',
    `enable_flag`  int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`  int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`      int(8) NULL DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `UNIQUE_REPORT_CODE`(`report_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report
-- ----------------------------
INSERT INTO `gaea_report`
VALUES (187, '日志大屏', 'log_ajreport', NULL, NULL, NULL, '', 1, 0, 'admin', '2021-06-30 10:06:31', 'admin',
        '2021-06-30 10:06:31', 1);
INSERT INTO `gaea_report`
VALUES (188, '汽车生产销售大屏', 'car_ajreport', NULL, NULL, NULL, '', 1, 0, 'admin', '2021-06-30 14:32:53', 'admin',
        '2021-06-30 14:32:53', 1);
INSERT INTO `gaea_report`
VALUES (189, '访问大屏', 'acc_ajreport', NULL, NULL, NULL, '', 1, 0, 'admin', '2021-06-30 15:19:59', 'admin',
        '2021-06-30 15:19:59', 1);
INSERT INTO `gaea_report`
VALUES (190, '空白大屏', 'blank', NULL, 'report_screen',
        'http://10.108.26.197:9095/file/download/1d9bcd35-82a1-4f08-9465-b66b930b6a8d', '', 1, 0, 'admin',
        '2021-06-30 16:34:40', 'admin', '2021-07-01 15:19:56', 3);

-- ----------------------------
-- Table structure for gaea_report_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_dashboard`;
CREATE TABLE `gaea_report_dashboard`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '看板id',
    `report_code`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表编码',
    `title`            varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看板标题',
    `width`            bigint(20) NULL DEFAULT NULL COMMENT '宽度px',
    `height`           bigint(20) NULL DEFAULT NULL COMMENT '高度px',
    `background_color` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景色',
    `background_image` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
    `preset_line`      varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作台中的辅助线',
    `refresh_seconds`  int(11) NULL DEFAULT NULL COMMENT '自动刷新间隔秒',
    `enable_flag`      int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`      int(1) NULL DEFAULT 0 COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
    `sort`             int(11) NULL DEFAULT 0 COMMENT '排序，降序',
    `create_by`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_time`      datetime(0) NULL DEFAULT NULL,
    `update_by`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `update_time`      datetime(0) NULL DEFAULT NULL,
    `version`          int(8) NULL DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `UNIQUE_REPORT_CODE`(`report_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report_dashboard
-- ----------------------------
INSERT INTO `gaea_report_dashboard`
VALUES (269, 'log_ajreport', '大屏', 1920, 1080, 'rgba(30, 144, 255, 1)',
        'http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d', NULL, NULL, 1, 0, 0,
        'admin', '2021-06-30 10:24:28', 'admin', '2021-06-30 13:45:10', 30);
INSERT INTO `gaea_report_dashboard`
VALUES (270, 'car_ajreport', '大屏', 1920, 1080, 'rgba(0, 206, 209, 1)',
        'http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d', NULL, NULL, 1, 0, 0,
        'admin', '2021-06-30 14:50:47', 'admin', '2021-06-30 15:18:40', 7);
INSERT INTO `gaea_report_dashboard`
VALUES (271, 'acc_ajreport', '大屏', 1920, 1080, '#000',
        'http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d', NULL, NULL, 1, 0, 0,
        'admin', '2021-06-30 15:29:16', 'admin', '2021-06-30 15:32:26', 4);
INSERT INTO `gaea_report_dashboard`
VALUES (272, 'blank', '', 1920, 1080, '', '', NULL, NULL, 1, 0, 0, 'admin', '2021-06-30 16:58:51', 'admin',
        '2021-07-01 15:39:56', 5);

-- ----------------------------
-- Table structure for gaea_report_dashboard_widget
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_dashboard_widget`;
CREATE TABLE `gaea_report_dashboard_widget`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组件id',
    `report_code`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表编码',
    `type`            varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件类型参考字典DASHBOARD_PANEL_TYPE',
    `setup`           varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的渲染属性json',
    `data`            varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的数据属性json',
    `collapse`        varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的配置属性json',
    `position`        varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的大小位置属性json',
    `options`         text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'options配置项',
    `refresh_seconds` int(11) NULL DEFAULT NULL COMMENT '自动刷新间隔秒',
    `enable_flag`     int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`     int(1) NULL DEFAULT 0 COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
    `sort`            bigint(20) NULL DEFAULT 0 COMMENT '排序，图层的概念',
    `create_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_time`     datetime(0) NULL DEFAULT NULL,
    `update_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `update_time`     datetime(0) NULL DEFAULT NULL,
    `version`         int(8) NULL DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7783 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report_dashboard_widget
-- ----------------------------
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7594, 'log_ajreport', 'widget-hollow-piechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":\"\",\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"我\",\"percentage\":true,\"layoutFront\":\"\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":23,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"\",\"textColor\":\"\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":0,\"background\":\"\",\"fontSize\":12,\"marginBottom\":10,\"layerName\":\"空心饼图\",\"hideX\":true,\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":28,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"device_type\":\"name\",\"nums\":\"value\"},\"setCode\":\"log_ajdevices\",\"chartType\":\"widget-hollow-piechart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"[{\\\"value\\\": 1048,\\\"name\\\": \\\"搜索引擎\\\"},{\\\"value\\\": 735, \\\"name\\\": \\\"直接访问\\\"},{\\\"value\\\": 580, \\\"name\\\": \\\"邮件营销\\\"},{\\\"value\\\": 484,\\\"name\\\":\\\"联盟广告\\\"},{\\\"value\\\":300,\\\"name\\\":\\\"视频广告\\\"}]\"}',
        '{}', '{\"top\":193,\"left\":6,\"width\":611,\"index\":0,\"height\":389}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"[{\\\"value\\\": 1048,\\\"name\\\": \\\"搜索引擎\\\"},{\\\"value\\\": 735, \\\"name\\\": \\\"直接访问\\\"},{\\\"value\\\": 580, \\\"name\\\": \\\"邮件营销\\\"},{\\\"value\\\": 484,\\\"name\\\":\\\"联盟广告\\\"},{\\\"value\\\":300,\\\"name\\\":\\\"视频广告\\\"}]\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-hollow-piechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartProperties\":{\"device_type\":\"name\",\"nums\":\"value\"},\"setCode\":\"log_ajdevices\",\"chartType\":\"widget-hollow-piechart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"空心饼图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"我\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"数值\",\"name\":\"numberValue\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"百分比\",\"name\":\"percentage\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"网格线颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"right\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":6},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":193},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":611},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":389}]}',
        NULL, 1, 0, 1, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7595, 'log_ajreport', 'widget-gradient-color-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":\"\",\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"percentage\":false,\"layoutFront\":\"\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#90979c\",\"textColor\":\"#fff\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":23,\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":28,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":22,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"acl_type\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"log_ajfireacl\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":192,\"left\":626,\"width\":643,\"index\":1,\"height\":392}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"acl_type\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"log_ajfireacl\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":22},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#90979c\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":28},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"渐变色\",\"list\":[{\"type\":\"vue-color\",\"label\":\"0%处\",\"name\":\"barStart\",\"required\":false,\"placeholder\":\"\",\"value\":\"#00F4FFFF\"},{\"type\":\"vue-color\",\"label\":\"100%处\",\"name\":\"barEnd\",\"required\":false,\"placeholder\":\"\",\"value\":\"#004DA7FF\"}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":626},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":192},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":643},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":392}]}',
        NULL, 1, 0, 2, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7596, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"我\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"资产统计\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"\",\"textColor\":\"\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":0,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":152,\"left\":196,\"width\":230,\"index\":2,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"资产统计\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":196},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":152},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":230},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 3, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7597, 'log_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":false,\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":12,\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":20,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"NameFontSizeY\":17,\"isShow\":true,\"textFontSize\":20,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"},{\"color\":\"#79E779\"},{\"color\":\"#70E7E8\"},{\"color\":\"#E3BD8F\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"attack_type\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"log_ajattack\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":500000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":192,\"left\":1277,\"width\":602,\"index\":3,\"height\":393}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":500000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"attack_type\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"log_ajattack\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":17},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"},{\"color\":\"#79E779\"},{\"color\":\"#70E7E8\"},{\"color\":\"#E3BD8F\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1277},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":192},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":602},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":393}]}',
        NULL, 1, 0, 4, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7598, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"防火墙ACL次数\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#90979c\",\"textColor\":\"#fff\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":22,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":144,\"left\":838,\"width\":218,\"index\":4,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"防火墙ACL次数\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":838},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":144},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":218},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 5, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7599, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"攻击占比\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#90979c\",\"textColor\":\"#fff\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":22,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":147,\"left\":1490,\"width\":169,\"index\":5,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"攻击占比\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1490},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":147},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":169},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 6, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7600, 'log_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":true,\"reversalX\":false,\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":23,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":12,\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":19,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"NameFontSizeY\":21,\"isShow\":true,\"textFontSize\":20,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"nums\":\"bar\",\"username\":\"xAxis\"},\"setCode\":\"log_ajmailfailtop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":675,\"left\":5,\"width\":615,\"index\":6,\"height\":361}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"nums\":\"bar\",\"username\":\"xAxis\"},\"setCode\":\"log_ajmailfailtop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":23},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":21},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":19},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":5},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":675},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":615},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":361}]}',
        NULL, 1, 0, 7, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7601, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":true,\"reversalX\":false,\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"邮件认证失败TOP5\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":19,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":21,\"isShow\":true,\"textFontSize\":20,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":642,\"left\":191,\"width\":244,\"index\":7,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"邮件认证失败TOP5\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":191},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":642},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":244},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 8, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7602, 'log_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"barEnd\":\"#004DA7FF\",\"reversalX\":false,\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"areaThickness\":5,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":12,\"smoothCurve\":true,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"NameFontSizeY\":12,\"markPoint\":true,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"date\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"log_ajmailfail\",\"chartType\":\"widget-linechart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '{}', '{\"top\":678,\"left\":629,\"width\":646,\"index\":8,\"height\":362}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartProperties\":{\"date\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"log_ajmailfail\",\"chartType\":\"widget-linechart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":629},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":678},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":646},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":362}]}',
        NULL, 1, 0, 9, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7603, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"minHeight\":0,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"邮件认证失败趋势\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"areaThickness\":5,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":12,\"smoothCurve\":true,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"markPoint\":true,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":647,\"left\":827,\"width\":243,\"index\":9,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"邮件认证失败趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":827},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":647},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":243},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 10, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7604, 'log_ajreport', 'widget-barlinechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":0,\"barEnd\":\"#004DA7FF\",\"reversalX\":0,\"minHeight\":0,\"marginRight\":40,\"textInterval\":1,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"邮件认证失败TOP5\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"left\",\"lineColor\":\"#fff\",\"subTextColor\":\"#fff\",\"textColor\":\"#fff\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":12,\"marginBottom\":10,\"layerName\":\"柱线图\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"areaThickness\":5,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":12,\"smoothCurve\":true,\"fontSizeX\":16,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"markPoint\":true,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ED0E0E\"},{\"color\":\"#6CCD17\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"fail\":\"line\",\"datetime\":\"xAxis\",\"success\":\"bar\"},\"setCode\":\"log_ajwifiamount\",\"chartType\":\"widget-barlinechart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"xAxis\\\": [\\\"1月\\\", \\\"2月\\\", \\\"3月\\\", \\\"4月\\\", \\\"5月\\\",\\\"6月\\\", \\\"7月\\\", \\\"8月\\\",\\\"9月\\\",\\\"10月\\\",\\\"11月\\\",\\\"12月\\\"],\\\"series\\\": [{\\\"type\\\": \\\"bar\\\",\\\"name\\\": \\\"货运量\\\",\\\"data\\\": [2.6,5.9,9,26.4,28.7,70.7,175.6,182.2,48.7,18.8,6,2.3]},{\\\"type\\\": \\\"line\\\",\\\"name\\\": \\\"货运总量\\\",\\\"yAxisIndex\\\": 1,\\\"data\\\": [2,2.2,3.3,4.5,6.3,10.2,20.3,23.4,23,16.5,12,6.2]}]}\"}',
        '{}', '{\"top\":678,\"left\":1281,\"width\":632,\"index\":10,\"height\":361}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"xAxis\\\": [\\\"1月\\\", \\\"2月\\\", \\\"3月\\\", \\\"4月\\\", \\\"5月\\\",\\\"6月\\\", \\\"7月\\\", \\\"8月\\\",\\\"9月\\\",\\\"10月\\\",\\\"11月\\\",\\\"12月\\\"],\\\"series\\\": [{\\\"type\\\": \\\"bar\\\",\\\"name\\\": \\\"货运量\\\",\\\"data\\\": [2.6,5.9,9,26.4,28.7,70.7,175.6,182.2,48.7,18.8,6,2.3]},{\\\"type\\\": \\\"line\\\",\\\"name\\\": \\\"货运总量\\\",\\\"yAxisIndex\\\": 1,\\\"data\\\": [2,2.2,3.3,4.5,6.3,10.2,20.3,23.4,23,16.5,12,6.2]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-barlinechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartProperties\":{\"fail\":\"line\",\"datetime\":\"xAxis\",\"success\":\"bar\"},\"setCode\":\"log_ajwifiamount\",\"chartType\":\"widget-barlinechart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":1},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ED0E0E\"},{\"color\":\"#6CCD17\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1281},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":678},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":632},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":361}]}',
        NULL, 1, 0, 11, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7605, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":0,\"barEnd\":\"#004DA7FF\",\"reversalX\":0,\"minHeight\":0,\"marginRight\":40,\"textInterval\":1,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"我\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"wifi登陆趋势\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"\",\"textColor\":\"\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":0,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"areaThickness\":5,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"smoothCurve\":true,\"fontSizeX\":16,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"markPoint\":true,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":638,\"left\":1461,\"width\":266,\"index\":11,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"wifi登陆趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1461},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":638},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":266},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 12, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7606, 'log_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"right\",\"reversalY\":0,\"barEnd\":\"#004DA7FF\",\"reversalX\":0,\"minHeight\":0,\"marginRight\":40,\"textInterval\":1,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"我\",\"percentage\":false,\"layoutFront\":\"\",\"text\":\"日志大屏\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"\",\"textColor\":\"\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"barStart\":\"#00F4FFFF\",\"subTextFontSize\":0,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":60,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"#FAD400\",\"verticalShow\":true,\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"areaThickness\":5,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"numberValue\":true,\"xNameColor\":\"#fff\",\"lengedWidth\":10,\"fontSizeY\":12,\"smoothCurve\":true,\"fontSizeX\":16,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"NameFontSizeY\":12,\"markPoint\":true,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#0CD2E6\"},{\"color\":\"#00BFA5\"},{\"color\":\"#FFC722\"},{\"color\":\"#886EFF\"},{\"color\":\"#008DEC\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":17,\"left\":681,\"width\":550,\"index\":12,\"height\":75}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"日志大屏\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":60},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":681},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":17},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":550},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":75}]}',
        NULL, 1, 0, 13, 'admin', '2021-06-30 13:45:10', 'admin', '2021-06-30 13:45:10', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7688, 'car_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":22,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"datetime\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"car_ajpro\",\"chartType\":\"widget-linechart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '{}', '{\"top\":168,\"left\":-3,\"width\":935,\"index\":0,\"height\":272}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartProperties\":{\"datetime\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"car_ajpro\",\"chartType\":\"widget-linechart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":22},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":-3},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":168},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":935},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":272}]}',
        NULL, 1, 0, 1, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7689, 'car_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"datetime\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"car_ajsale\",\"chartType\":\"widget-linechart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '{}', '{\"top\":164,\"left\":947,\"width\":944,\"index\":1,\"height\":272}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartProperties\":{\"datetime\":\"xAxis\",\"nums\":\"line\"},\"setCode\":\"car_ajsale\",\"chartType\":\"widget-linechart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":947},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":164},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":944},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":272}]}',
        NULL, 1, 0, 2, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7690, 'car_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajproTop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":501,\"left\":15,\"width\":915,\"index\":2,\"height\":266}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajproTop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":15},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":501},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":915},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":266}]}',
        NULL, 1, 0, 3, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7691, 'car_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajsaleTop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":506,\"left\":943,\"width\":923,\"index\":3,\"height\":254}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajsaleTop5\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":943},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":506},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":923},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":254}]}',
        NULL, 1, 0, 4, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7692, 'car_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":true,\"reversalX\":false,\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"},{\"color\":\"#90EE90\"},{\"color\":\"#A3E0E1\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajunsale\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":826,\"left\":4,\"width\":591,\"index\":4,\"height\":220}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajunsale\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"},{\"color\":\"#90EE90\"},{\"color\":\"#A3E0E1\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":4},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":826},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":591},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":220}]}',
        NULL, 1, 0, 5, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7693, 'car_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajrework\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":825,\"left\":608,\"width\":657,\"index\":5,\"height\":220}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajrework\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":608},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":825},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":657},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":220}]}',
        NULL, 1, 0, 6, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7694, 'car_ajreport', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":true,\"reversalX\":true,\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajreturn\",\"chartType\":\"widget-barchart\",\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '{}', '{\"top\":827,\"left\":1279,\"width\":578,\"index\":6,\"height\":219}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":{\"chartProperties\":{\"brand\":\"xAxis\",\"nums\":\"bar\"},\"setCode\":\"car_ajreturn\",\"chartType\":\"widget-barchart\",\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1279},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":827},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":578},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":219}]}',
        NULL, 1, 0, 7, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7695, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"汽车生产销售大屏\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":50,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":24,\"left\":736,\"width\":406,\"index\":7,\"height\":75}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"汽车生产销售大屏\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":736},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":24},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":406},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":75}]}',
        NULL, 1, 0, 8, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7696, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"生产趋势\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":114,\"left\":349,\"width\":230,\"index\":8,\"height\":46}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"生产趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":349},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":114},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":230},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":46}]}',
        NULL, 1, 0, 9, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7697, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"销售趋势\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":112,\"left\":1340,\"width\":139,\"index\":9,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"销售趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1340},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":112},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":139},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 10, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7698, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"生产TOP5\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":451,\"left\":394,\"width\":157,\"index\":10,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"生产TOP5\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":394},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":451},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":157},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 11, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7699, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"销售TOP5\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":451,\"left\":1335,\"width\":131,\"index\":11,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"销售TOP5\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1335},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":451},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":131},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 12, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7700, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"滞销排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":778,\"left\":224,\"width\":139,\"index\":12,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"滞销排名\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":224},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":778},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":139},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 13, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7701, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"返修排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":772,\"left\":853,\"width\":166,\"index\":13,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"返修排名\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":853},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":772},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":166},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 14, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7702, 'car_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"marginRight\":40,\"minHeight\":0,\"textInterval\":0,\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"退货排名\",\"xName\":\"\",\"isShowY\":true,\"radius\":5,\"fontWeight\":\"normal\",\"height\":1080,\"maxWidth\":10,\"area\":true,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"verticalShow\":false,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '{}', '{\"top\":778,\"left\":1493,\"width\":167,\"index\":14,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"退货排名\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1493},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":778},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":167},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 15, 'admin', '2021-06-30 15:18:40', 'admin', '2021-06-30 15:18:40', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7736, 'acc_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":9,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":16,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":false,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajacc\",\"chartProperties\":{\"datetime\":\"xAxis\",\"access\":\"line\"},\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '', '{\"top\":185,\"left\":3,\"width\":932,\"index\":0,\"height\":405}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajacc\",\"chartProperties\":{\"datetime\":\"xAxis\",\"access\":\"line\"},\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":9}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":3},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":185},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":932},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":405}]}',
        NULL, 1, 0, 1, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7737, 'acc_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":9,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":11,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajregister\",\"chartProperties\":{\"datetime\":\"xAxis\",\"register\":\"line\"},\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '', '{\"top\":186,\"left\":946,\"width\":929,\"index\":1,\"height\":402}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajregister\",\"chartProperties\":{\"datetime\":\"xAxis\",\"register\":\"line\"},\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":11},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":9}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":946},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":186},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":929},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":402}]}',
        NULL, 1, 0, 2, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7738, 'acc_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":false,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajrt\",\"chartProperties\":{\"datetime\":\"xAxis\",\"rt\":\"line\"},\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":5000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '', '{\"top\":663,\"left\":3,\"width\":603,\"index\":2,\"height\":378}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":5000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajrt\",\"chartProperties\":{\"datetime\":\"xAxis\",\"rt\":\"line\"},\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":3},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":663},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":603},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":378}]}',
        NULL, 1, 0, 3, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7739, 'acc_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":false,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajqps\",\"chartProperties\":{\"datetime\":\"xAxis\",\"qps\":\"line\"},\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '', '{\"top\":665,\"left\":617,\"width\":620,\"index\":3,\"height\":377}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajqps\",\"chartProperties\":{\"datetime\":\"xAxis\",\"qps\":\"line\"},\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#1E90FF\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":617},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":665},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":620},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":377}]}',
        NULL, 1, 0, 4, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7740, 'acc_ajreport', 'widget-linechart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"fontSize\":0,\"marginBottom\":10,\"layerName\":\"折线图\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":true,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#FF8C00\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dynamicData\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajerror\",\"chartProperties\":{\"datetime\":\"xAxis\",\"error\":\"bar\"},\"contextData\":{}},\"dataType\":\"dynamicData\",\"refreshTime\":50000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"}',
        '', '{\"top\":666,\"left\":1248,\"width\":628,\"index\":4,\"height\":369}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"dynamicData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":50000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1009,3409,2309,5409,3409]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"chartType\":\"widget-linechart\",\"relactiveDomValue\":\"dynamicData\",\"value\":{\"chartType\":\"widget-linechart\",\"setCode\":\"acc_ajerror\",\"chartProperties\":{\"datetime\":\"xAxis\",\"error\":\"bar\"},\"contextData\":{}}}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"折线图\"},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"折线设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标记点\",\"name\":\"markPoint\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"点大小\",\"name\":\"pointSize\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-switch\",\"label\":\"平滑曲线\",\"name\":\"smoothCurve\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-switch\",\"label\":\"面积堆积\",\"name\":\"area\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-slider\",\"label\":\"面积厚度\",\"name\":\"areaThickness\",\"required\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"线条宽度\",\"name\":\"lineWidth\",\"required\":false,\"placeholder\":\"\",\"value\":4}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"##FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-text\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"left\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#FF8C00\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1248},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":666},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":628},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":369}]}',
        NULL, 1, 0, 5, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7741, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"访问大屏\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":50,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":37,\"left\":790,\"width\":299,\"index\":5,\"height\":77}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"访问大屏\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":790},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":37},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":299},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":77}]}',
        NULL, 1, 0, 6, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7742, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"访问人数变化趋势\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":144,\"left\":341,\"width\":248,\"index\":6,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"访问人数变化趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":341},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":144},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":248},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 7, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7743, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"注册人数变化趋势\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":139,\"left\":1299,\"width\":249,\"index\":7,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"注册人数变化趋势\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1299},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":139},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":249},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 8, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7744, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统RT\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":620,\"left\":213,\"width\":113,\"index\":8,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"系统RT\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":213},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":620},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":113},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 9, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7745, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统QPS\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":624,\"left\":854,\"width\":130,\"index\":9,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"系统QPS\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":854},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":624},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":130},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 10, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7746, 'acc_ajreport', 'widget-text',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"left\",\"reversalY\":false,\"reversalX\":false,\"marginRight\":40,\"textInterval\":0,\"isNoTitle\":false,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"text\":\"系统ERROR\",\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"height\":1080,\"area\":true,\"textAlign\":\"center\",\"lineColor\":\"\",\"subTextColor\":\"#fff\",\"textColor\":\"##FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"rgba(115,170,229,.0)\",\"fontSize\":26,\"marginBottom\":10,\"layerName\":\"文本框\",\"hideX\":true,\"color\":\"rgba(0, 206, 209, 1)\",\"backgroundImage\":\"http://10.108.26.197/business/file/download/adfc22ac-ed7f-4141-aeb9-ee81f16ac92d\",\"NameColorY\":\"#fff\",\"title\":\"大屏\",\"isShowSplitLineX\":false,\"lineWidth\":4,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"areaThickness\":5,\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"smoothCurve\":true,\"fontSizeY\":12,\"fontSizeX\":12,\"backgroundColor\":\"#000\",\"colorY\":\"#fff\",\"letterSpacing\":0,\"markPoint\":true,\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"pointSize\":10,\"customColor\":[{\"color\":\"#1E90FF\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"width\":1920,\"isShowLegend\":true,\"marginTop\":50}',
        '{}', '', '{\"top\":624,\"left\":1467,\"width\":180,\"index\":10,\"height\":40}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"系统ERROR\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":26},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(0, 206, 209, 1)\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":1467},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":624},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":180},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 11, 'admin', '2021-06-30 15:32:26', 'admin', '2021-06-30 15:32:26', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7778, 'blank', 'widget-text',
        '{\"color\":\"#FAD400\",\"textAlign\":\"center\",\"background\":\"rgba(115,170,229,.0)\",\"letterSpacing\":\"0\",\"fontSize\":\"26\",\"layerName\":\"文本框\",\"text\":\"文本框\",\"fontWeight\":\"normal\"}',
        '{}', '', '{\"top\":0,\"left\":0,\"width\":100,\"height\":40,\"zIndex\":0}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-text\",\"label\":\"文本内容\",\"name\":\"text\",\"required\":false,\"placeholder\":\"\",\"value\":\"文本框\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":\"26\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"color\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FAD400\"},{\"type\":\"el-input-number\",\"label\":\"字体间距\",\"name\":\"letterSpacing\",\"required\":false,\"placeholder\":\"\",\"value\":\"0\"},{\"type\":\"vue-color\",\"label\":\"字体背景\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(115,170,229,.0)\"},{\"type\":\"el-select\",\"label\":\"文字粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-select\",\"label\":\"对齐方式\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":100},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":40}]}',
        NULL, 1, 0, 1, 'admin', '2021-07-01 15:39:56', 'admin', '2021-07-01 15:39:56', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7779, 'blank', 'widget-barchart',
        '{\"lengedColor\":\"#fff\",\"lateralPosition\":\"\",\"reversalY\":false,\"reversalX\":\"\",\"minHeight\":0,\"marginRight\":40,\"textInterval\":\"\",\"isNoTitle\":true,\"textFontWeight\":\"normal\",\"titleText\":\"\",\"layoutFront\":\"\",\"radius\":5,\"xName\":\"\",\"isShowY\":true,\"fontWeight\":\"normal\",\"maxWidth\":10,\"textAlign\":\"center\",\"subTextColor\":\"#fff\",\"textColor\":\"#FFD700\",\"subText\":\"\",\"lineColorY\":\"#fff\",\"xNameFontSize\":12,\"lineColorX\":\"#fff\",\"textNameY\":\"\",\"marginLeft\":10,\"subTextFontSize\":20,\"background\":\"\",\"marginBottom\":10,\"layerName\":\"柱状图\",\"hideX\":true,\"verticalShow\":false,\"NameColorY\":\"#fff\",\"isShowSplitLineX\":false,\"isShowSplitLineY\":false,\"splitLineColorY\":\"#fff\",\"lengedFontSize\":16,\"splitLineColorX\":\"#fff\",\"textAngle\":0,\"Xcolor\":\"#fff\",\"xNameColor\":\"#fff\",\"lengedWidth\":15,\"fontSizeY\":12,\"fontSizeX\":12,\"colorY\":\"#fff\",\"NameFontSizeY\":12,\"isShow\":false,\"textFontSize\":20,\"customColor\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}],\"longitudinalPosition\":\"\",\"subTextFontWeight\":\"normal\",\"isShowLegend\":true,\"marginTop\":50}',
        '{\"dataType\":\"staticData\",\"refreshTime\":5000,\"staticData\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"}',
        '', '{\"top\":267,\"left\":659,\"width\":400,\"index\":1,\"height\":200}',
        '{\"data\":[{\"type\":\"el-radio-group\",\"label\":\"数据类型\",\"name\":\"dataType\",\"require\":false,\"placeholder\":\"\",\"selectValue\":true,\"selectOptions\":[{\"code\":\"staticData\",\"name\":\"静态数据\"},{\"code\":\"dynamicData\",\"name\":\"动态数据\"}],\"value\":\"staticData\"},{\"type\":\"el-input-number\",\"label\":\"刷新时间(毫秒)\",\"name\":\"refreshTime\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"value\":5000},{\"type\":\"el-button\",\"label\":\"静态数据\",\"name\":\"staticData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"staticData\",\"value\":\"{\\\"categories\\\": [\\\"苹果\\\",\\\"三星\\\",\\\"小米\\\",\\\"oppo\\\",\\\"vivo\\\"],\\\"series\\\": [{\\\"name\\\": \\\"手机品牌\\\",\\\"data\\\": [1000,2229,3879,2379,4079]}]}\"},{\"type\":\"dycustComponents\",\"label\":\"\",\"name\":\"dynamicData\",\"required\":false,\"placeholder\":\"px\",\"relactiveDom\":\"dataType\",\"relactiveDomValue\":\"dynamicData\",\"chartType\":\"widget-barchart\",\"value\":\"\"}],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"柱状图\"},{\"type\":\"el-switch\",\"label\":\"竖展示\",\"name\":\"verticalShow\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"背景颜色\",\"name\":\"background\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},[{\"name\":\"柱体设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"最大宽度\",\"name\":\"maxWidth\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"圆角\",\"name\":\"radius\",\"require\":false,\"placeholder\":\"\",\"value\":5},{\"type\":\"el-slider\",\"label\":\"最小高度\",\"name\":\"minHeight\",\"require\":false,\"placeholder\":\"\",\"value\":0}]},{\"name\":\"标题设置\",\"list\":[{\"type\":\"el-switch\",\"label\":\"标题\",\"name\":\"isNoTitle\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"el-input-text\",\"label\":\"标题\",\"name\":\"titleText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"textColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#FFD700\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"textFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"textFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20},{\"type\":\"el-select\",\"label\":\"字体位置\",\"name\":\"textAlign\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"center\",\"name\":\"居中\"},{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"center\"},{\"type\":\"el-input-text\",\"label\":\"副标题\",\"name\":\"subText\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"rgba(30, 144, 255, 1)\"},{\"type\":\"el-input-text\",\"label\":\"字体粗细\",\"name\":\"subTextFontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"subTextFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":20}]},{\"name\":\"X轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"xName\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"hideX\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"xNameColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"xNameFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-slider\",\"label\":\"文字角度\",\"name\":\"textAngle\",\"required\":false,\"placeholder\":\"\",\"value\":0},{\"type\":\"el-input-number\",\"label\":\"文字间隔\",\"name\":\"textInterval\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalX\",\"required\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"Xcolor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeX\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineX\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorX\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"Y轴设置\",\"list\":[{\"type\":\"el-input-text\",\"label\":\"名称\",\"name\":\"textNameY\",\"require\":false,\"placeholder\":\"\",\"value\":\"\"},{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShowY\",\"require\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"坐标名颜色\",\"name\":\"NameColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"NameFontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"el-switch\",\"label\":\"轴反转\",\"name\":\"reversalY\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"颜色\",\"name\":\"colorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字号\",\"name\":\"fontSizeY\",\"required\":false,\"placeholder\":\"\",\"value\":12},{\"type\":\"vue-color\",\"label\":\"轴颜色\",\"name\":\"lineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-switch\",\"label\":\"分割线显示\",\"name\":\"isShowSplitLineY\",\"require\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"vue-color\",\"label\":\"分割线颜色\",\"name\":\"splitLineColorY\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"}]},{\"name\":\"数值设定\",\"list\":[{\"type\":\"el-switch\",\"label\":\"显示\",\"name\":\"isShow\",\"required\":false,\"placeholder\":\"\",\"value\":false},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\",\"value\":14},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"subTextColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-select\",\"label\":\"字体粗细\",\"name\":\"fontWeight\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"normal\",\"name\":\"正常\"},{\"code\":\"bold\",\"name\":\"粗体\"},{\"code\":\"bolder\",\"name\":\"特粗体\"},{\"code\":\"lighter\",\"name\":\"细体\"}],\"value\":\"normal\"}]},{\"name\":\"提示语设置\",\"list\":[{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"fontSize\",\"required\":false,\"placeholder\":\"\"},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lineColor\",\"required\":false,\"placeholder\":\"\"}]},{\"name\":\"坐标轴边距设置\",\"list\":[{\"type\":\"el-slider\",\"label\":\"左边距(像素)\",\"name\":\"marginLeft\",\"required\":false,\"placeholder\":\"\",\"value\":10},{\"type\":\"el-slider\",\"label\":\"顶边距(像素)\",\"name\":\"marginTop\",\"required\":false,\"placeholder\":\"\",\"value\":50},{\"type\":\"el-slider\",\"label\":\"右边距(像素)\",\"name\":\"marginRight\",\"required\":false,\"placeholder\":\"\",\"value\":40},{\"type\":\"el-slider\",\"label\":\"底边距(像素)\",\"name\":\"marginBottom\",\"required\":false,\"placeholder\":\"\",\"value\":10}]},{\"name\":\"图例操作\",\"list\":[{\"type\":\"el-switch\",\"label\":\"图例\",\"name\":\"isShowLegend\",\"required\":false,\"placeholder\":\"\",\"value\":true},{\"type\":\"vue-color\",\"label\":\"字体颜色\",\"name\":\"lengedColor\",\"required\":false,\"placeholder\":\"\",\"value\":\"#fff\"},{\"type\":\"el-input-number\",\"label\":\"字体大小\",\"name\":\"lengedFontSize\",\"required\":false,\"placeholder\":\"\",\"value\":16},{\"type\":\"el-input-number\",\"label\":\"图例宽度\",\"name\":\"lengedWidth\",\"required\":false,\"placeholder\":\"\",\"value\":15},{\"type\":\"el-select\",\"label\":\"横向位置\",\"name\":\"lateralPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"left\",\"name\":\"左对齐\"},{\"code\":\"right\",\"name\":\"右对齐\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"纵向位置\",\"name\":\"longitudinalPosition\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"top\",\"name\":\"顶部\"},{\"code\":\"bottom\",\"name\":\"底部\"}],\"value\":\"\"},{\"type\":\"el-select\",\"label\":\"布局前置\",\"name\":\"layoutFront\",\"required\":false,\"placeholder\":\"\",\"selectOptions\":[{\"code\":\"vertical\",\"name\":\"竖排\"},{\"code\":\"horizontal\",\"name\":\"横排\"}],\"value\":\"\"}]},{\"name\":\"自定义配色\",\"list\":[{\"type\":\"customColor\",\"label\":\"\",\"name\":\"customColor\",\"required\":false,\"value\":[{\"color\":\"#ff7f50\"},{\"color\":\"#87cefa\"},{\"color\":\"#da70d6\"},{\"color\":\"#32cd32\"},{\"color\":\"#6495ed\"}]}]}]],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":659},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":267},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":400},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":200}]}',
        NULL, 1, 0, 2, 'admin', '2021-07-01 15:39:56', 'admin', '2021-07-01 15:39:56', 1);
INSERT INTO `gaea_report_dashboard_widget`
VALUES (7780, 'blank', 'widget-map', '{\"layerName\":\"迁徙图\"}', '{}', '',
        '{\"top\":137,\"left\":524,\"width\":836,\"index\":2,\"height\":565}',
        '{\"data\":[],\"setup\":[{\"type\":\"el-input-text\",\"label\":\"图层名称\",\"name\":\"layerName\",\"required\":false,\"placeholder\":\"\",\"value\":\"迁徙图\"}],\"position\":[{\"type\":\"el-input-number\",\"label\":\"左边距\",\"name\":\"left\",\"required\":false,\"placeholder\":\"px\",\"value\":524},{\"type\":\"el-input-number\",\"label\":\"上边距\",\"name\":\"top\",\"required\":false,\"placeholder\":\"px\",\"value\":137},{\"type\":\"el-input-number\",\"label\":\"宽度\",\"name\":\"width\",\"required\":false,\"placeholder\":\"该容器在1920px大屏中的宽度\",\"value\":836},{\"type\":\"el-input-number\",\"label\":\"高度\",\"name\":\"height\",\"required\":false,\"placeholder\":\"该容器在1080px大屏中的高度\",\"value\":565}]}',
        NULL, 1, 0, 3, 'admin', '2021-07-01 15:39:56', 'admin', '2021-07-01 15:39:56', 1);


-- ----------------------------
-- Table structure for gaea_report_data_set
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_data_set`;
CREATE TABLE `gaea_report_data_set`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `set_code`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集编码',
    `set_name`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集名称',
    `set_desc`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集描述',
    `source_code`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
    `dyn_sentence` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态查询sql或者接口中的请求体',
    `case_result`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结果案例',
    `enable_flag`  int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`  int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`      int(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unique_set_code`(`set_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report_data_set
-- ----------------------------
INSERT INTO `gaea_report_data_set`
VALUES (46, 'log_ajdevices', '日志-资产统计', '', 'mysql_ajreport',
        'SELECT device_type,COUNT(device_id)as nums from aj_report_devices GROUP BY device_type;',
        '[{\"device_type\":\"交换机\",\"nums\":12},{\"device_type\":\"服务器\",\"nums\":10},{\"device_type\":\"路由器\",\"nums\":4},{\"device_type\":\"防火墙\",\"nums\":2}]',
        1, 0, 'admin', '2021-06-30 09:57:47', 'admin', '2021-06-30 09:57:47', 1);
INSERT INTO `gaea_report_data_set`
VALUES (47, 'log_ajfireacl', '日志-防火墙ACL次数', '', 'mysql_ajreport',
        'SELECT acl_type,COUNT(id) as nums from aj_report_init.aj_report_fireacl GROUP BY acl_type;',
        '[{\"acl_type\":\"LDAP389\",\"nums\":13},{\"acl_type\":\"Server1433\",\"nums\":9},{\"acl_type\":\"共享文件445\",\"nums\":7},{\"acl_type\":\"存储514\",\"nums\":14},{\"acl_type\":\"网页浏览443\",\"nums\":31},{\"acl_type\":\"远程桌面3389\",\"nums\":62},{\"acl_type\":\"远程登陆23\",\"nums\":66}]',
        1, 0, 'admin', '2021-06-30 10:41:36', 'admin', '2021-06-30 10:41:36', 1);
INSERT INTO `gaea_report_data_set`
VALUES (48, 'log_ajattack', '日志-攻击占比', '', 'mysql_ajreport',
        'SELECT attack_type,COUNT(id)as nums from aj_report_fireattack GROUP BY attack_type;',
        '[{\"attack_type\":\"SQL注入\",\"nums\":9},{\"attack_type\":\"UDP\",\"nums\":11},{\"attack_type\":\"WEB\",\"nums\":7},{\"attack_type\":\"僵尸网络\",\"nums\":24},{\"attack_type\":\"弱口令\",\"nums\":6},{\"attack_type\":\"端口扫描\",\"nums\":16},{\"attack_type\":\"网站扫描\",\"nums\":8},{\"attack_type\":\"超大ICMP\",\"nums\":19}]',
        1, 0, 'admin', '2021-06-30 10:44:01', 'admin', '2021-06-30 13:13:56', 3);
INSERT INTO `gaea_report_data_set`
VALUES (50, 'log_ajmailfailtop5', '日志-邮件认证失败top5', '', 'mysql_ajreport',
        'SELECT username,count(id)as nums from aj_report_mail WHERE status=0 GROUP BY username ORDER BY nums desc limit 5;',
        '[{\"nums\":63,\"username\":\"zhangsi\"},{\"nums\":52,\"username\":\"wangwu\"},{\"nums\":39,\"username\":\"liliu\"},{\"nums\":39,\"username\":\"IT1\"},{\"nums\":30,\"username\":\"IT2\"}]',
        1, 0, 'admin', '2021-06-30 11:07:53', 'admin', '2021-06-30 11:07:53', 1);
INSERT INTO `gaea_report_data_set`
VALUES (51, 'log_ajmailfail', '日志-邮件认证失败趋势', '', 'mysql_ajreport',
        'SELECT DATE_FORMAT(create_time,\'%Y-%m-%d\')as date,count(id)as nums from aj_report_mail WHERE status=0 \ngroup by date',
        '[{\"date\":\"2021-06-21\",\"nums\":25},{\"date\":\"2021-06-22\",\"nums\":16},{\"date\":\"2021-06-23\",\"nums\":89},{\"date\":\"2021-06-24\",\"nums\":61},{\"date\":\"2021-06-25\",\"nums\":53}]',
        1, 0, 'admin', '2021-06-30 12:58:19', 'admin', '2021-06-30 12:58:19', 1);
INSERT INTO `gaea_report_data_set`
VALUES (52, 'log_ajwifiamount', '日志-wifi登陆趋势', '', 'mysql_ajreport', 'SELECT * from aj_report_wifiamount;',
        '[{\"fail\":15,\"datetime\":\"2021-06-17\",\"success\":210},{\"fail\":43,\"datetime\":\"2021-06-18\",\"success\":234},{\"fail\":28,\"datetime\":\"2021-06-19\",\"success\":199},{\"fail\":80,\"datetime\":\"2021-06-20\",\"success\":260},{\"fail\":45,\"datetime\":\"2021-06-21\",\"success\":245},{\"fail\":26,\"datetime\":\"2021-06-22\",\"success\":216},{\"fail\":10,\"datetime\":\"2021-06-23\",\"success\":150}]',
        1, 0, 'admin', '2021-06-30 13:07:35', 'admin', '2021-06-30 13:07:35', 1);
INSERT INTO `gaea_report_data_set`
VALUES (53, 'car_ajpro', '汽车-生产趋势', '', 'mysql_ajreport',
        'SELECT datetime,sum(manus)as nums from aj_report_manus GROUP BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"nums\":252},{\"datetime\":\"2021-06-19\",\"nums\":133},{\"datetime\":\"2021-06-20\",\"nums\":189},{\"datetime\":\"2021-06-21\",\"nums\":219},{\"datetime\":\"2021-06-22\",\"nums\":159}]',
        1, 0, 'admin', '2021-06-30 14:23:02', 'admin', '2021-06-30 14:23:02', 1);
INSERT INTO `gaea_report_data_set`
VALUES (54, 'car_ajsale', '汽车-销售趋势', '', 'mysql_ajreport',
        'SELECT datetime,sum(sales)as nums from aj_report_manus GROUP BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"nums\":231},{\"datetime\":\"2021-06-19\",\"nums\":140},{\"datetime\":\"2021-06-20\",\"nums\":170},{\"datetime\":\"2021-06-21\",\"nums\":191},{\"datetime\":\"2021-06-22\",\"nums\":144}]',
        1, 0, 'admin', '2021-06-30 14:24:33', 'admin', '2021-06-30 14:24:33', 1);
INSERT INTO `gaea_report_data_set`
VALUES (55, 'car_ajproTop5', '汽车-生产TOP5', '', 'mysql_ajreport',
        'SELECT brand,sum(manus)as nums from aj_report_manus GROUP BY brand ORDER BY nums desc limit 5;',
        '[{\"brand\":\"E-30\",\"nums\":215},{\"brand\":\"C-50\",\"nums\":210},{\"brand\":\"D-40\",\"nums\":175},{\"brand\":\"A-100\",\"nums\":100},{\"brand\":\"A-110\",\"nums\":97}]',
        1, 0, 'admin', '2021-06-30 14:26:55', 'admin', '2021-06-30 14:26:55', 1);
INSERT INTO `gaea_report_data_set`
VALUES (56, 'car_ajsaleTop5', '汽车-销售TOP5', '', 'mysql_ajreport',
        'SELECT brand,sum(sales)as nums from aj_report_manus GROUP BY brand ORDER BY nums desc limit 5;',
        '[{\"brand\":\"E-30\",\"nums\":221},{\"brand\":\"C-50\",\"nums\":189},{\"brand\":\"D-40\",\"nums\":169},{\"brand\":\"A-100\",\"nums\":81},{\"brand\":\"B-100\",\"nums\":80}]',
        1, 0, 'admin', '2021-06-30 14:30:00', 'admin', '2021-06-30 14:30:00', 1);
INSERT INTO `gaea_report_data_set`
VALUES (57, 'car_ajunsale', '汽车-滞销', '', 'mysql_ajreport',
        'SELECT brand,sum(unsales) as nums from aj_report_manus GROUP BY brand ORDER BY nums desc;',
        '[{\"brand\":\"C-50\",\"nums\":21},{\"brand\":\"A-110\",\"nums\":20},{\"brand\":\"A-100\",\"nums\":19},{\"brand\":\"B-110\",\"nums\":11},{\"brand\":\"E-30\",\"nums\":9},{\"brand\":\"D-40\",\"nums\":6},{\"brand\":\"B-100\",\"nums\":5}]',
        1, 0, 'admin', '2021-06-30 14:30:46', 'admin', '2021-06-30 14:30:46', 1);
INSERT INTO `gaea_report_data_set`
VALUES (58, 'car_ajrework', '汽车-返修', '', 'mysql_ajreport',
        'SELECT brand,sum(rework) as nums from aj_report_manus GROUP BY brand ORDER BY nums desc;',
        '[{\"brand\":\"E-30\",\"nums\":58},{\"brand\":\"D-40\",\"nums\":27},{\"brand\":\"C-50\",\"nums\":22},{\"brand\":\"A-100\",\"nums\":5},{\"brand\":\"A-110\",\"nums\":5},{\"brand\":\"B-110\",\"nums\":5},{\"brand\":\"B-100\",\"nums\":4}]',
        1, 0, 'admin', '2021-06-30 14:31:16', 'admin', '2021-06-30 14:31:16', 1);
INSERT INTO `gaea_report_data_set`
VALUES (59, 'car_ajreturn', '汽车-退货', '', 'mysql_ajreport',
        'SELECT brand,sum(`return`) as nums from aj_report_manus GROUP BY brand ORDER BY nums desc;',
        '[{\"brand\":\"E-30\",\"nums\":24},{\"brand\":\"C-50\",\"nums\":10},{\"brand\":\"D-40\",\"nums\":6},{\"brand\":\"A-110\",\"nums\":2},{\"brand\":\"B-110\",\"nums\":1},{\"brand\":\"A-100\",\"nums\":0},{\"brand\":\"B-100\",\"nums\":0}]',
        1, 0, 'admin', '2021-06-30 14:31:45', 'admin', '2021-06-30 14:31:45', 1);
INSERT INTO `gaea_report_data_set`
VALUES (60, 'acc_ajacc', '访问-访问人数趋势', '', 'mysql_ajreport',
        'SELECT datetime,access from aj_report_access ORDER BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"access\":1000},{\"datetime\":\"2021-06-19\",\"access\":1200},{\"datetime\":\"2021-06-20\",\"access\":1600},{\"datetime\":\"2021-06-21\",\"access\":2000},{\"datetime\":\"2021-06-22\",\"access\":800}]',
        1, 0, 'admin', '2021-06-30 15:15:17', 'admin', '2021-06-30 15:16:04', 2);
INSERT INTO `gaea_report_data_set`
VALUES (61, 'acc_ajregister', '访问-注册人数趋势', '', 'mysql_ajreport',
        'SELECT datetime,register from aj_report_access ORDER BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"register\":12},{\"datetime\":\"2021-06-19\",\"register\":20},{\"datetime\":\"2021-06-20\",\"register\":40},{\"datetime\":\"2021-06-21\",\"register\":100},{\"datetime\":\"2021-06-22\",\"register\":30}]',
        1, 0, 'admin', '2021-06-30 15:15:55', 'admin', '2021-06-30 15:15:55', 1);
INSERT INTO `gaea_report_data_set`
VALUES (62, 'acc_ajrt', '访问-系统RT', '', 'mysql_ajreport', 'SELECT datetime,rt from aj_report_exper ORDER BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"rt\":90.92},{\"datetime\":\"2021-06-19\",\"rt\":100.02},{\"datetime\":\"2021-06-20\",\"rt\":98.89},{\"datetime\":\"2021-06-21\",\"rt\":110.99},{\"datetime\":\"2021-06-22\",\"rt\":89.78}]',
        1, 0, 'admin', '2021-06-30 15:16:37', 'admin', '2021-07-01 16:06:00', 2);
INSERT INTO `gaea_report_data_set`
VALUES (63, 'acc_ajqps', '访问-系统QPS', '', 'mysql_ajreport',
        'SELECT datetime,qps from aj_report_exper ORDER BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"qps\":9000},{\"datetime\":\"2021-06-19\",\"qps\":10000},{\"datetime\":\"2021-06-20\",\"qps\":9560},{\"datetime\":\"2021-06-21\",\"qps\":13456},{\"datetime\":\"2021-06-22\",\"qps\":8990}]',
        1, 0, 'admin', '2021-06-30 15:19:06', 'admin', '2021-06-30 15:19:06', 1);
INSERT INTO `gaea_report_data_set`
VALUES (64, 'acc_ajerror', '访问-系统ERROR', '', 'mysql_ajreport',
        'SELECT datetime,error from aj_report_exper ORDER BY datetime;',
        '[{\"datetime\":\"2021-06-18\",\"error\":2},{\"datetime\":\"2021-06-19\",\"error\":3},{\"datetime\":\"2021-06-20\",\"error\":1},{\"datetime\":\"2021-06-21\",\"error\":9},{\"datetime\":\"2021-06-22\",\"error\":3}]',
        1, 0, 'admin', '2021-06-30 15:19:33', 'admin', '2021-06-30 15:19:33', 1);

-- ----------------------------
-- Table structure for gaea_report_data_set_param
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_data_set_param`;
CREATE TABLE `gaea_report_data_set_param`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `set_code`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集编码',
    `param_name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
    `param_desc`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
    `param_type`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型，字典=',
    `sample_item`      varchar(1080) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数示例项',
    `required_flag`    int(1) NULL DEFAULT 1 COMMENT '0--非必填 1--必填 DIC_NAME=REQUIRED_FLAG',
    `validation_rules` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'js校验字段值规则，满足校验返回 true',
    `order_num`        int(11) NULL DEFAULT NULL COMMENT '排序',
    `enable_flag`      int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`      int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`      datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`      datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`          int(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集查询参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report_data_set_param
-- ----------------------------


-- ----------------------------
-- Table structure for gaea_report_data_set_transform
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_data_set_transform`;
CREATE TABLE `gaea_report_data_set_transform`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `set_code`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集编码',
    `transform_type`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据转换类型，DIC_NAME=TRANSFORM_TYPE; js，javaBean，字典转换',
    `transform_script` varchar(10800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据转换script,处理逻辑',
    `order_num`        int(2) NULL DEFAULT NULL COMMENT '排序,执行数据转换顺序',
    `enable_flag`      int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`      int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`      datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`      datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`          int(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集数据转换' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_report_data_set_transform
-- ----------------------------


-- ----------------------------
-- Table structure for gaea_report_data_source
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_data_source`;
CREATE TABLE `gaea_report_data_source`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `source_code`   varchar(100)  DEFAULT NULL COMMENT '数据源编码',
    `source_name`   varchar(100)  DEFAULT NULL COMMENT '数据源名称',
    `source_desc`   varchar(255)  DEFAULT NULL COMMENT '数据源描述',
    `source_type`   varchar(50)   DEFAULT NULL COMMENT '数据源类型 DIC_NAME=SOURCE_TYPE; mysql，orace，sqlserver，elasticsearch，接口，javaBean，数据源类型字典中item-extend动态生成表单',
    `source_config` varchar(2048) DEFAULT NULL COMMENT '数据源连接配置json：关系库{ jdbcUrl:'''', username:'''', password:'''' } ES{ hostList:''ip1:9300,ip2:9300,ip3:9300'', clusterName:''elasticsearch_cluster'' }  接口{ apiUrl:''http://ip:port/url'', method:'''' } javaBean{ beanNamw:''xxx'' }',
    `enable_flag`   int(1) DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`   int(1) DEFAULT '0' COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`     varchar(255)  DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime      DEFAULT NULL COMMENT '创建时间',
    `update_by`     varchar(255)  DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime      DEFAULT NULL COMMENT '更新时间',
    `version`       int(8) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `unique_source_code` (`source_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='数据源管理';


INSERT INTO `gaea_report_data_source`
VALUES (1, 'mysql_ajreport', 'mysql数据源', '', 'mysql',
        '{\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"jdbcUrl\":\"jdbc:mysql://127.0.0.1:3306/aj_report_init?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT%2B8\",\"username\":\"ajreport\",\"password\":\"ajreport\"}',
        1, 0, 'admin', '2021-06-30 09:48:46', 'admin', '2021-06-30 09:48:46', 1);

-- ----------------------------
-- Table structure for gaea_user
-- ----------------------------
DROP TABLE IF EXISTS `gaea_user`;
CREATE TABLE `gaea_user`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `password`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `update_time` datetime(0) NULL DEFAULT NULL,
    `version`     tinyint(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1094 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gaea_user
-- ----------------------------
INSERT INTO `gaea_user`
VALUES (1, 'admin', 'afbc19467fbff0690b5eba5209d0e966', 'admin', '2021-06-24 10:21:34', 'admin', '2021-06-24 10:21:40',
        NULL);
INSERT INTO `gaea_user`
VALUES (2, 'guest', '5632ad5d163ccaf1ecc305315a1a8e16', 'guest', '2021-06-30 16:48:03', 'guest', '2021-06-30 16:48:11',
        NULL);


/*
 Navicat Premium Data Transfer

 Source Server         : 10.108.26.197gaea-dev
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 10.108.26.197:3306
 Source Schema         : aj_report_init

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 01/07/2021 16:43:26
*/


CREATE
DATABASE IF NOT EXISTS aj_report_init DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use
aj_report_init;
-- ----------------------------
-- Table structure for aj_report_access
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_access`;
CREATE TABLE `aj_report_access`
(
    `datetime` date NOT NULL,
    `access`   int(11) NULL DEFAULT NULL COMMENT '访问量',
    `register` int(11) NULL DEFAULT NULL COMMENT '注册量',
    PRIMARY KEY (`datetime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_access
-- ----------------------------
INSERT INTO `aj_report_access`
VALUES ('2021-06-18', 1000, 12);
INSERT INTO `aj_report_access`
VALUES ('2021-06-19', 1200, 20);
INSERT INTO `aj_report_access`
VALUES ('2021-06-20', 1600, 40);
INSERT INTO `aj_report_access`
VALUES ('2021-06-21', 2000, 100);
INSERT INTO `aj_report_access`
VALUES ('2021-06-22', 800, 30);

-- ----------------------------
-- Table structure for aj_report_common1
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_common1`;
CREATE TABLE `aj_report_common1`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `nums` int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_common1
-- ----------------------------
INSERT INTO `aj_report_common1`
VALUES (1, '上海', 500);
INSERT INTO `aj_report_common1`
VALUES (2, '北京', 600);
INSERT INTO `aj_report_common1`
VALUES (3, '西安', 1000);
INSERT INTO `aj_report_common1`
VALUES (4, '河南', 1200);
INSERT INTO `aj_report_common1`
VALUES (5, '武汉', 2000);

-- ----------------------------
-- Table structure for aj_report_devices
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_devices`;
CREATE TABLE `aj_report_devices`
(
    `device_id`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
    `device_name`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
    `device_type`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型',
    `device_type_code` int(11) NULL DEFAULT NULL COMMENT '设备类型编号',
    `online_time`      datetime(0) NULL DEFAULT NULL COMMENT '上线日期',
    `device_state`     int(255) NULL DEFAULT NULL COMMENT '1上线，0下线',
    PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_devices
-- ----------------------------
INSERT INTO `aj_report_devices`
VALUES ('f00001', '11楼防火墙服务器f01A', '防火墙', 1, '2021-06-23 10:24:16', 1);
INSERT INTO `aj_report_devices`
VALUES ('f00002', '11楼防火墙服务器f01B', '防火墙', 1, '2021-06-23 10:24:16', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00001', '1楼总交换机j102A', '交换机', 1, '2021-06-23 10:05:10', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00002', '1楼分交换机j104B', '交换机', 1, '2021-06-23 10:05:44', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00003', '1楼分交换机j106C', '交换机', 1, '2021-06-23 10:06:12', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00004', '1楼分交换机j109D', '交换机', 1, '2021-06-23 10:07:21', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00005', '2楼总交换机j202A', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00006', '2楼分交换机j204B', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00007', '2楼分交换机j206C', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00008', '2楼分交换机j209D', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00009', '3楼总交换机j302A', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00010', '3楼分交换机j304B', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00011', '4楼总交换机j402A', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('j00012', '4楼分交换机j409B', '交换机', 1, '2021-06-23 10:15:38', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00001', '1楼服务器s101A', '服务器', 1, '2021-06-23 09:55:35', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00002', '2楼服务器s201A', '服务器', 1, '2021-06-23 09:59:39', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00003', '3楼服务器s301A', '服务器', 1, '2021-06-23 10:00:02', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00004', '4楼服务器s401A', '服务器', 1, '2021-06-23 10:00:23', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00005', '4楼服务器s401B', '服务器', 1, '2021-06-23 10:01:10', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00006', '11楼服务器1101A', '服务器', 1, '2021-06-23 10:09:26', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00007', '11楼服务器1101B', '服务器', 1, '2021-06-23 10:09:26', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00008', '11楼服务器1101C', '服务器', 1, '2021-06-23 10:09:26', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00009', '11楼服务器1101D', '服务器', 1, '2021-06-23 10:09:26', 1);
INSERT INTO `aj_report_devices`
VALUES ('s00010', '11楼服务器1101E', '服务器', 1, '2021-06-23 10:09:26', 1);
INSERT INTO `aj_report_devices`
VALUES ('w00001', '1楼路由器', '路由器', 1, '2021-06-23 10:21:14', 1);
INSERT INTO `aj_report_devices`
VALUES ('w00002', '2楼路由器', '路由器', 1, '2021-06-23 10:21:14', 1);
INSERT INTO `aj_report_devices`
VALUES ('w00003', '3楼路由器', '路由器', 1, '2021-06-23 10:21:14', 1);
INSERT INTO `aj_report_devices`
VALUES ('w00004', '4楼路由器', '路由器', 1, '2021-06-23 10:21:14', 1);

-- ----------------------------
-- Table structure for aj_report_exper
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_exper`;
CREATE TABLE `aj_report_exper`
(
    `datetime` date NOT NULL,
    `rt`       double(11, 2
) NULL DEFAULT NULL,
  `qps` bigint(11) NULL DEFAULT NULL,
  `error` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`datetime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_exper
-- ----------------------------
INSERT INTO `aj_report_exper`
VALUES ('2021-06-18', 90.92, 9000, 2);
INSERT INTO `aj_report_exper`
VALUES ('2021-06-19', 100.02, 10000, 3);
INSERT INTO `aj_report_exper`
VALUES ('2021-06-20', 98.89, 9560, 1);
INSERT INTO `aj_report_exper`
VALUES ('2021-06-21', 110.99, 13456, 9);
INSERT INTO `aj_report_exper`
VALUES ('2021-06-22', 89.78, 8990, 3);

-- ----------------------------
-- Table structure for aj_report_fireacl
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_fireacl`;
CREATE TABLE `aj_report_fireacl`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `acl_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'acl类型',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_fireacl
-- ----------------------------
INSERT INTO `aj_report_fireacl`
VALUES (1, '网页浏览443', '2021-06-23 10:50:41');
INSERT INTO `aj_report_fireacl`
VALUES (2, '网页浏览443', '2021-06-23 10:51:11');
INSERT INTO `aj_report_fireacl`
VALUES (3, '网页浏览443', '2021-06-23 10:51:47');
INSERT INTO `aj_report_fireacl`
VALUES (4, '网页浏览443', '2021-06-23 10:51:49');
INSERT INTO `aj_report_fireacl`
VALUES (5, '网页浏览443', '2021-06-23 10:51:52');
INSERT INTO `aj_report_fireacl`
VALUES (6, '网页浏览443', '2021-06-23 10:51:55');
INSERT INTO `aj_report_fireacl`
VALUES (7, '网页浏览443', '2021-06-23 10:51:57');
INSERT INTO `aj_report_fireacl`
VALUES (8, '网页浏览443', '2021-06-23 10:52:28');
INSERT INTO `aj_report_fireacl`
VALUES (9, '网页浏览443', '2021-06-23 10:52:31');
INSERT INTO `aj_report_fireacl`
VALUES (10, '网页浏览443', '2021-06-23 10:52:33');
INSERT INTO `aj_report_fireacl`
VALUES (11, '网页浏览443', '2021-06-23 10:52:36');
INSERT INTO `aj_report_fireacl`
VALUES (12, '网页浏览443', '2021-06-23 10:52:38');
INSERT INTO `aj_report_fireacl`
VALUES (13, '网页浏览443', '2021-06-23 10:52:39');
INSERT INTO `aj_report_fireacl`
VALUES (14, '网页浏览443', '2021-06-23 10:52:42');
INSERT INTO `aj_report_fireacl`
VALUES (15, '网页浏览443', '2021-06-23 10:52:44');
INSERT INTO `aj_report_fireacl`
VALUES (16, '网页浏览443', '2021-06-23 10:52:46');
INSERT INTO `aj_report_fireacl`
VALUES (17, '网页浏览443', '2021-06-23 10:52:48');
INSERT INTO `aj_report_fireacl`
VALUES (18, '网页浏览443', '2021-06-23 10:54:33');
INSERT INTO `aj_report_fireacl`
VALUES (19, '网页浏览443', '2021-06-23 10:54:41');
INSERT INTO `aj_report_fireacl`
VALUES (20, '网页浏览443', '2021-06-23 10:54:45');
INSERT INTO `aj_report_fireacl`
VALUES (21, '网页浏览443', '2021-06-23 10:54:46');
INSERT INTO `aj_report_fireacl`
VALUES (22, '网页浏览443', '2021-06-23 10:54:46');
INSERT INTO `aj_report_fireacl`
VALUES (23, '网页浏览443', '2021-06-23 10:54:47');
INSERT INTO `aj_report_fireacl`
VALUES (24, '网页浏览443', '2021-06-23 10:54:48');
INSERT INTO `aj_report_fireacl`
VALUES (25, '网页浏览443', '2021-06-23 10:54:51');
INSERT INTO `aj_report_fireacl`
VALUES (26, '网页浏览443', '2021-06-23 10:54:54');
INSERT INTO `aj_report_fireacl`
VALUES (27, '共享文件445', '2021-06-23 10:57:14');
INSERT INTO `aj_report_fireacl`
VALUES (28, 'LDAP389', '2021-06-23 10:57:14');
INSERT INTO `aj_report_fireacl`
VALUES (29, '共享文件445', '2021-06-23 10:57:20');
INSERT INTO `aj_report_fireacl`
VALUES (30, 'LDAP389', '2021-06-23 10:57:20');
INSERT INTO `aj_report_fireacl`
VALUES (31, 'LDAP389', '2021-06-23 10:57:24');
INSERT INTO `aj_report_fireacl`
VALUES (32, '网页浏览443', '2021-06-23 10:57:27');
INSERT INTO `aj_report_fireacl`
VALUES (33, '共享文件445', '2021-06-23 10:57:27');
INSERT INTO `aj_report_fireacl`
VALUES (34, 'LDAP389', '2021-06-23 10:57:27');
INSERT INTO `aj_report_fireacl`
VALUES (35, 'LDAP389', '2021-06-23 10:57:30');
INSERT INTO `aj_report_fireacl`
VALUES (36, '网页浏览443', '2021-06-23 10:57:53');
INSERT INTO `aj_report_fireacl`
VALUES (37, '共享文件445', '2021-06-23 10:57:53');
INSERT INTO `aj_report_fireacl`
VALUES (38, 'LDAP389', '2021-06-23 10:57:53');
INSERT INTO `aj_report_fireacl`
VALUES (39, 'Server1433', '2021-06-23 10:57:53');
INSERT INTO `aj_report_fireacl`
VALUES (40, '存储514', '2021-06-23 10:57:53');
INSERT INTO `aj_report_fireacl`
VALUES (41, '网页浏览443', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (42, '共享文件445', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (43, 'LDAP389', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (44, 'Server1433', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (45, '存储514', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (46, '远程桌面3389', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (47, '远程登陆23', '2021-06-23 10:57:56');
INSERT INTO `aj_report_fireacl`
VALUES (48, 'LDAP389', '2021-06-23 10:58:29');
INSERT INTO `aj_report_fireacl`
VALUES (49, 'Server1433', '2021-06-23 10:58:29');
INSERT INTO `aj_report_fireacl`
VALUES (50, '存储514', '2021-06-23 10:58:29');
INSERT INTO `aj_report_fireacl`
VALUES (51, '远程桌面3389', '2021-06-23 10:58:32');
INSERT INTO `aj_report_fireacl`
VALUES (52, '远程登陆23', '2021-06-23 10:58:32');
INSERT INTO `aj_report_fireacl`
VALUES (53, 'LDAP389', '2021-06-23 10:58:51');
INSERT INTO `aj_report_fireacl`
VALUES (54, 'Server1433', '2021-06-23 10:58:51');
INSERT INTO `aj_report_fireacl`
VALUES (55, '存储514', '2021-06-23 10:58:51');
INSERT INTO `aj_report_fireacl`
VALUES (56, '远程桌面3389', '2021-06-23 10:58:51');
INSERT INTO `aj_report_fireacl`
VALUES (57, '网页浏览443', '2021-06-23 10:58:54');
INSERT INTO `aj_report_fireacl`
VALUES (58, '共享文件445', '2021-06-23 10:58:54');
INSERT INTO `aj_report_fireacl`
VALUES (59, 'LDAP389', '2021-06-23 10:58:54');
INSERT INTO `aj_report_fireacl`
VALUES (60, 'Server1433', '2021-06-23 10:58:54');
INSERT INTO `aj_report_fireacl`
VALUES (61, '存储514', '2021-06-23 10:58:57');
INSERT INTO `aj_report_fireacl`
VALUES (62, '远程桌面3389', '2021-06-23 10:58:57');
INSERT INTO `aj_report_fireacl`
VALUES (63, '远程登陆23', '2021-06-23 10:58:57');
INSERT INTO `aj_report_fireacl`
VALUES (64, 'LDAP389', '2021-06-23 10:59:01');
INSERT INTO `aj_report_fireacl`
VALUES (65, 'Server1433', '2021-06-23 10:59:01');
INSERT INTO `aj_report_fireacl`
VALUES (66, '存储514', '2021-06-23 10:59:01');
INSERT INTO `aj_report_fireacl`
VALUES (67, '网页浏览443', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (68, '共享文件445', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (69, 'LDAP389', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (70, 'Server1433', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (71, '存储514', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (72, '远程桌面3389', '2021-06-23 10:59:05');
INSERT INTO `aj_report_fireacl`
VALUES (73, '远程桌面3389', '2021-06-23 10:59:08');
INSERT INTO `aj_report_fireacl`
VALUES (74, '远程登陆23', '2021-06-23 10:59:08');
INSERT INTO `aj_report_fireacl`
VALUES (75, '远程桌面3389', '2021-06-23 10:59:08');
INSERT INTO `aj_report_fireacl`
VALUES (76, '远程登陆23', '2021-06-23 10:59:08');
INSERT INTO `aj_report_fireacl`
VALUES (77, '远程桌面3389', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (78, '远程登陆23', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (79, '远程桌面3389', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (80, '远程登陆23', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (81, '远程桌面3389', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (82, '远程登陆23', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (83, '远程桌面3389', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (84, '远程登陆23', '2021-06-23 10:59:09');
INSERT INTO `aj_report_fireacl`
VALUES (85, '远程桌面3389', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (86, '远程登陆23', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (87, '远程桌面3389', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (88, '远程登陆23', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (89, '远程桌面3389', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (90, '远程登陆23', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (91, '远程桌面3389', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (92, '远程登陆23', '2021-06-23 10:59:10');
INSERT INTO `aj_report_fireacl`
VALUES (93, '远程桌面3389', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (94, '远程登陆23', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (95, '远程桌面3389', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (96, '远程登陆23', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (97, '远程桌面3389', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (98, '远程登陆23', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (99, '远程桌面3389', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (100, '远程登陆23', '2021-06-23 10:59:11');
INSERT INTO `aj_report_fireacl`
VALUES (101, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (102, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (103, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (104, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (105, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (106, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (107, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (108, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (109, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (110, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (111, '远程桌面3389', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (112, '远程登陆23', '2021-06-23 10:59:12');
INSERT INTO `aj_report_fireacl`
VALUES (113, '远程桌面3389', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (114, '远程登陆23', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (115, '远程桌面3389', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (116, '远程登陆23', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (117, '远程桌面3389', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (118, '远程登陆23', '2021-06-23 10:59:13');
INSERT INTO `aj_report_fireacl`
VALUES (119, '远程桌面3389', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (120, '远程登陆23', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (121, '远程桌面3389', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (122, '远程登陆23', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (123, '远程桌面3389', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (124, '远程登陆23', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (125, '远程桌面3389', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (126, '远程登陆23', '2021-06-23 10:59:14');
INSERT INTO `aj_report_fireacl`
VALUES (127, '远程桌面3389', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (128, '远程登陆23', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (129, '远程桌面3389', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (130, '远程登陆23', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (131, '远程桌面3389', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (132, '远程登陆23', '2021-06-23 10:59:15');
INSERT INTO `aj_report_fireacl`
VALUES (133, '远程桌面3389', '2021-06-23 10:59:16');
INSERT INTO `aj_report_fireacl`
VALUES (134, '远程登陆23', '2021-06-23 10:59:16');
INSERT INTO `aj_report_fireacl`
VALUES (135, '远程桌面3389', '2021-06-23 10:59:16');
INSERT INTO `aj_report_fireacl`
VALUES (136, '远程登陆23', '2021-06-23 10:59:16');
INSERT INTO `aj_report_fireacl`
VALUES (137, '远程桌面3389', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (138, '远程登陆23', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (139, '远程桌面3389', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (140, '远程登陆23', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (141, '远程桌面3389', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (142, '远程登陆23', '2021-06-23 10:59:17');
INSERT INTO `aj_report_fireacl`
VALUES (143, '远程桌面3389', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (144, '远程登陆23', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (145, '远程桌面3389', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (146, '远程登陆23', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (147, '远程桌面3389', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (148, '远程登陆23', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (149, '远程桌面3389', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (150, '远程登陆23', '2021-06-23 10:59:18');
INSERT INTO `aj_report_fireacl`
VALUES (151, '远程桌面3389', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (152, '远程登陆23', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (153, '远程桌面3389', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (154, '远程登陆23', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (155, '远程桌面3389', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (156, '远程登陆23', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (157, '远程桌面3389', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (158, '远程登陆23', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (159, '远程桌面3389', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (160, '远程登陆23', '2021-06-23 10:59:19');
INSERT INTO `aj_report_fireacl`
VALUES (161, '存储514', '2021-06-23 10:59:22');
INSERT INTO `aj_report_fireacl`
VALUES (162, '远程桌面3389', '2021-06-23 10:59:22');
INSERT INTO `aj_report_fireacl`
VALUES (163, '远程登陆23', '2021-06-23 10:59:22');
INSERT INTO `aj_report_fireacl`
VALUES (164, 'Server1433', '2021-06-23 10:59:24');
INSERT INTO `aj_report_fireacl`
VALUES (165, '存储514', '2021-06-23 10:59:24');
INSERT INTO `aj_report_fireacl`
VALUES (166, '远程桌面3389', '2021-06-23 10:59:24');
INSERT INTO `aj_report_fireacl`
VALUES (167, '远程登陆23', '2021-06-23 10:59:28');
INSERT INTO `aj_report_fireacl`
VALUES (168, '远程登陆23', '2021-06-23 10:59:29');
INSERT INTO `aj_report_fireacl`
VALUES (169, '远程登陆23', '2021-06-23 10:59:29');
INSERT INTO `aj_report_fireacl`
VALUES (170, '远程登陆23', '2021-06-23 10:59:29');
INSERT INTO `aj_report_fireacl`
VALUES (171, '远程登陆23', '2021-06-23 10:59:29');
INSERT INTO `aj_report_fireacl`
VALUES (172, '远程登陆23', '2021-06-23 10:59:29');
INSERT INTO `aj_report_fireacl`
VALUES (173, '远程登陆23', '2021-06-23 10:59:30');
INSERT INTO `aj_report_fireacl`
VALUES (174, '远程登陆23', '2021-06-23 10:59:30');
INSERT INTO `aj_report_fireacl`
VALUES (175, '存储514', '2021-06-23 10:59:33');
INSERT INTO `aj_report_fireacl`
VALUES (176, '远程桌面3389', '2021-06-23 10:59:33');
INSERT INTO `aj_report_fireacl`
VALUES (177, 'LDAP389', '2021-06-23 10:59:36');
INSERT INTO `aj_report_fireacl`
VALUES (178, 'Server1433', '2021-06-23 10:59:36');
INSERT INTO `aj_report_fireacl`
VALUES (179, '存储514', '2021-06-23 10:59:39');
INSERT INTO `aj_report_fireacl`
VALUES (180, '远程桌面3389', '2021-06-23 10:59:39');
INSERT INTO `aj_report_fireacl`
VALUES (181, '远程登陆23', '2021-06-23 10:59:39');
INSERT INTO `aj_report_fireacl`
VALUES (182, '存储514', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (183, '远程桌面3389', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (184, '远程登陆23', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (185, '存储514', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (186, '远程桌面3389', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (187, '远程登陆23', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (188, '存储514', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (189, '远程桌面3389', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (190, '远程登陆23', '2021-06-23 10:59:40');
INSERT INTO `aj_report_fireacl`
VALUES (191, '远程桌面3389', '2021-06-23 10:59:43');
INSERT INTO `aj_report_fireacl`
VALUES (192, '远程登陆23', '2021-06-23 10:59:43');
INSERT INTO `aj_report_fireacl`
VALUES (193, '远程桌面3389', '2021-06-23 10:59:43');
INSERT INTO `aj_report_fireacl`
VALUES (194, '远程登陆23', '2021-06-23 10:59:43');
INSERT INTO `aj_report_fireacl`
VALUES (195, '远程桌面3389', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (196, '远程登陆23', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (197, '远程桌面3389', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (198, '远程登陆23', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (199, '远程桌面3389', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (200, '远程登陆23', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (201, '远程桌面3389', '2021-06-23 10:59:44');
INSERT INTO `aj_report_fireacl`
VALUES (202, '远程登陆23', '2021-06-23 10:59:44');

-- ----------------------------
-- Table structure for aj_report_fireattack
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_fireattack`;
CREATE TABLE `aj_report_fireattack`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '事件编号',
    `attack_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '攻击类型',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '事件创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_fireattack
-- ----------------------------
INSERT INTO `aj_report_fireattack`
VALUES (1, '僵尸网络', '2021-06-23 13:15:37');
INSERT INTO `aj_report_fireattack`
VALUES (2, '僵尸网络', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (3, '超大ICMP', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (4, '端口扫描', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (5, '网站扫描', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (6, 'UDP', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (7, 'WEB', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (8, 'SQL注入', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (9, '弱口令', '2021-06-23 13:34:14');
INSERT INTO `aj_report_fireattack`
VALUES (10, '僵尸网络', '2021-06-23 13:39:27');
INSERT INTO `aj_report_fireattack`
VALUES (11, '超大ICMP', '2021-06-23 13:39:27');
INSERT INTO `aj_report_fireattack`
VALUES (12, 'UDP', '2021-06-23 13:39:33');
INSERT INTO `aj_report_fireattack`
VALUES (13, 'WEB', '2021-06-23 13:39:33');
INSERT INTO `aj_report_fireattack`
VALUES (14, 'SQL注入', '2021-06-23 13:39:33');
INSERT INTO `aj_report_fireattack`
VALUES (15, '弱口令', '2021-06-23 13:39:33');
INSERT INTO `aj_report_fireattack`
VALUES (16, '僵尸网络', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (17, '超大ICMP', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (18, '端口扫描', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (19, '网站扫描', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (20, 'UDP', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (21, 'WEB', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (22, 'SQL注入', '2021-06-23 13:39:38');
INSERT INTO `aj_report_fireattack`
VALUES (23, '僵尸网络', '2021-06-23 13:39:41');
INSERT INTO `aj_report_fireattack`
VALUES (24, '超大ICMP', '2021-06-23 13:39:41');
INSERT INTO `aj_report_fireattack`
VALUES (25, '端口扫描', '2021-06-23 13:39:41');
INSERT INTO `aj_report_fireattack`
VALUES (26, '僵尸网络', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (27, '超大ICMP', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (28, '端口扫描', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (29, '僵尸网络', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (30, '超大ICMP', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (31, '端口扫描', '2021-06-23 13:39:42');
INSERT INTO `aj_report_fireattack`
VALUES (32, '僵尸网络', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (33, '超大ICMP', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (34, '端口扫描', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (35, '僵尸网络', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (36, '超大ICMP', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (37, '端口扫描', '2021-06-23 13:39:43');
INSERT INTO `aj_report_fireattack`
VALUES (38, '弱口令', '2021-06-23 13:39:46');
INSERT INTO `aj_report_fireattack`
VALUES (39, 'WEB', '2021-06-23 13:39:49');
INSERT INTO `aj_report_fireattack`
VALUES (40, 'SQL注入', '2021-06-23 13:39:49');
INSERT INTO `aj_report_fireattack`
VALUES (41, '端口扫描', '2021-06-23 13:39:55');
INSERT INTO `aj_report_fireattack`
VALUES (42, '网站扫描', '2021-06-23 13:39:55');
INSERT INTO `aj_report_fireattack`
VALUES (43, 'UDP', '2021-06-23 13:39:55');
INSERT INTO `aj_report_fireattack`
VALUES (44, '超大ICMP', '2021-06-23 13:39:58');
INSERT INTO `aj_report_fireattack`
VALUES (45, '端口扫描', '2021-06-23 13:39:58');
INSERT INTO `aj_report_fireattack`
VALUES (46, '僵尸网络', '2021-06-23 13:40:00');
INSERT INTO `aj_report_fireattack`
VALUES (47, '僵尸网络', '2021-06-23 13:40:01');
INSERT INTO `aj_report_fireattack`
VALUES (48, '僵尸网络', '2021-06-23 13:40:01');
INSERT INTO `aj_report_fireattack`
VALUES (49, '僵尸网络', '2021-06-23 13:40:01');
INSERT INTO `aj_report_fireattack`
VALUES (50, '弱口令', '2021-06-23 13:40:05');
INSERT INTO `aj_report_fireattack`
VALUES (51, 'SQL注入', '2021-06-23 13:40:07');
INSERT INTO `aj_report_fireattack`
VALUES (52, '网站扫描', '2021-06-23 13:40:13');
INSERT INTO `aj_report_fireattack`
VALUES (53, '端口扫描', '2021-06-23 13:40:17');
INSERT INTO `aj_report_fireattack`
VALUES (54, '僵尸网络', '2021-06-23 13:40:19');
INSERT INTO `aj_report_fireattack`
VALUES (55, '僵尸网络', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (56, '超大ICMP', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (57, '端口扫描', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (58, '网站扫描', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (59, 'UDP', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (60, 'WEB', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (61, 'SQL注入', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (62, '弱口令', '2021-06-23 13:40:24');
INSERT INTO `aj_report_fireattack`
VALUES (63, '僵尸网络', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (64, '超大ICMP', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (65, '端口扫描', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (66, '网站扫描', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (67, 'UDP', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (68, 'WEB', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (69, 'SQL注入', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (70, '弱口令', '2021-06-23 13:40:25');
INSERT INTO `aj_report_fireattack`
VALUES (71, '网站扫描', '2021-06-23 13:40:29');
INSERT INTO `aj_report_fireattack`
VALUES (72, 'UDP', '2021-06-23 13:40:29');
INSERT INTO `aj_report_fireattack`
VALUES (73, 'WEB', '2021-06-23 13:40:29');
INSERT INTO `aj_report_fireattack`
VALUES (74, 'SQL注入', '2021-06-23 13:40:29');
INSERT INTO `aj_report_fireattack`
VALUES (75, '僵尸网络', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (76, '超大ICMP', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (77, '端口扫描', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (78, '僵尸网络', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (79, '超大ICMP', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (80, '端口扫描', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (81, '僵尸网络', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (82, '超大ICMP', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (83, '端口扫描', '2021-06-23 13:40:32');
INSERT INTO `aj_report_fireattack`
VALUES (84, '僵尸网络', '2021-06-23 13:40:33');
INSERT INTO `aj_report_fireattack`
VALUES (85, '超大ICMP', '2021-06-23 13:40:33');
INSERT INTO `aj_report_fireattack`
VALUES (86, '端口扫描', '2021-06-23 13:40:33');
INSERT INTO `aj_report_fireattack`
VALUES (87, '僵尸网络', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (88, '超大ICMP', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (89, '僵尸网络', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (90, '超大ICMP', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (91, '僵尸网络', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (92, '超大ICMP', '2021-06-23 13:40:36');
INSERT INTO `aj_report_fireattack`
VALUES (93, '僵尸网络', '2021-06-23 13:40:37');
INSERT INTO `aj_report_fireattack`
VALUES (94, '超大ICMP', '2021-06-23 13:40:37');
INSERT INTO `aj_report_fireattack`
VALUES (95, '网站扫描', '2021-06-23 13:42:06');
INSERT INTO `aj_report_fireattack`
VALUES (96, 'UDP', '2021-06-23 13:42:26');
INSERT INTO `aj_report_fireattack`
VALUES (97, 'SQL注入', '2021-06-23 13:42:42');
INSERT INTO `aj_report_fireattack`
VALUES (98, 'UDP', '2021-06-23 13:42:47');
INSERT INTO `aj_report_fireattack`
VALUES (99, 'UDP', '2021-06-23 13:42:47');
INSERT INTO `aj_report_fireattack`
VALUES (100, 'UDP', '2021-06-23 13:42:48');

-- ----------------------------
-- Table structure for aj_report_mail
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_mail`;
CREATE TABLE `aj_report_mail`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '事件id',
    `username`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆用户',
    `status`      int(11) NULL DEFAULT NULL COMMENT '1成功，0失败',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '事件时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_mail
-- ----------------------------
INSERT INTO `aj_report_mail`
VALUES (1, 'zhangsi', 0, '2021-06-21 14:14:22');
INSERT INTO `aj_report_mail`
VALUES (2, 'zhangsi', 0, '2021-06-21 14:18:01');
INSERT INTO `aj_report_mail`
VALUES (3, 'zhangsi', 0, '2021-06-21 14:18:01');
INSERT INTO `aj_report_mail`
VALUES (4, 'zhangsi', 0, '2021-06-22 14:18:02');
INSERT INTO `aj_report_mail`
VALUES (5, 'zhangsi', 0, '2021-06-22 14:18:02');
INSERT INTO `aj_report_mail`
VALUES (6, 'zhangsi', 0, '2021-06-22 14:18:02');
INSERT INTO `aj_report_mail`
VALUES (7, 'zhangsi', 0, '2021-06-23 14:18:02');
INSERT INTO `aj_report_mail`
VALUES (8, 'zhangsi', 0, '2021-06-23 14:18:03');
INSERT INTO `aj_report_mail`
VALUES (9, 'zhangsi', 0, '2021-06-23 14:18:03');
INSERT INTO `aj_report_mail`
VALUES (10, 'zhangsi', 0, '2021-06-23 14:18:03');
INSERT INTO `aj_report_mail`
VALUES (11, 'zhangsi', 0, '2021-06-23 14:18:03');
INSERT INTO `aj_report_mail`
VALUES (12, 'zhangsi', 0, '2021-06-23 14:18:04');
INSERT INTO `aj_report_mail`
VALUES (13, 'zhangsi', 0, '2021-06-23 14:18:04');
INSERT INTO `aj_report_mail`
VALUES (14, 'zhangsi', 0, '2021-06-23 14:18:09');
INSERT INTO `aj_report_mail`
VALUES (15, 'zhangsi', 0, '2021-06-23 14:18:10');
INSERT INTO `aj_report_mail`
VALUES (16, 'zhangsi', 0, '2021-06-23 14:18:10');
INSERT INTO `aj_report_mail`
VALUES (17, 'zhangsi', 0, '2021-06-23 14:18:10');
INSERT INTO `aj_report_mail`
VALUES (18, 'zhangsi', 0, '2021-06-23 14:18:10');
INSERT INTO `aj_report_mail`
VALUES (19, 'zhangsi', 0, '2021-06-23 14:18:10');
INSERT INTO `aj_report_mail`
VALUES (20, 'wangwu', 0, '2021-06-21 14:18:23');
INSERT INTO `aj_report_mail`
VALUES (21, 'wangwu', 0, '2021-06-21 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (22, 'wangwu', 0, '2021-06-21 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (23, 'wangwu', 0, '2021-06-21 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (24, 'wangwu', 0, '2021-06-21 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (25, 'wangwu', 0, '2021-06-23 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (26, 'wangwu', 0, '2021-06-23 14:18:24');
INSERT INTO `aj_report_mail`
VALUES (27, 'wangwu', 0, '2021-06-23 14:18:25');
INSERT INTO `aj_report_mail`
VALUES (28, 'wangwu', 0, '2021-06-23 14:18:25');
INSERT INTO `aj_report_mail`
VALUES (29, 'zhangsi', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (30, 'wangwu', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (31, 'zhangsi', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (32, 'wangwu', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (33, 'zhangsi', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (34, 'wangwu', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (35, 'zhangsi', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (36, 'wangwu', 0, '2021-06-23 14:18:31');
INSERT INTO `aj_report_mail`
VALUES (37, 'zhangsi', 0, '2021-06-23 14:18:32');
INSERT INTO `aj_report_mail`
VALUES (38, 'wangwu', 0, '2021-06-23 14:18:32');
INSERT INTO `aj_report_mail`
VALUES (39, 'zhangsi', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (40, 'wangwu', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (41, 'liliu', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (42, 'zhangsi', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (43, 'wangwu', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (44, 'liliu', 0, '2021-06-23 14:18:41');
INSERT INTO `aj_report_mail`
VALUES (45, 'liliu', 0, '2021-06-23 14:18:43');
INSERT INTO `aj_report_mail`
VALUES (46, 'liliu', 0, '2021-06-21 14:18:43');
INSERT INTO `aj_report_mail`
VALUES (47, 'liliu', 0, '2021-06-21 14:18:44');
INSERT INTO `aj_report_mail`
VALUES (48, 'liliu', 0, '2021-06-23 14:18:44');
INSERT INTO `aj_report_mail`
VALUES (49, 'IT1', 0, '2021-06-23 14:18:53');
INSERT INTO `aj_report_mail`
VALUES (50, 'IT1', 0, '2021-06-23 14:18:53');
INSERT INTO `aj_report_mail`
VALUES (51, 'IT1', 0, '2021-06-23 14:18:54');
INSERT INTO `aj_report_mail`
VALUES (52, 'IT1', 0, '2021-06-21 14:18:54');
INSERT INTO `aj_report_mail`
VALUES (53, 'zhangsi', 0, '2021-06-21 14:18:58');
INSERT INTO `aj_report_mail`
VALUES (54, 'wangwu', 0, '2021-06-23 14:18:58');
INSERT INTO `aj_report_mail`
VALUES (55, 'liliu', 0, '2021-06-23 14:18:58');
INSERT INTO `aj_report_mail`
VALUES (56, 'IT1', 0, '2021-06-23 14:18:58');
INSERT INTO `aj_report_mail`
VALUES (57, 'IT2', 0, '2021-06-23 14:19:07');
INSERT INTO `aj_report_mail`
VALUES (58, 'IT1', 0, '2021-06-23 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (59, 'IT2', 0, '2021-06-23 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (60, 'IT1', 0, '2021-06-23 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (61, 'IT2', 0, '2021-06-22 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (62, 'IT1', 0, '2021-06-22 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (63, 'IT2', 0, '2021-06-22 14:19:12');
INSERT INTO `aj_report_mail`
VALUES (64, 'IT2', 0, '2021-06-23 14:19:26');
INSERT INTO `aj_report_mail`
VALUES (65, 'jiayi', 0, '2021-06-23 14:19:26');
INSERT INTO `aj_report_mail`
VALUES (66, 'IT2', 0, '2021-06-23 14:19:27');
INSERT INTO `aj_report_mail`
VALUES (67, 'jiayi', 0, '2021-06-23 14:19:27');
INSERT INTO `aj_report_mail`
VALUES (68, 'IT2', 0, '2021-06-23 14:19:27');
INSERT INTO `aj_report_mail`
VALUES (69, 'jiayi', 0, '2021-06-23 14:19:27');
INSERT INTO `aj_report_mail`
VALUES (70, 'IT1', 0, '2021-06-23 14:19:30');
INSERT INTO `aj_report_mail`
VALUES (71, 'IT2', 0, '2021-06-23 14:19:30');
INSERT INTO `aj_report_mail`
VALUES (72, 'IT1', 0, '2021-06-23 14:19:30');
INSERT INTO `aj_report_mail`
VALUES (73, 'IT2', 0, '2021-06-22 14:19:30');
INSERT INTO `aj_report_mail`
VALUES (74, 'zhangsi', 0, '2021-06-22 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (75, 'wangwu', 0, '2021-06-22 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (76, 'liliu', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (77, 'IT1', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (78, 'IT2', 0, '2021-06-22 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (79, 'jiayi', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (80, 'zhangsi', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (81, 'wangwu', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (82, 'liliu', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (83, 'IT1', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (84, 'IT2', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (85, 'jiayi', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (86, 'zhangsi', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (87, 'wangwu', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (88, 'liliu', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (89, 'IT1', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (90, 'IT2', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (91, 'jiayi', 0, '2021-06-23 14:19:33');
INSERT INTO `aj_report_mail`
VALUES (92, 'zhangsi', 0, '2021-06-21 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (93, 'wangwu', 0, '2021-06-21 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (94, 'liliu', 0, '2021-06-21 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (95, 'IT1', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (96, 'IT2', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (97, 'jiayi', 0, '2021-06-21 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (98, 'zhangsi', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (99, 'wangwu', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (100, 'liliu', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (101, 'IT1', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (102, 'IT2', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (103, 'jiayi', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (104, 'zhangsi', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (105, 'wangwu', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (106, 'liliu', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (107, 'IT1', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (108, 'IT2', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (109, 'jiayi', 0, '2021-06-23 14:19:34');
INSERT INTO `aj_report_mail`
VALUES (110, 'zhangsi', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (111, 'wangwu', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (112, 'liliu', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (113, 'IT1', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (114, 'IT2', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (115, 'jiayi', 0, '2021-06-24 09:39:28');
INSERT INTO `aj_report_mail`
VALUES (116, 'zhangsi', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (117, 'wangwu', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (118, 'liliu', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (119, 'IT1', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (120, 'IT2', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (121, 'jiayi', 0, '2021-06-24 09:39:35');
INSERT INTO `aj_report_mail`
VALUES (122, 'zhangsi', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (123, 'wangwu', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (124, 'liliu', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (125, 'IT1', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (126, 'IT2', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (127, 'jiayi', 0, '2021-06-24 09:39:36');
INSERT INTO `aj_report_mail`
VALUES (128, 'liliu', 0, '2021-06-24 09:39:39');
INSERT INTO `aj_report_mail`
VALUES (129, 'IT1', 0, '2021-06-24 09:39:39');
INSERT INTO `aj_report_mail`
VALUES (130, 'IT2', 0, '2021-06-24 09:39:39');
INSERT INTO `aj_report_mail`
VALUES (131, 'zhangsi', 0, '2021-06-24 09:39:42');
INSERT INTO `aj_report_mail`
VALUES (132, 'wangwu', 0, '2021-06-24 09:39:42');
INSERT INTO `aj_report_mail`
VALUES (133, 'liliu', 0, '2021-06-24 09:39:42');
INSERT INTO `aj_report_mail`
VALUES (134, 'IT1', 0, '2021-06-24 09:39:44');
INSERT INTO `aj_report_mail`
VALUES (135, 'IT1', 0, '2021-06-24 09:39:44');
INSERT INTO `aj_report_mail`
VALUES (136, 'IT1', 0, '2021-06-24 09:39:45');
INSERT INTO `aj_report_mail`
VALUES (137, 'zhangsi', 0, '2021-06-24 09:39:47');
INSERT INTO `aj_report_mail`
VALUES (138, 'zhangsi', 0, '2021-06-24 09:39:47');
INSERT INTO `aj_report_mail`
VALUES (139, 'wangwu', 0, '2021-06-24 09:39:50');
INSERT INTO `aj_report_mail`
VALUES (140, 'liliu', 0, '2021-06-24 09:39:50');
INSERT INTO `aj_report_mail`
VALUES (141, 'wangwu', 0, '2021-06-24 09:39:50');
INSERT INTO `aj_report_mail`
VALUES (142, 'liliu', 0, '2021-06-23 09:39:50');
INSERT INTO `aj_report_mail`
VALUES (143, 'zhangsi', 0, '2021-06-23 09:39:53');
INSERT INTO `aj_report_mail`
VALUES (144, 'wangwu', 0, '2021-06-24 09:39:53');
INSERT INTO `aj_report_mail`
VALUES (145, 'liliu', 0, '2021-06-24 09:39:53');
INSERT INTO `aj_report_mail`
VALUES (146, 'IT1', 0, '2021-06-24 09:39:53');
INSERT INTO `aj_report_mail`
VALUES (147, 'IT2', 0, '2021-06-24 09:39:53');
INSERT INTO `aj_report_mail`
VALUES (148, 'zhangsi', 0, '2021-06-24 09:39:54');
INSERT INTO `aj_report_mail`
VALUES (149, 'wangwu', 0, '2021-06-23 09:39:54');
INSERT INTO `aj_report_mail`
VALUES (150, 'liliu', 0, '2021-06-24 09:39:54');
INSERT INTO `aj_report_mail`
VALUES (151, 'IT1', 0, '2021-06-24 09:39:54');
INSERT INTO `aj_report_mail`
VALUES (152, 'IT2', 0, '2021-06-24 09:39:54');
INSERT INTO `aj_report_mail`
VALUES (153, 'zhangsi', 0, '2021-06-24 09:39:56');
INSERT INTO `aj_report_mail`
VALUES (154, 'wangwu', 0, '2021-06-24 09:39:56');
INSERT INTO `aj_report_mail`
VALUES (155, 'zhangsi', 0, '2021-06-24 09:39:57');
INSERT INTO `aj_report_mail`
VALUES (156, 'wangwu', 0, '2021-06-24 09:39:57');
INSERT INTO `aj_report_mail`
VALUES (157, 'zhangsi', 0, '2021-06-24 09:39:57');
INSERT INTO `aj_report_mail`
VALUES (158, 'wangwu', 0, '2021-06-24 09:39:57');
INSERT INTO `aj_report_mail`
VALUES (159, 'zhangsi', 0, '2021-06-24 09:40:00');
INSERT INTO `aj_report_mail`
VALUES (160, 'wangwu', 0, '2021-06-24 09:40:01');
INSERT INTO `aj_report_mail`
VALUES (161, 'liliu', 0, '2021-06-24 09:40:01');
INSERT INTO `aj_report_mail`
VALUES (162, 'zhangsi', 0, '2021-06-23 09:40:01');
INSERT INTO `aj_report_mail`
VALUES (163, 'wangwu', 0, '2021-06-23 09:40:01');
INSERT INTO `aj_report_mail`
VALUES (164, 'liliu', 0, '2021-06-24 09:40:01');
INSERT INTO `aj_report_mail`
VALUES (165, 'liliu', 0, '2021-06-23 09:40:05');
INSERT INTO `aj_report_mail`
VALUES (166, 'IT1', 0, '2021-06-24 09:40:05');
INSERT INTO `aj_report_mail`
VALUES (167, 'IT2', 0, '2021-06-24 09:40:07');
INSERT INTO `aj_report_mail`
VALUES (168, 'jiayi', 0, '2021-06-24 09:40:07');
INSERT INTO `aj_report_mail`
VALUES (169, 'wangwu', 0, '2021-06-24 09:40:11');
INSERT INTO `aj_report_mail`
VALUES (170, 'liliu', 0, '2021-06-24 09:40:11');
INSERT INTO `aj_report_mail`
VALUES (171, 'zhangsi', 0, '2021-06-24 09:40:14');
INSERT INTO `aj_report_mail`
VALUES (172, 'zhangsi', 0, '2021-06-24 09:40:14');
INSERT INTO `aj_report_mail`
VALUES (173, 'zhangsi', 0, '2021-06-24 09:40:15');
INSERT INTO `aj_report_mail`
VALUES (174, 'IT1', 0, '2021-06-24 09:40:18');
INSERT INTO `aj_report_mail`
VALUES (175, 'liliu', 0, '2021-06-24 09:40:20');
INSERT INTO `aj_report_mail`
VALUES (176, 'jiayi', 0, '2021-06-24 09:40:22');
INSERT INTO `aj_report_mail`
VALUES (177, 'zhangsi', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (178, 'wangwu', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (179, 'liliu', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (180, 'IT1', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (181, 'IT2', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (182, 'jiayi', 0, '2021-06-25 09:55:00');
INSERT INTO `aj_report_mail`
VALUES (183, 'wangwu', 0, '2021-06-25 09:55:05');
INSERT INTO `aj_report_mail`
VALUES (184, 'liliu', 0, '2021-06-25 09:55:05');
INSERT INTO `aj_report_mail`
VALUES (185, 'zhangsi', 0, '2021-06-25 09:55:09');
INSERT INTO `aj_report_mail`
VALUES (186, 'IT2', 0, '2021-06-25 09:55:12');
INSERT INTO `aj_report_mail`
VALUES (187, 'liliu', 0, '2021-06-25 09:55:15');
INSERT INTO `aj_report_mail`
VALUES (188, 'IT1', 0, '2021-06-25 09:55:15');
INSERT INTO `aj_report_mail`
VALUES (189, 'IT2', 0, '2021-06-25 09:55:15');
INSERT INTO `aj_report_mail`
VALUES (190, 'wangwu', 0, '2021-06-22 09:55:17');
INSERT INTO `aj_report_mail`
VALUES (191, 'liliu', 0, '2021-06-25 09:55:17');
INSERT INTO `aj_report_mail`
VALUES (192, 'jiayi', 0, '2021-06-25 09:55:20');
INSERT INTO `aj_report_mail`
VALUES (193, 'liliu', 0, '2021-06-25 09:55:22');
INSERT INTO `aj_report_mail`
VALUES (194, 'wangwu', 0, '2021-06-22 09:55:25');
INSERT INTO `aj_report_mail`
VALUES (195, 'zhangsi', 0, '2021-06-22 09:55:27');
INSERT INTO `aj_report_mail`
VALUES (196, 'IT1', 0, '2021-06-25 09:55:30');
INSERT INTO `aj_report_mail`
VALUES (197, 'IT2', 0, '2021-06-21 09:55:33');
INSERT INTO `aj_report_mail`
VALUES (198, 'zhangsi', 0, '2021-06-21 09:55:38');
INSERT INTO `aj_report_mail`
VALUES (199, 'wangwu', 0, '2021-06-21 09:55:38');
INSERT INTO `aj_report_mail`
VALUES (200, 'zhangsi', 0, '2021-06-25 09:55:38');
INSERT INTO `aj_report_mail`
VALUES (201, 'wangwu', 0, '2021-06-25 09:55:38');
INSERT INTO `aj_report_mail`
VALUES (202, 'zhangsi', 0, '2021-06-25 09:55:39');
INSERT INTO `aj_report_mail`
VALUES (203, 'wangwu', 0, '2021-06-25 09:55:39');
INSERT INTO `aj_report_mail`
VALUES (204, 'zhangsi', 0, '2021-06-25 09:55:39');
INSERT INTO `aj_report_mail`
VALUES (205, 'wangwu', 0, '2021-06-25 09:55:39');
INSERT INTO `aj_report_mail`
VALUES (206, 'zhangsi', 0, '2021-06-25 09:55:42');
INSERT INTO `aj_report_mail`
VALUES (207, 'wangwu', 0, '2021-06-25 09:55:42');
INSERT INTO `aj_report_mail`
VALUES (208, 'liliu', 0, '2021-06-25 09:55:42');
INSERT INTO `aj_report_mail`
VALUES (209, 'IT1', 0, '2021-06-25 09:55:42');
INSERT INTO `aj_report_mail`
VALUES (210, 'IT2', 0, '2021-06-25 09:55:42');
INSERT INTO `aj_report_mail`
VALUES (211, 'zhangsi', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (212, 'wangwu', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (213, 'liliu', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (214, 'IT1', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (215, 'IT2', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (216, 'jiayi', 0, '2021-06-25 09:55:45');
INSERT INTO `aj_report_mail`
VALUES (217, 'IT1', 0, '2021-06-25 09:55:48');
INSERT INTO `aj_report_mail`
VALUES (218, 'IT2', 0, '2021-06-21 09:55:48');
INSERT INTO `aj_report_mail`
VALUES (219, 'zhangsi', 0, '2021-06-25 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (220, 'wangwu', 0, '2021-06-25 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (221, 'liliu', 0, '2021-06-25 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (222, 'IT1', 0, '2021-06-25 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (223, 'IT2', 0, '2021-06-22 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (224, 'jiayi', 0, '2021-06-25 10:00:00');
INSERT INTO `aj_report_mail`
VALUES (225, 'jiayi', 0, '2021-06-25 10:00:03');
INSERT INTO `aj_report_mail`
VALUES (226, 'jiayi', 0, '2021-06-25 10:00:03');
INSERT INTO `aj_report_mail`
VALUES (227, 'jiayi', 0, '2021-06-21 10:00:04');
INSERT INTO `aj_report_mail`
VALUES (228, 'IT1', 0, '2021-06-22 10:00:06');
INSERT INTO `aj_report_mail`
VALUES (229, 'zhangsi', 0, '2021-06-22 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (230, 'wangwu', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (231, 'liliu', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (232, 'IT1', 0, '2021-06-21 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (233, 'zhangsi', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (234, 'wangwu', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (235, 'liliu', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (236, 'IT1', 0, '2021-06-21 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (237, 'zhangsi', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (238, 'wangwu', 0, '2021-06-25 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (239, 'liliu', 0, '2021-06-21 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (240, 'IT1', 0, '2021-06-21 10:00:14');
INSERT INTO `aj_report_mail`
VALUES (241, 'zhangsi', 0, '2021-06-25 10:00:15');
INSERT INTO `aj_report_mail`
VALUES (242, 'wangwu', 0, '2021-06-25 10:00:15');
INSERT INTO `aj_report_mail`
VALUES (243, 'liliu', 0, '2021-06-25 10:00:15');
INSERT INTO `aj_report_mail`
VALUES (244, 'IT1', 0, '2021-06-25 10:00:15');

-- ----------------------------
-- Table structure for aj_report_manus
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_manus`;
CREATE TABLE `aj_report_manus`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `datetime` date NULL DEFAULT NULL COMMENT '日期',
    `brand`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系列',
    `manus`    int(11) NULL DEFAULT NULL COMMENT '生产量',
    `sales`    int(11) NULL DEFAULT NULL COMMENT '销售量',
    `unsales`  int(11) NULL DEFAULT NULL COMMENT '滞销量',
    `rework`   int(11) NULL DEFAULT NULL COMMENT '返修量',
    `return`   int(11) NULL DEFAULT NULL COMMENT '退货量',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_manus
-- ----------------------------
INSERT INTO `aj_report_manus`
VALUES (1, '2021-06-18', 'A-100', 12, 11, 1, 0, 0);
INSERT INTO `aj_report_manus`
VALUES (2, '2021-06-18', 'A-110', 20, 15, 5, 1, 1);
INSERT INTO `aj_report_manus`
VALUES (3, '2021-06-18', 'B-100', 20, 20, 0, 0, 0);
INSERT INTO `aj_report_manus`
VALUES (4, '2021-06-18', 'B-110', 30, 25, 5, 2, 1);
INSERT INTO `aj_report_manus`
VALUES (5, '2021-06-18', 'C-50', 60, 50, 10, 5, 3);
INSERT INTO `aj_report_manus`
VALUES (6, '2021-06-18', 'D-40', 65, 65, 0, 10, 0);
INSERT INTO `aj_report_manus`
VALUES (7, '2021-06-18', 'E-30', 45, 45, 0, 20, 2);
INSERT INTO `aj_report_manus`
VALUES (8, '2021-06-19', 'A-100', 7, 7, 0, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (9, '2021-06-19', 'A-110', 10, 9, 1, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (10, '2021-06-19', 'B-100', 11, 10, 1, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (11, '2021-06-19', 'B-110', 15, 12, 3, 0, 0);
INSERT INTO `aj_report_manus`
VALUES (12, '2021-06-19', 'C-50', 40, 40, 0, 5, 2);
INSERT INTO `aj_report_manus`
VALUES (13, '2021-06-19', 'D-40', 35, 33, 2, 4, 2);
INSERT INTO `aj_report_manus`
VALUES (14, '2021-06-19', 'E-30', 15, 29, 1, 10, 10);
INSERT INTO `aj_report_manus`
VALUES (15, '2021-06-20', 'A-100', 17, 13, 4, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (16, '2021-06-20', 'A-110', 9, 8, 1, 0, 0);
INSERT INTO `aj_report_manus`
VALUES (17, '2021-06-20', 'B-100', 18, 17, 1, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (18, '2021-06-20', 'B-110', 5, 5, 0, 0, 0);
INSERT INTO `aj_report_manus`
VALUES (19, '2021-06-20', 'C-50', 60, 50, 10, 5, 2);
INSERT INTO `aj_report_manus`
VALUES (20, '2021-06-20', 'D-40', 35, 33, 2, 7, 2);
INSERT INTO `aj_report_manus`
VALUES (21, '2021-06-20', 'E-30', 45, 44, 1, 12, 3);
INSERT INTO `aj_report_manus`
VALUES (22, '2021-06-21', 'A-100', 27, 20, 7, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (23, '2021-06-21', 'A-110', 39, 30, 9, 2, 0);
INSERT INTO `aj_report_manus`
VALUES (24, '2021-06-21', 'B-100', 28, 25, 3, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (25, '2021-06-21', 'B-110', 15, 12, 3, 2, 0);
INSERT INTO `aj_report_manus`
VALUES (26, '2021-06-21', 'C-50', 30, 30, 0, 5, 2);
INSERT INTO `aj_report_manus`
VALUES (27, '2021-06-21', 'D-40', 25, 24, 1, 3, 1);
INSERT INTO `aj_report_manus`
VALUES (28, '2021-06-21', 'E-30', 55, 50, 5, 7, 3);
INSERT INTO `aj_report_manus`
VALUES (29, '2021-06-22', 'A-100', 37, 30, 7, 2, 0);
INSERT INTO `aj_report_manus`
VALUES (30, '2021-06-22', 'A-110', 19, 15, 4, 1, 1);
INSERT INTO `aj_report_manus`
VALUES (31, '2021-06-22', 'B-100', 8, 8, 0, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (32, '2021-06-22', 'B-110', 5, 5, 0, 1, 0);
INSERT INTO `aj_report_manus`
VALUES (33, '2021-06-22', 'C-50', 20, 19, 1, 2, 1);
INSERT INTO `aj_report_manus`
VALUES (34, '2021-06-22', 'D-40', 15, 14, 1, 3, 1);
INSERT INTO `aj_report_manus`
VALUES (35, '2021-06-22', 'E-30', 55, 53, 2, 9, 6);

-- ----------------------------
-- Table structure for aj_report_wifiamount
-- ----------------------------
DROP TABLE IF EXISTS `aj_report_wifiamount`;
CREATE TABLE `aj_report_wifiamount`
(
    `datetime` date NOT NULL,
    `success`  int(11) NULL DEFAULT NULL COMMENT '成功次数',
    `fail`     int(11) NULL DEFAULT NULL COMMENT '失败次数',
    PRIMARY KEY (`datetime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aj_report_wifiamount
-- ----------------------------
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-17', 210, 15);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-18', 234, 43);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-19', 199, 28);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-20', 260, 80);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-21', 245, 45);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-22', 216, 26);
INSERT INTO `aj_report_wifiamount`
VALUES ('2021-06-23', 150, 10);

SET
FOREIGN_KEY_CHECKS = 1;
