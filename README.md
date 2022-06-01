## 简介

&emsp; &emsp; AJ-Report是全开源的一个BI平台，酷炫大屏展示，能随时随地掌控业务动态，让每个决策都有数据支撑。<br>
&emsp; &emsp; 多数据源支持，内置mysql、elasticsearch、kudu驱动，支持自定义数据集省去数据接口开发，目前已支持20种大屏组件/图表，不会开发，照着设计稿也可以制作大屏。<br>
&emsp; &emsp; 三步轻松完成大屏设计：配置数据源---->写SQL配置数据集---->拖拽配置大屏---->保存发布。欢迎体验。

## 在线体验

#### &emsp; [在线体验](https://ajreport.beliefteam.cn/index.html "链接"): https://ajreport.beliefteam.cn/index.html  &emsp;体验账号：guest 密码：guest

#### &emsp; [在线文档](https://ajreport.beliefteam.cn/report-doc/ "doc"): https://ajreport.beliefteam.cn/report-doc/ <br>

#### &emsp; [在线提问](https://gitee.com/anji-plus/report/issues "issue"): https://gitee.com/anji-plus/report/issues <br>

## 发行版本

#### &emsp; [下载链接](https://gitee.com/anji-plus/report/releases "下载链接"): https://gitee.com/anji-plus/report/releases <br>

## 功能概述

#### &emsp; 组件介绍

&emsp;&emsp; 大屏设计（AJ-Report）是一个可视化拖拽编辑的，直观，酷炫，具有科技感的图表工具全开源项目。 内置的基础功能包括数据源，数据集，报表管理，项目部分截图如下。<br>

![操作](https://images.gitee.com/uploads/images/2021/0703/094742_c0243f70_1728982.gif "2021-07-03_09-43-50.gif")
![视频](https://ajreport.beliefteam.cn/report-doc/static/Rhea.mp4) <br>
**[更多社区大屏案例](https://ajreport.beliefteam.cn/report-doc/guide/bigScreenCase.html)** <br>

## 数据流程图

![An image](https://images.gitee.com/uploads/images/2021/0630/160451_31bb9052_1728982.png)

## 打包目录build

```
├── bin                                           启动命令脚本
│   ├── restart.sh
│   ├── start.bat
│   ├── start.sh
│   └── stop.sh
├── conf                                       配置文件目录
│   └── bootstrap.yml
├── logs                                          启动日志目录
├── cache                                         本地缓存目录
├── lib                                           自定义扩展包&report-core核心包
```

## 系统目录

```
├── doc                                           文档源码
│   ├── docs
│   ├── package.json
│   └── README.md
├── pom.xml                                       父pom，jar版本管理
├── report-core                                   java源码
│   ├── pom.xml                                   gaea父pom，jar版本管理
│   └── README.md
├── report-ui                                     前端vue源码
├── LICENSE
├── README.md
```

## 核心技术

### 依赖

- [Mysql] 5.7
- [Jdk] 1.8

### 后端

- [Spring Boot2.3.5.RELEASE](https://spring.io/projects/spring-boot/): Spring Boot是一款开箱即用框架，让我们的Spring应用变的更轻量化、更快的入门。
  在主程序执行main函数就可以运行。你也可以打包你的应用为jar并通过使用java -jar来运行你的Web应用；
- [Mybatis-plus3.3.2](https://mp.baomidou.com/): MyBatis-plus（简称 MP）是一个 MyBatis (opens new window) 的增强工具。
- [flyway5.2.1](https://flywaydb.org/): 主要用于在你的应用版本不断升级的同时，升级你的数据库结构和里面的数据

### 前端

- [npm](https://www.npmjs.com/)：node.js的包管理工具，用于统一管理我们前端项目中需要用到的包、插件、工具、命令等，便于开发和维护。
- [webpack](https://webpack.docschina.org/)：用于现代 JavaScript 应用程序的静态模块打包工具。
- [ES6](https://es6.ruanyifeng.com/)：JavaScript的新版本，ECMAScript6的简称。利用ES6我们可以简化我们的JS代码，同时利用其提供的强大功能来快速实现JS逻辑。
- [vue-cli](https://cli.vuejs.org/)：Vue的脚手架工具，用于自动生成Vue项目的目录及文件。
- [vue-router](https://router.vuejs.org/)： Vue提供的前端路由工具，利用其我们实现页面的路由控制，局部刷新及按需加载，构建单页应用，实现前后端分离。
- [element-ui](https://element.eleme.cn/#/zh-CN)：基于MVVM框架Vue开源出来的一套前端ui组件。
- [avue](https://www.avuejs.com/): 用该组件包裹后可以变成拖拽组件，采用相对于父类绝对定位，用键盘的上下左右也可以控制移动。
- [vue-echarts](https://www.npmjs.com/package/vue-echarts/): vue-echarts是封装后的vue插件，基于 ECharts v4.0.1+ 开发。
- [vue-superslide](https://www.npmjs.com/package/vue-super-slider/): Vue-SuperSlide(Github) 是 SuperSlide 的 Vue 封装版本。
- [vuedraggable](https://github.com/SortableJS/Vue.Draggable/): 是一款基于Sortable.js实现的vue拖拽插件。
- [luckysheet](https://gitee.com/mengshukeji/Luckysheet): Luckysheet ，一款纯前端类似excel的在线表格，功能强大、配置简单、完全开源。

## 部署方式

**注意版本兼容性** <br>
源码 doc -> docs -> guide 目录下即所有文档 <br>

### 发行版部署

```
下载最新发行版，解压
cd aj-report-xxxx
vim conf/bootstrap.yml 修改数据库连接等信息
sh bin/start.sh Linux启动
bin/start.bat Windows修改第4行的JAVA_HOME后(去掉rem注释)，双击启动

启动后访问
http://serverip:9095
用户名密码：admin/123456

登陆后修改"数据源->mysql数据源"用户名密码
```

### 源码编译部署

在Linux上先准备好maven、node.js、jdk

- [Apache Maven] 3.5 <br>
- [Node.js] v14.16.0 <br>
- [Jdk] 1.8

```
git clone https://gitee.com/anji-plus/report.git
cd report
sh build.sh
编译完成放在build文件夹 aj-report-xxxx.zip

unzip aj-report-xxxx.zip
cd aj-report-xxxx
vim conf/bootstrap.yml 修改数据库连接等信息
sh bin/start.sh Linux启动
bin/start.bat Windows修改第4行的JAVA_HOME后(去掉rem注释)，双击启动

启动后访问
http://serverip:9095
用户名密码：admin/123456

登陆后修改"数据源->mysql数据源"用户名密码
```

**[运行环境参考文档](https://ajreport.beliefteam.cn/report-doc/guide/quicklyDevelop.html)** <br>

**[源码编译部署参考文档](https://ajreport.beliefteam.cn/report-doc/guide/quicklySource.html)** <br>

**[发行版部署参考文档](https://ajreport.beliefteam.cn/report-doc/guide/quicklyDistribution.html)** <br>

**[前后端分离部署参考文档](https://ajreport.beliefteam.cn/report-doc/guide/quicklySeparate.html)** <br>

## 操作手册

新建数据源（重置mysql数据源） --> 新建数据集（编写sql） --> 新建大屏（设计大屏） <br>
**[在线文档](https://ajreport.beliefteam.cn/report-doc/guide/datasource.html)**

## SQL初始化

sql文件的目录在：report-core --> src --> main --> resources -- > db.migration <br>

系统初始化时flyway会自动的将该目录下的sql文件执行，不需要手动执行sql文件。 <br>
执行完将会创建 aj_report（存放系统基础数据） 和 aj_report_init（存放示例数据） 俩个库。 <br>

## 谁在使用

希望你们的logo出现在此，[请点此Issue进行登记](https://gitee.com/anji-plus/report/issues/I3ZXT4) ，我们将优先进行技术支持 <br>

<a href='http://www.anji-plus.com/'> <img src="https://ajreport.beliefteam.cn/file/download/d287d4d3-d30b-4850-9bac-a6c991409251" width = "130" height = "50" align=left/> </a>
<a href='https://www.yunstech.cn/'><img src="https://www.yunstech.cn/images/logo.png" width = "130" height = "50" /> </a>
<a href='http://www.fgkb.net/'><img src="https://ajreport.beliefteam.cn/file/download/9ee5b709-5033-4cd5-a784-ebd2877fd373" width = "130" height = "50" /> </a>
<a href='http://www.turingoal.com/'><img src="https://ajreport.beliefteam.cn/file/download/cda7bf68-376b-45dc-9a55-c52b21e4a8c8" width = "130" height = "50" /> </a>
<a href='https://www.gykjweb.com/'><img src="https://ajreport.beliefteam.cn/file/download/d13b03f5-0c20-4878-9a79-f3c76b44bfd9" width = "130" height = "130" /> </a> <br>
<a href='http://www.plian.net/'><img src="https://ajreport.beliefteam.cn/file/download/7838f2c2-fdce-4ca7-8373-14d13dcda5cc" width = "130" height = "50" /> </a>
<a href='https://www.zjjcl.cn/'><img src="https://ajreport.beliefteam.cn/file/download/8df07663-60c9-4e32-a0f2-0ea7d5c46ff9" width = "130" height = "50" /> </a>
<a href='http://www.jiuyinkj.com/'><img src="https://ajreport.beliefteam.cn/file/download/5889f0e6-ba08-4990-ac89-eabfbb8af8bd" width = "130" height = "50" /> </a>

## 未来计划

- 大屏宽高动态可视化
- nodeV16适配
- 增加省市区地图等图
- 增加基础边框样式
- Execl报表功能增加与bug修复

## 已知问题

- IE白屏（兼容性问题）

## 版本问题

已知以下版本存在兼容性问题

- Node.js V16
- openJdk
- Jdk 11
- Mysql 8.0（8.0.23/26版本没有问题，8.0.21版本存在问题）

**[常见问题](https://ajreport.beliefteam.cn/report-doc/guide/question.html)**

## 商业授权

AJ-Report使用[Apache2.0开源协议](http://www.apache.org/licenses/LICENSE-2.0.html) <br>
个人和企业，在直接使用、二次开发后商业使用，需要遵守：

- 包含AJ-Report LICENSE文件（授权使用者免费使用AJ-Report专利和知识产权）
- 如果修改了代码，需要在被修改的文件中说明
- 在修改和有源代码衍生的代码中，需要带有原来代码中的协议，商标
- 在二次开发后商业发布的产品中，使用了多个开源软件，则必须包含一个Notice文件，在Notice文件中需要带有AJ-Report LICENSE。你可以在Notice中增加自己的许可，但不可以表现为对AJ-Report
  LICENSE构成更改。

如果您需要商业化增值服务，请加下面的微信沟通，并直接说明来意。

## 技术支持

**如有问题，请提交 [Issue](https://gitee.com/anji-plus/report/issues) <br>**
个人企业微信：加微信进群备注 AJ-Report 或者 Report <br>
如果不是为了进群，请直接说明来意，每天加群的都很多，企微也是我们自己的工作企微，会有很多消息会被刷下去，如果半天没有回复你，请发送多次 <br>
<img src="https://images.gitee.com/uploads/images/2021/0729/130901_1672e6c5_7492051.jpeg" width = "200" height = "200" align=left/>

AJ-Report技术交流三群，新群可直接加<br>
<img src="https://images.gitee.com/uploads/images/2021/1101/130421_caa25124_7492051.jpeg" width = "200" height = "200" align=left/> <br>

#### 开源不易，劳烦各位star ☺

