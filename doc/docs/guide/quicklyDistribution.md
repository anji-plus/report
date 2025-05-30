```
 第一步，下载zip包，解压
 第二步，conf->bootstrap.yml，修改数据库连接、上传下载地址、jwt令牌等信息
 第三步，启动bin目录下start.sh
 第四步，访问 http://localhost:9095  admin 123456
```

## 版本问题

已知以下版本存在兼容性问题，请不要使用

- openJdk
- Jdk 1.7及以下/11及以上（jdk11部分版本有问题）
- Mysql 8.0（8.0.23/26版本没有问题，8.0.21版本存在问题）

## 下载发行版

[下载地址](https://gitee.com/anji-plus/report/releases) ：https://gitee.com/anji-plus/report/releases <br>
![img.png](../picture/quickly/img_16.png) <br>

## 修改mysql连接

解压下载好的Zip包，找到bootstrap.yml <br>
![img_1.png](../picture/quickly/img_17.png) <br>

将图中关于mysql的连接配置信息换成你使用的IP:数据库名。如果没有修改flyway为false，那flyway会自动建立aj_report库 <br>

![bootstrap.png](../picture/quickly/img_2.png) <br>
**注**：请确认你的Mysql是否支持远程连接，登陆用户是否有DDL权限 <br>

```yaml
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/aj_report?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&useSSL=false
    username: root
    password: xxxxxxxx
```

## flyway

flyway是用于自动执行sql，因为mysql版本及配置等问题，flyway可能会执行失败。如果你mysql没问题，注意检查flyway是否开启。<br>

```yaml
  flyway:
    enabled: false    #是否开启flyway（自动执行sql脚本），默认false
```

## OSS配置

OSS底层已支持minio、amazonS3、nfs，都配置的情况下优先级minio->amazonS3->nfs <br>
![file.png](../picture/quickly/img.png) <br>

```yaml
  gaea:
    subscribes:
      oss: #文件存储 都配置的情况下优先级minio->amazonS3->nfs
        enabled: true
        ##允许上传的文件后缀
        file-type-white-list: .png|.jpg|.gif|.icon|.pdf|.xlsx|.xls|.csv|.mp4|.avi|.jpeg|.aaa|.svg
        # 用于文件上传成功后，生成文件的下载公网完整URL，http://serverip:9095/file/download，注意填写IP必须填写后端服务所在的机器IP
        downloadPath: http://10.108.26.197:9095/file/download
        nfs:
          #上传对应本地全路径，注意目录不会自动创建，注意 Win是 \ 且有盘符，linux是 / 无盘符，注意目录权限问题
          path: /app/disk/upload/
```

## jwt秘钥

生产环境请自行修改，避免被远程伪造登录攻击 <br>
[随机密码生成器](http://www.chahuo.com/token-generator.html)

```yaml
    Security:
      # jwt密钥，生产环境请自行修改，避免被远程伪造登录攻击
      jwtSecret: TybmmfrgsIqpPsBOYxvygCMVJWKNfDJU
```

## 启动

linux启动：<br>
aj-report-XXX --> bin -->sh start.sh <br>

windows启动：<br>
aj-report-XXX --> bin --> start.bat <br>

![img18](../picture/quickly/img_18.png) <br>

如果start.bat启动有问题的话，可以尝试以下方法解决。<br>
修改第4行的JAVA_HOME，改成你自己的JAVA_HOME，并去掉**rem**注释，双击启动<br>
![java.png](../picture/quickly/img_7.png)

## 访问

http://localhost:9095 <br>
默认密码：admin 123456 <br> 



