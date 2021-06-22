package com.anjiplus.template.gaea.business.modules.export.service;

import com.anjiplus.template.gaea.business.modules.export.dao.entity.GaeaExport;
import com.anji.plus.gaea.export.vo.ExportOperation;
import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportParam;
import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportQueryParam;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.anji.plus.gaea.curd.service.GaeaBaseService;

/**
 * 导出中心(GaeaExport)Service
 *
 * @author peiyanni
 * @since 2021-02-07 17:12:22
 */
public interface GaeaExportService extends GaeaBaseService<GaeaExportParam, GaeaExport> {
    /**
     * 导出中心-高级查询
     * 需要 QueryWrapper 类型的动态参数，用来进行获取组装好的QueryWrapper对象
     * @param queryParam
     * @return
     */
    Page<GaeaExport> getExportListPage(GaeaExportQueryParam queryParam, QueryWrapper ...qe);

    /**
     * 导出操作，保存导出日志信息到表Gaea_export
     * @param exportOperation
     * @return
     */
    Boolean saveExportLog(ExportOperation exportOperation);
}
