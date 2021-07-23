```
 第一步，下载zip包，解压<br>
 第二步，conf->bootstrap-dev.yml，修改mysql连接<br>
 第三步，启动bin目录下start.sh<br>
 第四步，访问 http://localhost:9095/index.html
```

## 下载发行版
下载地址：[https://gitee.com/anji-plus/report/releases](https://gitee.com/anji-plus/report/releases)
![img.png](../picture/quickly/img.png)

## 修改mysql连接
解压下载好的Zip包，找到bootstrap-dev.yml <br>
report-core-XXX --> conf --> bootstrap-dev.yml <br>
![img_1.png](../picture/quickly/img_1.png)

将图中关于mysql的连接配置信息换成你使用的IP <br>
**注**：aj_report库是存放底层基础信息的库，flyway启动时会自动建立，如果你在这里修改了库，将会出错<br>
![bootstrap.png](../picture/quickly/img_2.png)

## 修改路径
使用上传功能，必须修改此内容
![file.png](../picture/quickly/img_5.png)

## 启动
linux启动：report-core-XXX --> bin --> start.sh <br>
windows启动：report-core-XXX --> bin --> start.bat <br>
**注**：beta.4版本的start.bat脚本有问题，会提示无法找到主类，请将脚本中的“-Xbootclasspath/a:%LIB_JARS% %JAVA_OPTS%”剪切放置后面<br>
![img_3.png](../picture/quickly/img_3.png)
如果仍然有问题，请换成start.sh启动
**注**：脚本目前没有校验是否有Jdk、Mysql


## 访问
http://localhost:9095/index.html <br>
默认密码：admin 123456




