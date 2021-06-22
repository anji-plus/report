/**/
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller.param;

import lombok.Data;
import java.io.Serializable;
import com.anji.plus.gaea.annotation.Query;
import com.anji.plus.gaea.constant.QueryEnum;
import com.anji.plus.gaea.curd.params.PageParam;

import java.util.List;


/**
* @desc GaeaUiI18n ui文字国际化处理查询输入类
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@Data
public class GaeaUiI18nParam extends PageParam implements Serializable{

    /** 精确查询 */
    @Query
    private String locale;

    /** 精确查询 */
    @Query
    private String cataType;

    /** 精确查询 */
    @Query
    private String system;

    /** 模糊查询 */
    @Query(value = QueryEnum.LIKE)
    private String code;

    /** 模糊查询 */
    @Query(value = QueryEnum.LIKE)
    private String name;

    /** 模糊查询 */
    @Query(value = QueryEnum.LIKE)
    private String remark;

    @Query(value = QueryEnum.EQ)
    private String refer;

    @Query(value = QueryEnum.EQ)
    private String module;

    /** 精确查询 */
    @Query
    private Integer enabled;
}