## 后端springboot

### 采用redis缓存

#### 1.pom.xml文件改动
- 1、增加redis依赖,删除exclusions即可
```xml
<dependency>
    <groupId>com.anji-plus</groupId>
    <artifactId>spring-boot-gaea</artifactId>
    <version>2.0.5.RELEASE</version>
    <!--删除下方内容-->
    <exclusions>
        <exclusion>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </exclusion>
    </exclusions>
    <!--删除-->
</dependency>
```

- 2、 删除ehcache相关依赖
```xml
        <dependency>
            <groupId>net.sf.ehcache</groupId>
            <artifactId>ehcache</artifactId>
            <version>2.10.6</version>
        </dependency>
```


#### 2.删除代码
- 1、删除cache文件夹 
目录地址：com.anjiplus.template.gaea.business.cache

- 2、删除相关bean
文件地址：com.anjiplus.template.gaea.business.config.BusinessAutoConfiguration.java
```java
    @Bean
    public CacheHelper gaeaCacheHelper(){
        return new ReportCacheHelper();
    }

    @Bean
    public EhCacheCache ehCacheCache() {
        return (EhCacheCache) ehCacheCacheManager().getCache("reportCache");
    }

    /**
     * 创建ehCacheCacheManager
     */
    @Bean
    public EhCacheCacheManager ehCacheCacheManager() {

        return new EhCacheCacheManager();
    }
```

底层的实现方式如下：
CacheHelper底层默认实现为RedisCacheHelper。
@ConditionalOnMissingBean 注解起到的作用
```java
package com.anji.plus.gaea;

@Configuration
@EnableConfigurationProperties({GaeaProperties.class})
public class GaeaAutoConfiguration {
    @Bean
    @ConditionalOnClass({RedisAutoConfiguration.class})
    @ConditionalOnMissingBean
    public CacheHelper cacheHelper() {
        return new RedisCacheHelper();
    }
}
```

#### 3.bootstrap.yml加上对应的redis配置
注意yml格式
```yaml
spring:
  redis:
    host: 10.108.x.x
    port: 6379
    password: ****
    database: 1
    timeout: 10000
    pool:
      max-active: 8
      max-idle: 8
      max-wait: -1
      min-idle: 0

```
哨兵模式
```yaml
spring:
  redis:
    sentinel:
      master: master01
      nodes: 10.108.xx.xx:26379,10.108.xx.xx:26379,10.108.xx.xx:26379
    database: 1
    password: *******
    timeout: 10000
```
