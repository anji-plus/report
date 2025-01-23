**前后端分离部署**

- 需要有一定的动手能力和排错能力
- 需要对nginx有一定了解
- 同一台机器部署前后端真心不需要分离部署
- **请根据自己的实际情况对下面的步骤和内容进行调整**

```
linux：
git clone https://gitee.com/anji-plus/report.git
后端：report-code
修改bootstrap.yml 修改数据库连接、上传下载地址、jwt令牌等信息
maven package
java -jar

前端：report-ui
修改前端config连接
BASE_API: '"./"'，改成自己后端服务所在机器的ip地址
npm install
npm run build

使用nginx转发
```

## linux部署后端

### 编译环境

- [Apache Maven] 3.5 <br>
- [Node.js]
    - report1.5以下版本请使用 node<= V14
    - report1.5及以上版本请使用 node>= V16
- [Jdk] 1.8 <br>

### 版本问题

已知以下版本存在兼容性问题，请不要使用

- openJdk
- Jdk 1.7及以下/11及以上（jdk11部分版本有问题）
- Mysql 8.0（8.0.23/26版本没有问题，8.0.21版本存在问题）

### 克隆源码

git clone https://gitee.com/anji-plus/report.git <br>
![img9.png](../picture/quickly/img_9.png) <br>
**注**：不要下载发行版里面的 Source Code.zip <br>

### 修改mysql连接

report-core --> src --> main --> resources --> bootstrap.yml <br>
将图中关于mysql的连接配置信息换成你使用的IP <br>

![bootstrap.png](../picture/quickly/img_2.png) <br>
**注**：请确认你的Mysql是否支持远程连接，登陆用户是否有DDL权限 <br>

```yaml
  datasource:
    url: jdbc:mysql://10.108.26.197:3306/aj_report?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&useSSL=false
    username: root
    password: appuser@anji
```

### OSS配置

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

### jwt秘钥

生产环境请自行修改，避免被远程伪造登录攻击 <br>
[随机密码生成器](http://www.chahuo.com/token-generator.html)

```yaml
    Security:
      # jwt密钥，生产环境请自行修改，避免被远程伪造登录攻击
      jwtSecret: TybmmfrgsIqpPsBOYxvygCMVJWKNfDJU
```

### maven打包

直接使用 maven package 打包，打包完成如图所示<br>

![img10](../picture/quickly/img_10.png) <br>
**注 ：**

```
1、打包之前如果系统用的不止mysql数据源，需要自己在pom文件中加入对应的数据库的驱动，登陆系统之后，数据源提示无驱动，则选择通用JDBC数据源，这里不做演示了
2、此方式不会打包 lib目录下的驱动，详情可查看 "数据源->扩展"
```

### linux启动jar包

将上步生成的jar包上传至linux，使用java -jar命令启动 <br>
**注**：请确保你的linux有jdk1.8 <br>

## 前端编译

**注意:** 每个版本前端可能会有些需要手动调整的部分，这里只写最公共的部分，如果有差异，请看对应版本的release文档。<br>

### install

进入前端目录：report-ui <br>
![img11](../picture/quickly/img_11.png) <br>
执行 npm install <br>

### 修改config

目录地址：report-ui --> config --> prod.env.js <br>
将BASE_API地址，改成自己后端服务所在机器的ip地址 <br>

### build

执行 npm run build <br>

生成的前端dist目录文件在report-ui下面 <br>

![img12](../picture/quickly/img_12.png) <br>

### 前端部署

使用nginx做转发，以下内容仅供参考

```text
server {
    listen       443 ssl;
    server_name  xxx;
    access_log  "/var/log/nginx/report.access.log"  main;
    error_log   "/var/log/nginx/report.cn.error.log"  info;
    ssl_certificate      cert/xxx.report.pem;
    ssl_certificate_key  cert/xxx.report.key;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
    ssl_session_cache    shared:SSL:1m;
    ssl_session_timeout  5m;

    client_max_body_size 600M;
    client_body_buffer_size 10M;
    client_header_buffer_size 512k;
    large_client_header_buffers 16 512k;
    proxy_buffer_size 1024k;
    proxy_buffers 16 1024k;
    proxy_busy_buffers_size 2048k;
    proxy_temp_file_write_size 2048k;
    
    location / {
	index index.html;
        proxy_pass     http://127.0.0.1:9095;
	try_files $uri $uri /index.html =404;
    }

    error_page 404 /404.html;
        location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
        location = /50x.html {
    }
}
```


