- 快速部署本地运行，提示“在线体验版本” <br>
  请下载最新源码或者最新发行版

- 使用Maven Install打包时报错 <br>
  ![img.png](../picture/qusetion/img.png) <br>
  请使用Maven Package进行打包

-- 版本问题：[开发环境参考](https://report.anji-plus.com/report-doc/guide/quicklyDevelop.html)

- 底层数据库为Mysql8.0+时，flyway执行SQL报错<br>
- Node.js是V16版本时 npm install失败 <br>
- jdk使用1.7或者11及以上时，编译打包不过 <br>
  ![img](../picture/qusetion/img_1.png) <br>

- MssSqlServer 2014及其上下版本数据源测试不过。以2014版本为例。 <br>
  ![img](../picture/qusetion/img_2.png) <br>
  将1.2.6改成1.2.0

- 浏览器兼容性 当前未对部分浏览器做兼容性适配，推荐使用谷歌浏览器进行访问。<br>

- 部署完进入系统，点击预览大屏，大屏提示：**执行SQL失败** <br>
  ![img](../picture/qusetion/img_3.png) <br>
  请先重置数据源的mysql连接，修改mysql的账号密码。<br>





