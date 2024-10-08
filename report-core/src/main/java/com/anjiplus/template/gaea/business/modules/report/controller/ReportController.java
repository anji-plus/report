package com.anjiplus.template.gaea.business.modules.report.controller;

import com.anji.plus.gaea.annotation.Permission;
import com.anji.plus.gaea.annotation.log.GaeaAuditLog;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anji.plus.gaea.curd.controller.GaeaBaseController;
import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anjiplus.template.gaea.business.modules.report.controller.dto.ReportDto;
import com.anjiplus.template.gaea.business.modules.report.controller.param.ReportParam;
import com.anjiplus.template.gaea.business.modules.report.dao.entity.Report;
import com.anjiplus.template.gaea.business.modules.report.service.ReportService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/3/26 10:19
 */
@RestController

@Permission(code = "reportManage", name = "报表管理")
@RequestMapping("/report")
public class ReportController extends GaeaBaseController<ReportParam, Report, ReportDto> {

    @Autowired
    private ReportService reportService;

    @Override
    public GaeaBaseService<ReportParam, Report> getService() {
        return reportService;
    }

    @Override
    public Report getEntity() {
        return new Report();
    }

    @Override
    public ReportDto getDTO() {
        return new ReportDto();
    }

    @PostMapping("/copy")
    @Permission(code = "copy", name = "复制")
    @GaeaAuditLog(pageTitle = "复制")
    public ResponseBean copy(@RequestBody ReportDto dto) {
        reportService.copy(dto);
        return ResponseBean.builder().build();
    }
}
