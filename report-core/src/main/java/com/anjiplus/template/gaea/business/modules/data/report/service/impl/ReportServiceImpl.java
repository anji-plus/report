package com.anjiplus.template.gaea.business.modules.data.report.service.impl;

import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anjiplus.template.gaea.business.modules.data.report.controller.dto.ReportDto;
import com.anjiplus.template.gaea.business.modules.data.report.dao.ReportMapper;
import com.anjiplus.template.gaea.business.modules.data.report.dao.entity.Report;
import com.anjiplus.template.gaea.business.modules.data.report.service.ReportService;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.dao.ReportExcelMapper;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.dao.entity.ReportExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/3/26 10:35
 */
@Service
public class ReportServiceImpl implements ReportService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ReportMapper reportMapper;

    @Autowired
    private ReportExcelMapper reportExcelMapper;

    @Override
    public GaeaBaseMapper<Report> getMapper() {
        return reportMapper;
    }


    @Override
    public void delReport(ReportDto reportDto) {
        deleteById(reportDto.getId());
        QueryWrapper<ReportExcel> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("report_code" , reportDto.getReportCode());
        reportExcelMapper.delete(queryWrapper);
    }
}
