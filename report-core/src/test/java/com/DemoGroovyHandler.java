package com;

import com.alibaba.fastjson.JSONObject;
import com.anjiplus.template.gaea.business.modules.datasettransform.service.IGroovyHandler;

import java.util.List;

/**
 * 建议在idea写好复制整个类到此处，位置report-core/src/test/java/com/DemoGroovyHandler.java
 */
public class DemoGroovyHandler implements IGroovyHandler {

    @Override
    public List<JSONObject> transform(List<JSONObject> data) {

        return data;
    }
}
