package com.anjiplus.template.gaea.business.modules.accessuser.controller.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@ApiModel(value = "用户登录")
@Data
public class GaeaUserDto {

    @ApiModelProperty(value = "登录名")
    @NotBlank
    private String loginName;

    @ApiModelProperty(value = "密码")
    @NotBlank
    private String password;
}
