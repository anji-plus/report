## 介绍

![img5](../picture/dateset/img_5.png) <br>

[数据源数据集用法总结](https://my.oschina.net/u/4517014/blog/5270828) <br>

## SQL数据集

尽量不要使用 “select *”，以及展示很大的数据量，图表不一定能展示、页面可能会卡死 <br>

### Mysql数据集

在数据源处添加了mysql的数据源后，即可使用。<br>
![img_1.png](../picture/dateset/img_1.png) <br>

### ES数据集

**注**：es是通过调用xpack-sql，注意写法 <br>
![es.png](../picture/dateset/img.png) <br>

### Kudu数据集

![kudu.png](../picture/dateset/img_2.png) <br>

## HTTP数据集

即原有Http数据源的功能，请注意：Http接口返回类型必须是Json、不能是text，text无法解析 <br>
![http.png](../picture/dateset/img_7.png) <br>

## 功能栏

**可以看在线环境，有示例参考** <br>

### 查询参数

[数据源数据集用法总结](https://my.oschina.net/u/4517014/blog/5270828) <br>

![img3](../picture/dateset/img_3.png) <br>
注意参数名要和sql(请求体)中变量名保持一致，sql(请求体)中的变量用 ${} 表示 <br>

#### 数据类型

暂时无用，写了也不生效，目前统一都是string处理。 <br>

#### 高级规则

是用是针对当前行的参数示例值做一个校验。<br>
返回 true/false，代表校验字段是否符合要求的成功与失败。<br>
返回 String，代表通过一段 js 脚本生成你所需要的参数。<br>
返回其他类型报错！！！<br>

### 数据转换

#### js脚本

**注**：这里的JS是java的scriptengine执行的，很多ES6的语法不支持 <br>
![img4](../picture/dateset/img_4.png) <br>
入参是data，返回值也必须是data，中间是JS的处理过程，注意入参返回都是List<JSONObject>，记得保存。 <br>

#### java脚本

通过Groovy来进行实现的 <br>
[Groovy用法参考](https://my.oschina.net/u/4517014/blog/5526324) <br>

#### 字典项

![img6.png](../picture/dateset/img_6.png) <br>
记得保存

