package com.anjiplus.template.gaea.business.modules.accessuser.controller.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class UpdatePasswordDto {

    /** 旧密码密码 */
    @NotBlank
    private String oldPassword;

    /** 新密码 */
    @NotBlank
    private String password;

    /** 确认密码 */
    @NotBlank
    private String confirmPassword;
}
