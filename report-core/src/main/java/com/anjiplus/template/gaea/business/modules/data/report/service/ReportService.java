package com.anjiplus.template.gaea.business.modules.data.report.service;

import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anjiplus.template.gaea.business.modules.data.report.controller.dto.ReportDto;
import com.anjiplus.template.gaea.business.modules.data.report.controller.param.ReportParam;
import com.anjiplus.template.gaea.business.modules.data.report.dao.entity.Report;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/3/26 10:35
 */
public interface ReportService extends GaeaBaseService<ReportParam, Report> {

    void delReport(ReportDto reportDto);
}
