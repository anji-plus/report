package com.anjiplus.template.gaea.business.modules.reportexcel.dao.entity;

import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author chenkening
 * @date 2021/4/13 15:11
 */
@TableName(value = "gaea_report_excel")
@Data
public class ReportExcel extends GaeaBaseEntity {

    /** 报表编码 */
    private String reportCode;

    /** 数据集编码，以|分割 */
    private String setCodes;

    /** 数据集查询参数 */
    private String setParam;

    /** 报表json字符串 */
    private String jsonStr;

    /** 0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG */
    private Integer enableFlag;

    /** 0--未删除 1--已删除 DIC_NAME=DELETE_FLAG */
    private Integer deleteFlag;
}
