package com.anjiplus.template.gaea.business.util;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Sets;
import jdk.nashorn.api.scripting.NashornScriptEngineFactory;
import jdk.nashorn.api.scripting.ScriptObjectMirror;
import org.springframework.core.NamedInheritableThreadLocal;
import org.springframework.stereotype.Component;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Component
public class JsEngineUtil {

    final Set<String> blackList = Sets.newHashSet(
            "java.lang.ProcessBuilder", "java.lang.Runtime", "java.lang.ProcessImpl");
    ThreadLocal<ScriptEngine> engineHolder = new NamedInheritableThreadLocal<ScriptEngine>("jsEngine") {
        @Override
        protected ScriptEngine initialValue() {
            NashornScriptEngineFactory factory = new NashornScriptEngineFactory();
            return factory.getScriptEngine((clz) -> {
                return !blackList.contains(clz);
            });
        }
    };

    public ScriptEngine getEngine() {
        return engineHolder.get();
    }

    ;

    private String filter(String input) {
        //把blackList中的类替换成空字符串
        for (String clz : blackList) {
            input = input.replace(clz, "");
        }
        return input;
    }

    public List<JSONObject> eval(String js, List<JSONObject> data) throws Exception {
        ScriptEngine engine = getEngine();
        engine.eval(filter(js));
        if (engine instanceof Invocable) {
            Invocable invocable = (Invocable) engine;
            Object dataTransform = invocable.invokeFunction("dataTransform", data);
            if (dataTransform instanceof List) {
                return (List<JSONObject>) dataTransform;
            }
            //前端js自定义的数组[{"aa":"bb"}]解析后变成{"0":{"aa":"bb"}}
            ScriptObjectMirror scriptObjectMirror = (ScriptObjectMirror) dataTransform;
            List<JSONObject> result = new ArrayList<>();
            scriptObjectMirror.forEach((key, value) -> {
                ScriptObjectMirror valueObject = (ScriptObjectMirror) value;
                JSONObject jsonObject = new JSONObject();
                jsonObject.putAll(valueObject);
                result.add(jsonObject);
            });
            return result;
        }
        return null;
    }

    public Object verification(String validationRules, Object dataSetParamDto) throws Exception {
        ScriptEngine engine = getEngine();
        engine.eval(filter(validationRules));
        if (engine instanceof Invocable) {
            Invocable invocable = (Invocable) engine;
            Object exec = invocable.invokeFunction("verification", dataSetParamDto);
            ObjectMapper objectMapper = new ObjectMapper();
            if (exec instanceof Boolean) {
                return objectMapper.convertValue(exec, Boolean.class);
            } else {
                return objectMapper.convertValue(exec, String.class);
            }
        }
        return null;
    }
}
