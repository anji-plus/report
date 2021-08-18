
package com.anjiplus.template.gaea.business.modules.reportshare.service.impl;

import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.exception.BusinessException;
import com.anjiplus.template.gaea.business.modules.reportshare.dao.ReportShareMapper;
import com.anjiplus.template.gaea.business.modules.reportshare.dao.entity.ReportShare;
import com.anjiplus.template.gaea.business.modules.reportshare.service.ReportShareService;
import com.anjiplus.template.gaea.business.util.DateUtil;
import com.anjiplus.template.gaea.business.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
* @desc ReportShare 报表分享服务实现
* @author Raod
* @date 2021-08-18 13:37:26.663
**/
@Service
public class ReportShareServiceImpl implements ReportShareService {

    @Autowired
    private ReportShareMapper reportShareMapper;

    @Override
    public GaeaBaseMapper<ReportShare> getMapper() {
      return reportShareMapper;
    }

    @Override
    public ReportShare getDetail(Long id) {
        ReportShare reportShare = this.selectOne(id);
        return reportShare;
    }

    @Override
    public void processBeforeOperation(ReportShare entity, BaseOperationEnum operationEnum) throws BusinessException {
        switch (operationEnum) {
            case INSERT:
                //前端地址  window.location.href https://report.anji-plus.com/index.html#/report/bigscreen
                //截取#之前的内容
                //http://localhost:9528/#/bigscreen/viewer?reportCode=bigScreen2
                //http://127.0.0.1:9095/reportDashboard/getData
                String shareCode = UUID.randomUUID().toString();
                entity.setShareCode(shareCode);
                if (StringUtils.isNotBlank(entity.getShareUrl())) {
                    String prefix = entity.getShareUrl().substring(0, entity.getShareUrl().indexOf("#"));
                    entity.setShareUrl(prefix + "#/bigscreen/viewer?reportCode=" + entity.getReportCode());
                }
                entity.setShareValidTime(DateUtil.getFutureDateTmdHms(entity.getShareValidType()));
                break;
            case UPDATE:
                break;
            default:

                break;
        }
    }
}
