package com.anjiplus.template.gaea.business.modules.reportexcel.service.impl;

import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.exception.BusinessException;
import com.anji.plus.gaea.utils.GaeaAssert;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.modules.report.dao.ReportMapper;
import com.anjiplus.template.gaea.business.modules.report.dao.entity.Report;
import com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto.ReportExcelDto;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.ReportExcelMapper;
import com.anjiplus.template.gaea.business.modules.reportexcel.dao.entity.ReportExcel;
import com.anjiplus.template.gaea.business.modules.reportexcel.service.ReportExcelService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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
    private ReportMapper reportMapper;


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
        // TODO 数据集解析，待扩展
//        JSONObject jsonObject = reportUtil.reportParse(reportExcelDto);
//        reportExcelDto.setJsonStr(JSONObject.toJSONString(jsonObject));
//        reportExcelDto.setTotal(jsonObject.getJSONObject("rows").size());
        return reportExcelDto;
    }

    @Override
    public Boolean exportExcel(ReportExcelDto reportExcelDto) {

        return true;
    }

}
