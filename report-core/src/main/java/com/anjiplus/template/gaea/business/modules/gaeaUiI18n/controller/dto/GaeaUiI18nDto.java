
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller.dto;

import java.io.Serializable;

import com.anji.plus.gaea.curd.dto.GaeaBaseDTO;
import com.anji.plus.gaea.annotation.Formatter;
import lombok.Data;
import java.sql.Timestamp;


/**
*
* @description ui文字国际化处理 dto
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@Data
public class GaeaUiI18nDto extends GaeaBaseDTO implements Serializable {
    /** 语言标识 */
    @Formatter(dictCode = "LOCALE",targetField = "localeCn")
    private String locale;
    private String localeCn;

    /** 行业标识 */
    @Formatter(dictCode = "SYS_CATA_TYPE",targetField = "cataTypeCn")
    private String cataType;
    private String cataTypeCn;

    /** 所属系统 */
    private String system;

    /** 所属菜单编号 */
    private String module;

    /** 字段编码 */
    private String code;

    /** 字段名称 */
    private String name;

    /** 业务描述 */
    private String remark;
    private String refer;
    /** 启用状态 */
    @Formatter(dictCode = "ENABLE_FLAG",targetField = "enabledCn")
    private Integer enabled;
    private String enabledCn;

}