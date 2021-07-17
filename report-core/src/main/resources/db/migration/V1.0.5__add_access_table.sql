use aj_report;

-- ----------------------------
--  Table structure for `access_authority`
-- ----------------------------
DROP TABLE IF EXISTS `access_authority`;
CREATE TABLE `access_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_target` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父ID',
  `target` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单代码',
  `target_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `action` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '按钮代码',
  `action_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '按钮名称',
  `sort` int(8) DEFAULT NULL,
  `enable_flag` int(1) NOT NULL DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
  `delete_flag` int(1) DEFAULT '0' COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `version` tinyint(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TA_uniq_index` (`target`,`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营权限表';

-- ----------------------------
--  Records of `access_authority`
-- ----------------------------
BEGIN;
INSERT INTO `access_authority` VALUES ('1', null, 'access', '用户权限', '', '', '10', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('2', null, 'report', '报表设计', '', '', '20', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('101', 'access', 'authorityManage', '权限管理', 'insert', '新增权限', '101', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('102', 'access', 'authorityManage', '权限管理', 'update', '修改权限', '102', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('103', 'access', 'authorityManage', '权限管理', 'delete', '删除权限', '103', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('104', 'access', 'authorityManage', '权限管理', 'query', '查询权限', '104', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('105', 'access', 'roleManage', '角色管理', 'insert', '新建角色', '105', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2021-07-17 20:41:46', '2'), ('106', 'access', 'roleManage', '角色管理', 'update', '修改角色', '106', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('107', 'access', 'roleManage', '角色管理', 'delete', '删除角色', '107', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('108', 'access', 'roleManage', '角色管理', 'query', '查询角色', '108', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('109', 'access', 'roleManage', '角色管理', 'grantAuthority', '分配权限', '109', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('110', 'access', 'userManage', '用户管理', 'insert', '新增用户', '110', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('111', 'access', 'userManage', '用户管理', 'update', '修改用户', '111', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('112', 'access', 'userManage', '用户管理', 'delete', '删除用户', '112', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('113', 'access', 'userManage', '用户管理', 'query', '查询用户', '113', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('114', 'access', 'userManage', '用户管理', 'resetPassword', '重置密码', '114', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('115', 'access', 'userManage', '用户管理', 'grantRole', '分配角色', '115', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('200', 'report', 'datasourceManage', '数据源管理', 'insert', '新建数据源', '200', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('201', 'report', 'datasourceManage', '数据源管理', 'update', '修改数据源', '201', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('202', 'report', 'datasourceManage', '数据源管理', 'delete', '删除数据源', '202', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('203', 'report', 'datasourceManage', '数据源管理', 'query', '查询数据源', '203', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('204', 'report', 'resultsetManage', '数据集管理', 'insert', '新建数据集', '204', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('205', 'report', 'resultsetManage', '数据集管理', 'update', '修改数据集', '205', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('206', 'report', 'resultsetManage', '数据集管理', 'delete', '删除数据集', '206', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('207', 'report', 'resultsetManage', '数据集管理', 'query', '查询数据集', '207', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('221', 'report', 'reportManage', '报表管理', 'insert', '新建报表', '204', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('222', 'report', 'reportManage', '报表管理', 'update', '修改报表', '205', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('223', 'report', 'reportManage', '报表管理', 'delete', '删除报表', '206', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('224', 'report', 'reportManage', '报表管理', 'query', '查询报表', '207', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('231', 'report', 'bigScreenManage', '大屏报表', 'design', '设计大屏', '204', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1'), ('232', 'report', 'bigScreenManage', '大屏报表', 'view', '查看大屏', '205', '1', '0', 'admin', '2019-07-23 15:59:40', 'admin', '2019-07-23 15:59:40', '1');
COMMIT;

-- ----------------------------
--  Table structure for `access_role`
-- ----------------------------
DROP TABLE IF EXISTS `access_role`;
CREATE TABLE `access_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `role_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enable_flag` int(1) NOT NULL DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
  `delete_flag` int(1) DEFAULT '0' COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营角色表';

-- ----------------------------
--  Records of `access_role`
-- ----------------------------
BEGIN;
INSERT INTO `access_role` VALUES ('1', 'root', '超级管理员', '1', '0', 'root', '2019-07-23 16:00:33', 'root', '2019-07-23 16:00:33', '1'), ('2', 'designer', '设计员', '1', '0', 'root', '2019-07-23 16:00:33', 'root', '2019-07-23 16:00:33', '1'), ('3', 'viewer', '查看员', '1', '0', 'root', '2019-07-23 16:00:33', 'root', '2019-07-23 16:00:33', '1');
COMMIT;

-- ----------------------------
--  Table structure for `access_role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `access_role_authority`;
CREATE TABLE `access_role_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `target` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '权限目标',
  `action` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营角色权限表';

-- ----------------------------
--  Records of `access_role_authority`
-- ----------------------------
BEGIN;
INSERT INTO `access_role_authority` VALUES ('413', 'root', 'authorityManage', 'insert'), ('414', 'root', 'authorityManage', 'update'), ('415', 'root', 'authorityManage', 'delete'), ('416', 'root', 'authorityManage', 'query'), ('417', 'root', 'roleManage', 'insert'), ('418', 'root', 'roleManage', 'update'), ('419', 'root', 'roleManage', 'delete'), ('420', 'root', 'roleManage', 'query'), ('421', 'root', 'roleManage', 'grantAuthority'), ('422', 'root', 'userManage', 'insert'), ('423', 'root', 'userManage', 'update'), ('424', 'root', 'userManage', 'delete'), ('425', 'root', 'userManage', 'query'), ('426', 'root', 'userManage', 'resetPassword'), ('427', 'root', 'userManage', 'grantRole'), ('428', 'root', 'datasourceManage', 'insert'), ('429', 'root', 'datasourceManage', 'update'), ('430', 'root', 'datasourceManage', 'delete'), ('431', 'root', 'datasourceManage', 'query'), ('432', 'root', 'resultsetManage', 'insert'), ('433', 'root', 'resultsetManage', 'update'), ('434', 'root', 'resultsetManage', 'delete'), ('435', 'root', 'resultsetManage', 'query'), ('436', 'root', 'reportManage', 'insert'), ('437', 'root', 'reportManage', 'update'), ('438', 'root', 'reportManage', 'delete'), ('439', 'root', 'reportManage', 'query'), ('440', 'root', 'bigScreenManage', 'design'), ('441', 'root', 'bigScreenManage', 'view'), ('442', 'viewer', 'datasourceManage', 'query'), ('443', 'viewer', 'resultsetManage', 'query'), ('444', 'viewer', 'reportManage', 'query'), ('445', 'viewer', 'bigScreenManage', 'view'), ('446', 'designer', 'datasourceManage', 'insert'), ('447', 'designer', 'datasourceManage', 'update'), ('448', 'designer', 'datasourceManage', 'delete'), ('449', 'designer', 'datasourceManage', 'query'), ('450', 'designer', 'resultsetManage', 'insert'), ('451', 'designer', 'resultsetManage', 'update'), ('452', 'designer', 'resultsetManage', 'delete'), ('453', 'designer', 'resultsetManage', 'query'), ('454', 'designer', 'reportManage', 'insert'), ('455', 'designer', 'reportManage', 'update'), ('456', 'designer', 'reportManage', 'delete'), ('457', 'designer', 'reportManage', 'query'), ('458', 'designer', 'bigScreenManage', 'design'), ('459', 'designer', 'bigScreenManage', 'view');
COMMIT;

-- ----------------------------
--  Table structure for `access_user`
-- ----------------------------
DROP TABLE IF EXISTS `access_user`;
CREATE TABLE `access_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT ' 登录名',
  `real_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '真实用户',
  `password` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后一次登陆时间',
  `last_login_ip` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一次登录IP',
  `enable_flag` int(1) NOT NULL DEFAULT '1' COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT ' 0--未删除 1--已删除 DIC_NAME=DEL_FLAG',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX1` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营用户表';

-- ----------------------------
--  Records of `access_user`
-- ----------------------------
BEGIN;
INSERT INTO `access_user` VALUES ('1', 'admin', '管理员', 'afbc19467fbff0690b5eba5209d0e966', '18019216253', 'admin1@admin.com', null, '2018-08-20 22:04:02', '172.30.16.129', '1', '0', 'admin', '2019-07-23 16:00:38', 'admin', '2019-07-23 16:00:38', '1'), ('2', 'guest', '访客', '5632ad5d163ccaf1ecc305315a1a8e16', '18019214578', 'admin1@admin.com', null, '2018-08-20 22:04:02', '172.30.16.129', '1', '0', 'guest', '2019-07-23 16:00:38', 'admin', '2019-07-23 16:00:38', '1');
COMMIT;

-- ----------------------------
--  Table structure for `access_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `access_user_role`;
CREATE TABLE `access_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '权限目标',
  `role_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营角色权限表';

-- ----------------------------
--  Records of `access_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `access_user_role` VALUES ('13', 'guest', 'viewer'), ('14', 'admin', 'root'), ('15', 'admin', 'designer'), ('16', 'admin', 'viewer');
COMMIT;

DROP TABLE IF EXISTS `gaea_user`;