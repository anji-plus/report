package com.anjiplus.template.gaea.business.constant;

/**
 * 常量
 * @author lr
 * @since 2021-03-26
 */
public interface BusinessConstant {

    /**
     * 字典项重复
     */
    String DICT_ITEM_EXIST_GROUP = "dictItemExist";

    /**
     * 所有url的权限码缓存key
     */
    String GAEA_SECURITY_AUTHORITIES= "gaea:security:authorities:all";

    /**
     * 用户登录的token缓存key
     */
    String GAEA_SECURITY_LOGIN_TOKEN = "gaea:security:login:token:%s";

    /**
     * 用户登录的主信息缓存信息
     */
    String GAEA_SECURITY_LOGIN_USER = "gaea:security:login:user:%s";
}
