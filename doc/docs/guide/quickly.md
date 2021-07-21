## 快速部署
下载地址：[https://gitee.com/anji-plus/report/releases](https://gitee.com/anji-plus/report/releases)
```js
 第一步，下载zip包，解压<br>
 第二步，conf->bootstrap-dev.yml，修改mysql连接<br>
 第三步，启动bin目录下start.sh<br>
 第四步，访问 http://localhost:9095/index.html
```

## 编译打包
在Linux上先准备好maven、node.js、jdk
- [Apache Maven] 3.5 +<br>
- [Node.js] v14.16.0+<br>
- [Jdk] 1.8+
```
git clone https://gitee.com/anji-plus/report.git
cd report
sh build.sh
编译完成放在build文件夹 report-core-xxxx.zip

unzip report-core-xxxx.zip
cd report-core-xxxx
vim conf/bootstrap-dev.yml 数据库连接、上传文件的路径以及地址修改
sh bin/start.sh

启动后访问
http://serverip:9095
```

也可以前后端分开单独部署，前端部署nginx，后端jar

## 系统特性
1. 最新最稳定的技术栈；
2. 支持多数据源配置
3. 丰富的大屏组件。拖拽配置实现动态大屏

## 核心技术
### 后端
- [Spring Boot](https://spring.io/projects/spring-boot/): Spring Boot是一款开箱即用框架，让我们的Spring应用变的更轻量化、更快的入门。 在主程序执行main函数就可以运行。你也可以打包你的应用为jar并通过使用java -jar来运行你的Web应用；
- [Mybatis-plus](https://mp.baomidou.com/): MyBatis-plus（简称 MP）是一个 MyBatis (opens new window) 的增强工具。
- [flyway](https://flywaydb.org/): 主要用于在你的应用版本不断升级的同时，升级你的数据库结构和里面的数据
### 前端
- [npm](https://www.npmjs.com/)：node.js的包管理工具，用于统一管理我们前端项目中需要用到的包、插件、工具、命令等，便于开发和维护。
- [webpack](https://webpack.docschina.org/)：用于现代 JavaScript 应用程序的_静态模块打包工具
- [ES6](https://es6.ruanyifeng.com/)：Javascript的新版本，ECMAScript6的简称。利用ES6我们可以简化我们的JS代码，同时利用其提供的强大功能来快速实现JS逻辑。
- [vue-cli](https://cli.vuejs.org/)：Vue的脚手架工具，用于自动生成Vue项目的目录及文件。
- [vue-router](https://router.vuejs.org/)： Vue提供的前端路由工具，利用其我们实现页面的路由控制，局部刷新及按需加载，构建单页应用，实现前后端分离。
- [vuex](https://vuex.vuejs.org/)：Vue提供的状态管理工具，用于统一管理我们项目中各种数据的交互和重用，存储我们需要用到数据对象。
- [element-ui](https://element.eleme.cn/#/zh-CN)：基于MVVM框架Vue开源出来的一套前端ui组件。
- [avue](https://www.avuejs.com/): 用该组件包裹后可以变成拖拽组件,采用相对于父类绝对定位;用键盘的上下左右也可以控制移动

