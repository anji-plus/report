package com.anjiplus.template.gaea.business.modules.export.controller;

import com.anji.plus.gaea.annotation.log.GaeaAuditLog;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anji.plus.gaea.curd.controller.GaeaBaseController;
import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anjiplus.template.gaea.business.modules.export.controller.dto.GaeaExportDTO;
import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportParam;
import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportQueryParam;
import com.anjiplus.template.gaea.business.modules.export.dao.entity.GaeaExport;
import com.anjiplus.template.gaea.business.modules.export.service.GaeaExportService;
import com.anji.plus.gaea.export.vo.ExportOperation;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 导出中心(GaeaExport)实体类
 *
 * @author makejava
 * @since 2021-02-07 17:12:31
 */
@RestController
@RequestMapping("/export")
@Api(value = "/export", tags = "导出中心")
public class GaeaExportController extends GaeaBaseController<GaeaExportParam, GaeaExport, GaeaExportDTO> {
    @Autowired
    private GaeaExportService gaeaExportService;

    @Override
    public GaeaBaseService<GaeaExportParam, GaeaExport> getService() {
        return gaeaExportService;
    }

    @Override
    public GaeaExport getEntity() {
        return new GaeaExport();
    }

    @Override
    public GaeaExportDTO getDTO() {
        return new GaeaExportDTO();
    }

    @PostMapping("/queryAdvanceExport")
    @GaeaAuditLog(pageTitle = "高级查询")
    public ResponseBean queryExportInfo(@RequestBody GaeaExportQueryParam param) {
        Page<GaeaExport> exportList=gaeaExportService.getExportListPage(param);
        List<GaeaExportDTO> list = exportList.getRecords().stream()
                .map(entity -> GaeaBeanUtils.copyAndFormatter(entity, getDTO()))
                .collect(Collectors.toList());
        Page<GaeaExportDTO> pageDto = new Page<>();
        pageDto.setCurrent(exportList.getCurrent());
        pageDto.setRecords(list);
        pageDto.setPages(exportList.getPages());
        pageDto.setTotal(exportList.getTotal());
        pageDto.setSize(exportList.getSize());
        return responseSuccessWithData(pageDto);
    }

    @PostMapping("/saveExportLog")
    public Boolean export(@RequestBody ExportOperation exportOperation) {
        return gaeaExportService.saveExportLog(exportOperation);
    }

}
