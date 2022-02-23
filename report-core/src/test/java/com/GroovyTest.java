package com;

import com.alibaba.fastjson.JSONObject;
import com.anjiplus.template.gaea.business.modules.datasettransform.service.IGroovyHandler;
import groovy.lang.GroovyClassLoader;

import java.util.List;

/**
 * @author: Raod
 * @since: 2022-02-23
 */
public class GroovyTest {


    public static void main(String[] args) throws InstantiationException, IllegalAccessException {
        // codeSource来自DemoGroovyHandler
        String codeSource = "package com;\n" +
                "\n" +
                "import com.alibaba.fastjson.JSONObject;\n" +
                "import com.anjiplus.template.gaea.business.modules.datasettransform.service.IGroovyHandler;\n" +
                "\n" +
                "import java.util.ArrayList;\n" +
                "import java.util.List;\n" +
                "\n" +
                "/**\n" +
                " * @author: Raod\n" +
                " * @since: 2022-02-23\n" +
                " */\n" +
                "public class DemoGroovyHandler implements IGroovyHandler {\n" +
                "\n" +
                "    @Override\n" +
                "    public List<JSONObject> transform(List<JSONObject> data) {\n" +
                "        List<JSONObject> result = new ArrayList<>();\n" +
                "        JSONObject jsonObject = new JSONObject();\n" +
                "        jsonObject.put(\"test\", \"demo\");\n" +
                "        result.add(jsonObject);\n" +
                "        return result;\n" +
                "    }\n" +
                "}";
        GroovyClassLoader groovyClassLoader = new GroovyClassLoader();
        Class<?> clazz = groovyClassLoader.parseClass(codeSource);
        if (clazz != null) {
            Object instance = clazz.newInstance();
            if (instance!=null) {
                if (instance instanceof IGroovyHandler) {
                    IGroovyHandler handler = (IGroovyHandler) instance;
                    List<JSONObject> transform = handler.transform(null);
                    System.out.println(JSONObject.toJSONString(transform));

                } else {
                    System.err.println("转换失败！");
                }
            }
        }
    }

}
