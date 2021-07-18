package com.anjiplus.template.gaea.business.runner;

import com.anji.plus.gaea.constant.Enabled;
import com.anji.plus.gaea.init.InitRequestUrlMappings;
import com.anjiplus.template.gaea.business.modules.dict.service.GaeaDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;

import java.util.List;

/**
 * 启动加载后执行
 * @author lr
 * @since 2021-04-08
 */
public class ApplicationInitRunner implements ApplicationRunner {

    @Autowired
    private GaeaDictService gaeaDictService;

    @Autowired
    private InitRequestUrlMappings initRequestUrlMappings;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        //1、数据字典刷新
        // gaeaDictService.refreshCache(null);

        //获取当前应用中所有的请求信息
        //List<InitRequestUrlMappings.RequestInfo> requestInfos = initRequestUrlMappings.getRequestInfos(Enabled.YES.getValue());

        //System.out.println(requestInfos);
    }
}
