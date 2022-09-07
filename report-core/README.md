## 后端springboot

### 采用redis缓存

#### 1.pom文件
```java
<dependency>
    <groupId>com.anji-plus</groupId>
    <artifactId>spring-boot-gaea</artifactId>
    <version>2.0.5.RELEASE</version>
    <exclusions>
        <exclusion>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </exclusion>
    </exclusions>
</dependency>
```
删除exclusions内容，因为底层默认支持redis
删除ehcache相关依赖

#### 2.删除 package com.anjiplus.template.gaea.business.cache
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

#### 3.bootstrap.yml加上对应的redis配置即可

