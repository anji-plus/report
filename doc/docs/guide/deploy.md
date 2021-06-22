# 系统运行
微服务版本的系统运行,可以在本地开发环境下跑起来。

## 准备工作
1. 环境准备
- JDK >= 1.8 (推荐1.8版本)
- Mysql >= 5.7.0 (推荐5.7版本)
- Redis >= 3.0
- Maven >= 3.0
- Node >= 10
- Nacos >= 1.1.0

2. 从gitee上拉取下载项目源码,并解压到工作目录;

    <https://gitee.com/anji-plus/report.git>

## 运行系统
### 后端运行


### 前端运行

2. 浏览器访问

3. 发布
```
# 构建生产环境
npm run build:prod
```

4. 其他
```
# 预览发布环境效果
npm run preview

# 预览发布环境效果 + 静态资源分析
npm run preview -- --report

# 代码格式检查
npm run lint

# 代码格式检查并自动修复
npm run lint -- --fix
```
