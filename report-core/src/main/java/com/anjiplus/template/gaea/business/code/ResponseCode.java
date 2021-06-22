package com.anjiplus.template.gaea.business.code;

/**
 * 响应码
 * @author lr
 * @since 2021-02-22
 */
public interface ResponseCode {

    /**
     * 字典项重复
     */
    String DICT_ITEM_REPEAT = "Dict.item.code.exist";

    /**
     * 数字字典国际化标识不能为null
     */
    String DICT_CODE_LOCALE_NULL = "500-00002";

    /**
     * 参数为空
     */
    String PARAM_IS_NULL = "Rule.execute.param.null";

    /**
     * 规则编译不通过
     */
    String RULE_CONTENT_COMPILE_ERROR = "Rule.content.compile.error";

    /**
     * 规则执行不通过
     */
    String RULE_CONTENT_EXECUTE_ERROR = "Rule.content.execute.error";

    /**
     * 规则编码已存在
     */
    String RULE_CODE_EXIST = "Rule.code.exist";

    /**
     * 对应规则内容不存在
     */
    String RULE_CONTENT_NOT_EXIST = "Rule.content.not.exist";

    /**
     * 对应规则字段值不存在
     */
    String RULE_FIELDS_NOT_EXIST = "Rule.fields.not.exist";

    /**
     * 规则字段必填
     */
    String RULE_FIELD_VALUE_IS_REQUIRED = "Rule.field.value.is.required";

    /**
     * 规则字段值类型错误
     */
    String RULE_FIELD_VALUE_TYPE_ERROR = "Rule.field.value.type.error";

    /**
     * 规则参数校验不通过
     */
    String RULE_FIELDS_CHECK_ERROR = "Rule.fields.check.error";
    /**
     * 组件未加载
     */
    String COMPONENT_NOT_LOAD = "Component.load.check.error";
}
