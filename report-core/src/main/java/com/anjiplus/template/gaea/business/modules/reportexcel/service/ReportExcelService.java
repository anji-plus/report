package com.anjiplus.template.gaea.business.modules.reportexcel.service;


import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelDto;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.param.ReportExcelParam;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.entity.ReportExcel;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/4/13 15:14
 */
public interface ReportExcelService extends GaeaBaseService<ReportExcelParam, ReportExcel> {

    /**
     * 根据报表编码查询详情
     *
     * @param reportCode
     * @return
     */
    ReportExcelDto detailByReportCode(String reportCode);

    /**
     * 报表预览
     *
     * @param reportExcelDto
     * @return
     */
    ReportExcelDto preview(ReportExcelDto reportExcelDto);

    /**
     * 导出为excel
     *
     * @param reportExcelDto
     * @return
     */

    ResponseEntity<byte[]> exportExcel(HttpServletRequest request, HttpServletResponse response,ReportExcelDto reportExcelDto) throws IOException;

//    Boolean exportPdf(ReportExcelDto reportExcelDto);
}
