package com.anjiplus.template.gaea.business.runner;

import com.anjiplus.template.gaea.business.modules.dict.service.GaeaDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;

/**
 * 启动加载后执行
 * @author lr
 * @since 2021-04-08
 */
public class ApplicationInitRunner implements ApplicationRunner {

    @Autowired
    private GaeaDictService gaeaDictService;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        //1、数据字典刷新
        gaeaDictService.refreshCache(null);
    }
}
