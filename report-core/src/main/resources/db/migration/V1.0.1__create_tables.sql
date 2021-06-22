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

 Date: 22/06/2021 15:38:42
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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
-- Table structure for gaea_export
-- ----------------------------
DROP TABLE IF EXISTS `gaea_export`;
CREATE TABLE `gaea_export`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT,
    `file_id`           varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件在t_file中的id，前端传它来读流接口显示，http://auth/file/download/fileId',
    `file_title`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件标题，比如:对账单报表6月份报表',
    `result_start_time` datetime(0) NULL DEFAULT NULL COMMENT '导出前，查询的数据开始时间',
    `result_end_time`   datetime(0) NULL DEFAULT NULL COMMENT '导出前，查询的数据结束时间',
    `result_size`       bigint(20) NOT NULL DEFAULT 0 COMMENT '导出查询结果，数据总条数',
    `file_create_time`  datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '文件导出触发时间',
    `file_finish_time`  datetime(0) NULL DEFAULT NULL COMMENT '文件生成完成时间',
    `file_status`       varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '0' COMMENT '文件状态，creating生成中，success生成成功,failed生成失败',
    `create_by`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '创建人',
    `update_by`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
    `create_time`       datetime(0) NOT NULL COMMENT '创建时间',
    `update_time`       datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
    `version`           int(8) NULL DEFAULT NULL COMMENT '版本号',
    `remark`            varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导出中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gaea_file
-- ----------------------------
DROP TABLE IF EXISTS `gaea_file`;
CREATE TABLE `gaea_file`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `file_id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成的唯一uuid',
    `file_path`        varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件在linux中的完整目录，比如/app/dist/export/excel/${fileid}.xlsx',
    `url_path`         varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通过接口的下载完整http路径',
    `file_instruction` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件内容说明，比如 对账单(202001~202012)',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `create_time`      timestamp(0) NULL DEFAULT NULL,
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `update_time`      timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0),
    `version`          int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 291 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
    `refresh_seconds`  int(11) NULL DEFAULT NULL COMMENT '自动刷新间隔秒，数据字典REFRESH_TYPE',
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
) ENGINE = InnoDB AUTO_INCREMENT = 264 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gaea_report_dashboard_widget
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_dashboard_widget`;
CREATE TABLE `gaea_report_dashboard_widget`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组件id',
    `report_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表编码',
    `type`        varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件类型参考字典DASHBOARD_PANEL_TYPE',
    `setup`       varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的渲染属性json',
    `data`        varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的数据属性json',
    `collapse`    varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的配置属性json',
    `position`    varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件的大小位置属性json',
    `enable_flag` int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag` int(1) NULL DEFAULT 0 COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
    `sort`        bigint(20) NULL DEFAULT 0 COMMENT '排序，图层的概念',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `update_time` datetime(0) NULL DEFAULT NULL,
    `version`     int(8) NULL DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6286 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集管理' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集查询参数' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集数据转换' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gaea_report_data_source
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_data_source`;
CREATE TABLE `gaea_report_data_source`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `source_code`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
    `source_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
    `source_desc`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源描述',
    `source_type`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源类型 DIC_NAME=SOURCE_TYPE; mysql，orace，sqlserver，elasticsearch，接口，javaBean，数据源类型字典中item-extend动态生成表单',
    `source_config` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源连接配置json：关系库{ jdbcUrl:\'\', username:\'\', password:\'\' } ES{ hostList:\' ip1:9300,
    ip2:9300,
    ip3:9300\', clusterName:\'elasticsearch_cluster\' }  接口{ apiUrl:\' http://ip:port/url\', method:\'\' } javaBean{ beanNamw:\' xxx\' }',
    `enable_flag`   int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag`   int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`       int(8) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unique_source_code`(`source_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gaea_report_excel
-- ----------------------------
DROP TABLE IF EXISTS `gaea_report_excel`;
CREATE TABLE `gaea_report_excel`
(
    `id`          bigint(11) NOT NULL AUTO_INCREMENT,
    `report_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表编码',
    `set_codes`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集编码，以|分割',
    `set_param`   varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据集查询参数',
    `json_str`    text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报表json串',
    `enable_flag` int(1) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
    `delete_flag` int(1) NULL DEFAULT 0 COMMENT '0--未删除 1--已删除 DIC_NAME=DELETE_FLAG',
    `create_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`     int(8) NULL DEFAULT NULL COMMENT '版本号',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `UNIQUE_REPORT_CODE`(`report_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gaea_ui_i18n
-- ----------------------------
DROP TABLE IF EXISTS `gaea_ui_i18n`;
CREATE TABLE `gaea_ui_i18n`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `locale`      varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh' COMMENT '语言标识',
    `cata_type`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业标识',
    `system`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属系统',
    `module`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `code`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段编码',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
    `remark`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务描述',
    `refer`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表名',
    `enabled`     int(1) NOT NULL DEFAULT 1 COMMENT '启用状态：1:启用 0:禁用',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
    `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
    `version`     int(11) NULL DEFAULT NULL COMMENT '版本',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4765 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段命名国际化管理' ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;
