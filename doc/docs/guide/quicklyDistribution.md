```
 第一步，下载zip包，解压<br>
 第二步，conf->bootstrap.yml，修改mysql连接<br>
 第三步，启动bin目录下start.sh<br>
 第四步，访问 http://localhost:9095
```

## 下载发行版

[下载地址](https://gitee.com/anji-plus/report/releases) ：https://gitee.com/anji-plus/report/releases <br>
![img.png](../picture/quickly/img_16.png) <br>

## 修改mysql连接

解压下载好的Zip包，找到bootstrap.yml <br>
![img_1.png](../picture/quickly/img_17.png) <br>

将图中关于mysql的连接配置信息换成你使用的IP <br>
**注**：aj_report库是存放底层基础信息的库，flyway启动时会自动建立，如果你在这里修改了库，将会出错 <br>

![bootstrap.png](../picture/quickly/img_2.png) <br>
**注**：请确认你的Mysql是否支持远程连接，登陆用户是否有DDL权限 <br>

## 上传功能

使用上传功能，必须修改此内容，注意路径格式，比如Win是 \ ,linux是 / <br>
![file.png](../picture/quickly/img_15.png) <br>

## 启动

linux启动：<br>
aj-report-XXX --> bin -->sh start.sh <br>

windows启动：<br>
aj-report-XXX --> bin --> start.bat <br>

![img18](../picture/quickly/img_18.png) <br>

如果start.bat启动有问题的话，可以尝试以下方法解决。<br>
修改第4行的JAVA_HOME，改成你自己的JAVA_HOME，并去掉**rem**注释，双击启动<br>
![java.png](../picture/quickly/img_7.png) <br>
**注**：如果你JAVA_HOME目录存在空格，将bat文件最下面的JAVA_HOME添加""号
![img.png](../picture/quickly/img_8.png) <br>

## 访问

http://localhost:9095 <br>
默认密码：admin 123456 <br>

## 重置mysql连接

登陆进来后请修改mysql数据源 <br>
数据源 --> mysql数据源 --> 编辑 --> 修改用户名密码（改成你自己系统mysql的用户名密码） <br>
![img](../picture/quickly/img_14.png) <br>
![img_6.png](../picture/quickly/img_6.png) <br>


