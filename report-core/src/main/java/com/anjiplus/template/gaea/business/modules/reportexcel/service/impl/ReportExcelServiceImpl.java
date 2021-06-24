package com.anjiplus.template.gaea.business.modules.reportexcel.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.exception.BusinessException;
import com.anji.plus.gaea.export.enums.ExportTypeEnum;
import com.anji.plus.gaea.export.utils.ExportUtil;
import com.anji.plus.gaea.export.vo.ExportOperation;
import com.anji.plus.gaea.holder.UserContentHolder;
import com.anji.plus.gaea.utils.GaeaAssert;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.modules.report.dao.ReportMapper;
import com.anjiplus.template.gaea.business.modules.report.dao.entity.Report;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelDto;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.ReportExcelMapper;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.entity.ReportExcel;
import com.anjiplus.template.gaea.business.modules.reportexcel.service.ReportExcelService;
import com.anjiplus.template.gaea.business.modules.reportexcel.util.ReportUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * TODO
 *
 * @author chenkening
 * @date 2021/4/13 15:14
 */
@Service
public class ReportExcelServiceImpl implements ReportExcelService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ReportExcelMapper reportExcelMapper;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolExportExecutor;

    @Autowired
    private ReportMapper reportMapper;

    @Value("${file.dist-path:''}")
    private String dictPath;

    @Autowired
    private ReportUtil reportUtil;

    @Override
    public GaeaBaseMapper<ReportExcel> getMapper() {
        return reportExcelMapper;
    }

    @Override
    public ReportExcelDto detailByReportCode(String reportCode) {
        QueryWrapper<ReportExcel> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("report_code" , reportCode);
        ReportExcel reportExcel = reportExcelMapper.selectOne(queryWrapper);
        if(reportExcel != null){
            ReportExcelDto dto = new ReportExcelDto();
            BeanUtils.copyProperties(reportExcel , dto);
            return dto;
        }
        return null;
    }

    /**
     * 操作前处理
     *
     * @param entity        前端传递的对象
     * @param operationEnum 操作类型
     * @throws BusinessException 阻止程序继续执行或回滚事务
     */
    @Override
    public void processBeforeOperation(ReportExcel entity, BaseOperationEnum operationEnum) throws BusinessException {
        if (operationEnum.equals(BaseOperationEnum.INSERT)) {
            String reportCode = entity.getReportCode();
            ReportExcel report = this.selectOne("report_code", reportCode);
            if (null != report) {
                this.deleteById(report.getId());
            }
        }
    }

    /**
     * 报表预览
     */
    @Override
    public ReportExcelDto preview(ReportExcelDto reportExcelDto) {
        // 根据id查询 报表详情
        ReportExcel reportExcel = selectOne("report_code", reportExcelDto.getReportCode());
        QueryWrapper<Report> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("report_code" , reportExcelDto.getReportCode());
        Report report = reportMapper.selectOne(queryWrapper);
        GaeaAssert.notNull(reportExcel, ResponseCode.RULE_CONTENT_NOT_EXIST, "reportExcel");
        String setParam = reportExcelDto.getSetParam();

        GaeaBeanUtils.copyAndFormatter(reportExcel , reportExcelDto);
        if(StringUtils.isNotBlank(setParam)){
            reportExcelDto.setSetParam(setParam);
        }
        reportExcelDto.setReportName(report.getReportName());
        JSONObject jsonObject = reportUtil.reportParse(reportExcelDto);
        reportExcelDto.setJsonStr(JSONObject.toJSONString(jsonObject));
        reportExcelDto.setTotal(jsonObject.getJSONObject("rows").size());
        return reportExcelDto;
    }

    @Override
    public Boolean exportExcel(ReportExcelDto reportExcelDto) {
        ExportOperation exportOperation = new ExportOperation();
        //指明导出数据查询到结果开始时间
        exportOperation.setResultStartTime(LocalDateTime.now());
        ReportExcelDto result = preview(reportExcelDto);
        //指明导出数据查询到结果结束时间
        exportOperation.setResultEndTime(LocalDateTime.now());
        //指明导出数据查询到结果条数
        exportOperation.setResultSize(result.getTotal());
        //指明采用什么模式导出
        exportOperation.setExportType(StringUtils.isBlank(reportExcelDto.getExportType())
                ? ExportTypeEnum.GAEA_TEMPLATE_EXCEL.getCodeValue() : reportExcelDto.getExportType());
        //设置导出的文件名
        exportOperation.setFileTitle(result.getReportName());
        //设置导出的文件存放目录
        exportOperation.setFilePath(dictPath);
        //设置导出的数据jsonStr
        exportOperation.setJsonStr(result.getJsonStr());
        //保存当前操作人
        exportOperation.setCreaterUsername(UserContentHolder.getContext().getUsername());
        //调用盖亚组件实现导出文件
        threadPoolExportExecutor.execute(() -> {
            ExportUtil.getInstance().exportByFilePathSimple(exportOperation, null);
        });
        return true;
    }

}
