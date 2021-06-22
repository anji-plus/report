
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.entity;

import lombok.Data;
import io.swagger.annotations.ApiModelProperty;

import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;

/**
* @description ui文字国际化处理 entity
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@TableName(value="gaea_ui_i18n")
@Data
public class GaeaUiI18n extends GaeaBaseEntity {
    @ApiModelProperty(value = "语言标识")
    private String locale;

    @ApiModelProperty(value = "行业标识")
    private String cataType;

    @ApiModelProperty(value = "所属系统")
    private String system;

    @ApiModelProperty(value = "所属模块")
    private String module;

    @ApiModelProperty(value = "字段编码")
    private String code;

    @ApiModelProperty(value = "字段名称")
    private String name;

    @ApiModelProperty(value = "业务描述")
    private String remark;

    @ApiModelProperty(value = "关联表名")
    private String refer;

    @ApiModelProperty(value = "启用状态")
    private Integer enabled;


}