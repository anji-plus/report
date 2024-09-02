
package com.anjiplus.template.gaea.business.modules.dashboardwidget.dao.entity;

import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
* @description 大屏看板数据渲染 entity
* @author Raod
* @date 2021-04-12 15:12:43.724
**/
@TableName(keepGlobalPrefix=true, value="gaea_report_dashboard_widget")
@Data
public class ReportDashboardWidget extends GaeaBaseEntity {
    /** 报表编码 */
    private String reportCode;

    /** 组件类型参考字典DASHBOARD_PANEL_TYPE */
    private String type;

    /** 组件的渲染属性json */
    private String setup;

    /** 组件的渲染属性json */
    private String data;

    /** 组件的渲染属性json */
    private String collapse;

    /** 组件的渲染属性json */
    private String position;

    private String options;

    /** 自动刷新间隔秒 */
    private Integer refreshSeconds;

    /** 0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG */
    private Integer enableFlag;

    /** 0--未删除 1--已删除 DIC_NAME=DEL_FLAG */
    private Integer deleteFlag;

    /** 排序，图层的概念 */
    private Long sort;


}
