## 常见问题
- 没有找到新增数据源类型？<br>
  字典管理目前暂未有页面维护，可自行去数据库中增加你需要的数据源类型。<br>
  表aj_report.gaea_dict，字段dict_type：SOURCE_TYPE<br>
  表aj_report.gaea_dict_item, item_extend字段是下拉选择后动态表单渲染的json数据<br>
  

## 已知问题
### Mysql8.0
底层数据库为Mysql8.0+时，flyway执行SQL报错<br>
解决办法：修改pom.xml依赖，添加Mysql8.0驱动包，将DB目录里面SQL文件utf8_general_ci字符集改成mysql8.0支持的字符集

### Jdk11


