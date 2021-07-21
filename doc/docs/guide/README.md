## 简介
&emsp;  &emsp;  AJ-Report是一个完全开源的BI平台，酷炫大屏展示，能随时随地掌控业务动态，让每个决策都有数据支撑。<br>
&emsp;  &emsp;  多数据源支持，内置mysql、elasticsearch、kudu驱动，支持自定义数据集省去数据接口开发，支持17种大屏组件，不会开发，照着设计稿也可以制作大屏。<br>
&emsp;  &emsp;  三步轻松完成大屏设计：配置数据源---->写SQL配置数据集---->拖拽配置大屏---->保存发布。欢迎体验。
## 在线体验
#### &emsp;  电脑在线体验: [https://report.anji-plus.com/index.html](https://report.anji-plus.com/index.html "链接")  &emsp;体验账号：guest  密码：guest
#### &emsp;  在线文档: [https://report.anji-plus.com/report-doc/](https://report.anji-plus.com/report-doc/ "doc")<br>
#### &emsp;  在线提问: [https://gitee.com/anji-plus/report/issues](https://gitee.com/anji-plus/report/issues "issue")<br>

## 发行版本
#### &emsp;  下载链接：[https://gitee.com/anji-plus/report/releases](https://gitee.com/anji-plus/report/releases "下载链接")<br>

## 功能概述
#### &emsp;  组件介绍
&emsp;&emsp; 大屏设计（AJ-Report）是一个可视化拖拽编辑的，直观，酷炫，具有科技感的图表工具全开源项目。
内置的基础功能包括数据源，数据集，报表管理，项目部分截图如下。<br>
**在线案例还在努力创造中，敬请期待！！！**
![操作](https://images.gitee.com/uploads/images/2021/0703/094742_c0243f70_1728982.gif "2021-07-03_09-43-50.gif")

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
│   └── bootstrap-dev.yml
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

## 近期计划
-   完善地图插件
-   完善表格插件
-   丰富自定义框图、挂件
-   丰富更多图表组件

## 技术支持
**如有问题，请提交 [Issue](https://gitee.com/anji-plus/report/issues) <br>**
微信群：<br>
<img src="https://images.gitee.com/uploads/images/2021/0707/154657_c27241c3_1728982.jpeg" width = "200" height = "200" align=left/>
#### 开源不易，劳烦各位star ☺



