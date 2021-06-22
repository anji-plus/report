
package com.anjiplus.template.gaea.business.modules.data.dashboard.controller;

import com.anji.plus.gaea.annotation.Permission;
import com.anji.plus.gaea.annotation.log.GaeaAuditLog;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anjiplus.template.gaea.business.modules.data.dashboard.controller.dto.ChartDto;
import com.anjiplus.template.gaea.business.modules.data.dashboard.controller.dto.ReportDashboardObjectDto;
import com.anjiplus.template.gaea.business.modules.data.dashboard.service.ReportDashboardService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
* @desc 大屏设计 controller
* @website https://gitee.com/anji-plus/gaea
* @author Raod
* @date 2021-04-12 14:52:21.761
**/
@RestController
@Api(tags = "大屏设计管理")
@RequestMapping("/reportDashboard")
public class ReportDashboardController {

    @Autowired
    private ReportDashboardService reportDashboardService;

    /**
     * 预览、查询大屏详情
     * @param reportCode
     * @return
     */
    @GetMapping({"/{reportCode}"})
    @Permission(code = "DETAIL", name = "明细")
    public ResponseBean detail(@PathVariable("reportCode") String reportCode) {
        return ResponseBean.builder().data(reportDashboardService.getDetail(reportCode)).build();
    }

    /**
     * 保存大屏设计
     * @param dto
     * @return
     */
    @PostMapping
    @Permission(code = "INSERT", name = "新增")
    @GaeaAuditLog(pageTitle = "新增")
    public ResponseBean insert(@RequestBody ReportDashboardObjectDto dto) {
        reportDashboardService.insertDashboard(dto);
        return ResponseBean.builder().build();
    }


    /**
     * 获取去单个图层数据
     * @param dto
     * @return
     */
    @PostMapping("/getData")
    @Permission(code = "DETAIL", name = "明细图表数据")
    public ResponseBean getData(@RequestBody ChartDto dto) {
        return ResponseBean.builder().data(reportDashboardService.getChartData(dto)).build();
    }

}
