package com.anjiplus.template.gaea.business.modules.accessuser.controller.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

@Data
public class GaeaUserDto {

    /** 登录名*/
    @NotBlank
    private String loginName;

    /** 密码*/
    @NotBlank
    private String password;

    /** 真实用户 */
    private String realName;

    /** 登录成功后的 */
    private String token;

    /** 用户所拥有的权限合集 */
    private List<String> authorities;
}
