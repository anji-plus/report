**搭建aj-report开发环境**

# 工具版本

参考

[Mysql] 5.7

[Jdk] 1.8

[Spring Boot] 2.3.5

[Mybatis-plus] 3.3.2

[flyway] 5.2.1

[Apache Maven] 3.5

[Node.js] 14.16.0

[Windows 10]

实际

Mysql 5.7.34

JDK 1.8u291

IdeaJ 2020.2.1

Spring Boot DTD

Maven 3.5.4

Windows7

Git 2.33.0 x64

Node 13.14.0-x64

Vscode 1.59.0

# 环境准备

共分前端、公共、后端。

## 后端

### Mysql

下载mysql数据库

下载地址

<https://dev.mysql.com/downloads/installer/>

步骤，【选择安装类型】（即Choosing a Setup Type），选择【仅服务器】（即Server
only）

步骤，【类型和网络】（即Type and Networking），选择【开发电脑】（即Development
Computer）

步骤，【账户和角色】（即Account and Roles），root密码设置为root。

步骤，【Windows服务】（即Windows
Service），勾选【配置MySQL服务作为一个Windows服务】（即Configure MySQL Server as
a Windows Service）。

除以上外，都采用默认，一直下一步，直至安装完成。

### JDK

采用默认安装，一直下一步，直至完成。

配置环境变量

JAVA_HOME C:\\Program Files\\Java\\jdk1.8.0_291

### IdeaJ

采用默认安装，一直下一步，直至完成。

### Maven

下载地址

https://dlcdn.apache.org/maven/maven-3/3.5.4/binaries/

将压缩包解压到路径：C:\\Program Files\\

添加环境变量M2_HOME C:\\Program Files\\apache-maven-3.5.4

（旧版变量写法：MAVEN_HOME）

调整Path环境变量，增加 ;%M2_HOME%C:\\bin

### 插件

IdeaJ安装spring boot开发插件

已自带，不用再安装。

安装lombok

## 公共

### Git

#### 安装

采用默认安装，一直下一步，直至完成。

#### 拉代码

为idea指定git路径

默认情况下，IDEA是不自带git运行程序的，所以需要通过  
菜单-\>settings-\>Version Control-\>Git-\>Path to Git executable:
设置为安装git中所安装的git.exe

获取gitee上面的要拉取项目的url，即页面左上方【可隆/下载】，单击选择【复制】，即可获得url。

在ideaj中，选择路径，file -\> new -\> Project from Version Control -\> Git，

将url复制到URL后的方框，

选择本地目录（即Directory）

点击【Clone】，开始拉代码。

## 前端

### Node

采用默认安装，一直下一步，直至完成。

### Vscode

步骤，【选择附件任务】，勾选【添加到PATH（重启后生效）】

其余采用默认安装，一直下一步，直至完成。

# 开发环境

## 后端

新建文件夹用于存放后端代码C:\\ijproj，将git下载的代码解压至该目录。

### 下载源码

具体步骤见Git2.2.1.2拉代码

### 依赖插件

下载依赖和插件。Git完代码后，会自动下载依赖和插件。如果pom中的依赖和插件爆红。可设置maven，File
——\> Settings。找到Maven，相关的三项设置，包括：Maven home directory、User
settings file、Local repository，可直接使用默认设置。

遇到个别顽固爆红的依赖和插件，可以直接在本地资料库.m2\\repository中查找，确认是否已经下载。确认已经下载的话，则可以尝试在该依赖或者插件中增加版本号（与资料库中的一致，org.springframework.boot对应的路径
资料库路径\\org\\springframework\\boot，spring-boot-maven-plugin对应上述路径的子文件夹spring-boot-maven-plugin，此文件夹即spring-boot-maven-plugin的子文件夹是版本号2.3.5.RELEASE，打开2.3.5.RELEASE就是对应的jar包等内容）。

### 设置Mysql

设置好mysql，以便运行时，自动进行初始化。

配置文件路径：/src/main/resources/bootstrap.yml，在此文件中找到datasource
mysql的配置信息，修改IP地址为mysql所在机器的IP，调整用户密码。本文中为本地即localhost或者用127.0.0.1，用户为root，密码为root。

### 运行后端

确认启动了Mysql服务

然后运行后端程序

## 前端

### 下载源码

新建文件夹C:\\vsproj用于存放前端项目源码

下载源码，在vscode使用【ctrl】+【\`】或者【Terminal】-\>【New
Terminal】。用cd命令进入相应的文件夹。

执行git clone https://gitee.com/anji-plus/report.git，拉代码。

### 设置环境

调整配置文件，配置文件路径REPORT-UI/config/dev.env.js，调整BASE_API后URL地址中的IP、端口。若都在同一台电脑，直接使用IP：127.0.0.1，端口使用默认9095。

（连接后端的IP，改为后端API代码所在的IP、所使用的端口。）

### 编译运行

在vscode使用【ctrl】+【\`】或者【Terminal】-\>【New
Terminal】。用cd命令进入前端代码文件夹，执行如下命令：

命令一：cd C:\\vsproj\\report\\report-ui

命令二：npm init -y

命令三：npm install

命令四：npm run dev

命令四执行后，启动了前端，在浏览器中输入http://localhost:9528/\#/login

## 启动

启动顺序：确保数据库启动、确保后端启动、最后启动前端

1确保mysql已经启动

2运行后端代码

3运行前端代码

4浏览器输入http://localhost:9528/\#/login

用户：admin

密码：123456

# 错误

## 问题一

遇到Error creating bean with name 'flywayInitializer' defined in class path
resource解决办法

将这个Resolved
locally后面的**版本号复制**下来，连着符号一起复制，然后找到你数据库中的**flyway_schema
\_history**这个表，在最下面那一行数据中把刚刚复制的版本号替换进去就可以了。

## 问题二

问题现象：报表设计界面中看不到图表，

查看日志，Access denied for user 'ajreport'@'localhost' (using password: YES)

在系统【数据源】中调整设置，将IP、用户、密码等调整为在用的。

默认用户ajreport，密码ajreport

改为初始化时的，用户root，密码root
