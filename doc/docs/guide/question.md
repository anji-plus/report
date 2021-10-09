- 使用Maven Install打包时报错 <br>
  ![img.png](../picture/qusetion/img.png) <br>
  请使用Maven Package进行打包 <br>

-- 版本问题：[开发环境参考](https://report.anji-plus.com/report-doc/guide/quicklyDevelop.html)

- 底层数据库为Mysql8.0+时，flyway执行SQL报错<br>
- Node.js是V16版本时 npm install失败 <br>
- jdk使用1.7或者11及以上时，编译打包不过 <br>
  ![img](../picture/qusetion/img_1.png) <br>

- MssSqlServer 2014及其上下版本数据源测试不过。以2014版本为例。 <br>
  ![img](../picture/qusetion/img_2.png) <br>
  将1.2.6改成1.2.0 <br>

- 浏览器兼容性 当前未对部分浏览器做兼容性适配，推荐使用谷歌浏览器进行访问。<br>

- 部署完进入系统，点击预览大屏，大屏提示：**执行sql失败** <br>
  ![img](../picture/qusetion/img_3.png) <br>
  请先重置数据源的mysql连接，修改mysql的账号密码。<br>

- flyway执行报错1.0.10sql失败 <br>
  错误提示：Caused by: org.flywaydb.core.api.FlywayException: Validate failed: Detected failed <br>
  migration to version 1.0.10 (create report share) <br>
  **注：0.93发行版及之后使用Report的小伙伴不用担心会出现此问题** <br>
  请参考此Issue解决此问题：https://gitee.com/anji-plus/report/issues/I47JNE <br>

- 禁用flyway及切换底层数据库方案 <br>
  https://my.oschina.net/u/4517014/blog/5269319 <br>

- 数据源数据集用法总结 <br>
  https://my.oschina.net/u/4517014/blog/5270828 <br>
  **注**：http数据源未来会挪到数据集那边 <br>




