package com.anjiplus.template.gaea.business.modules.data.reportexcel.controller;

import com.anji.plus.gaea.annotation.Permission;
import com.anji.plus.gaea.annotation.log.GaeaAuditLog;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anji.plus.gaea.code.ResponseCode;
import com.anji.plus.gaea.curd.controller.GaeaBaseController;
import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.controller.dto.ReportExcelDto;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.controller.param.ReportExcelParam;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.dao.entity.ReportExcel;
import com.anjiplus.template.gaea.business.modules.data.reportexcel.service.ReportExcelService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chenkening
 * @date 2021/4/13 15:12
 */
@RestController
@Api(tags = "报表表格管理")
@RequestMapping("/reportExcel")
public class ReportExcelController extends GaeaBaseController<ReportExcelParam, ReportExcel, ReportExcelDto> {

    @Autowired
    private ReportExcelService reportExcelService;

    @Override
    public GaeaBaseService<ReportExcelParam, ReportExcel> getService() {
        return reportExcelService;
    }

    @Override
    public ReportExcel getEntity() {
        return new ReportExcel();
    }

    @Override
    public ReportExcelDto getDTO() {
        return new ReportExcelDto();
    }

    @GetMapping("/detailByReportCode/{reportCode}")
    @Permission(
            code = "DETAIL",
            name = "详情"
    )
    @GaeaAuditLog(
            pageTitle = "详情"
    )
    public ResponseBean detailByReportCode(@PathVariable String reportCode) {
        ReportExcelDto reportExcelDto = reportExcelService.detailByReportCode(reportCode);
        return ResponseBean.builder().data(reportExcelDto).build();
    }

    @PostMapping("/preview")
    @Permission(
            code = "DETAIL",
            name = "预览"
    )
    @GaeaAuditLog(
            pageTitle = "预览"
    )
    public ResponseBean preview(@RequestBody ReportExcelDto reportExcelDto) {
        ReportExcelDto result = reportExcelService.preview(reportExcelDto);
        return ResponseBean.builder().data(result).build();
    }


    @PostMapping("/exportExcel")
    @Permission(
            code = "IMPORT",
            name = "导出"
    )
    @GaeaAuditLog(
            pageTitle = "报表导出"
    )
    public ResponseBean exportExcel(@RequestBody ReportExcelDto reportExcelDto) {

        return ResponseBean.builder().code(ResponseCode.SUCCESS_CODE)
                .data(reportExcelService.exportExcel(reportExcelDto))
                .message("导出成功，请稍后在下载中心查看").build();
    }

//    @PostMapping("/exportPdf")
//    public ResponseBean exportPdf(@RequestBody ReportExcelDto reportExcelDto) {
//        reportExcelService.exportPdf(reportExcelDto);
//        return ResponseBean.builder().code(ResponseCode.SUCCESS_CODE)
//                .build();
//    }
}
