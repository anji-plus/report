-- 补充admin对于execl表格权限

INSERT INTO `aj_report`.`access_role_authority`(`role_code`,`target`,`action`) SELECT "root","excelManage","insert" FROM DUAL WHERE NOT EXISTS(SELECT `role_code`,`target`,`action` FROM `aj_report`.`access_role_authority` WHERE `role_code`="root" AND `target`="excelManage" AND `action`="insert");

INSERT INTO `aj_report`.`access_role_authority`(`role_code`,`target`,`action`) SELECT "root","excelManage","update" FROM DUAL WHERE NOT EXISTS(SELECT `role_code`,`target`,`action` FROM `aj_report`.`access_role_authority` WHERE `role_code`="root" AND `target`="excelManage" AND `action`="update");
