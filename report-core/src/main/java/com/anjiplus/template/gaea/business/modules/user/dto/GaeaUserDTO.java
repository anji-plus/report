package com.anjiplus.template.gaea.business.modules.user.dto;

import com.anji.plus.gaea.annotation.Unique;
import com.anji.plus.gaea.curd.dto.GaeaBaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;


@ApiModel(value = "用户表")
@Data
public class GaeaUserDTO extends GaeaBaseDTO {

    @ApiModelProperty(value = "用户登录名")
    @NotBlank
    private String username;

    @ApiModelProperty(value = "用户密码")
    @NotBlank
    private String password;
}
