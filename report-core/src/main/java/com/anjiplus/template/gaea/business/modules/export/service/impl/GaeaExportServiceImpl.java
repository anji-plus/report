package com.anjiplus.template.gaea.business.modules.export.service.impl;

import com.anjiplus.template.gaea.business.modules.export.dao.GaeaExportMapper;
import com.anjiplus.template.gaea.business.modules.export.dao.entity.GaeaExport;
import com.anjiplus.template.gaea.business.modules.export.service.GaeaExportService;
import com.anjiplus.template.gaea.business.modules.file.dao.GaeaFileMapper;
import com.anjiplus.template.gaea.business.modules.file.entity.GaeaFile;
import com.anji.plus.gaea.export.vo.ExportOperation;
import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportQueryParam;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.anjiplus.template.gaea.common.aop.GaeaQuery;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 导出中心(GaeaExport)ServiceImpl
 *
 * @author makejava
 * @since 2021-02-07 17:12:24
 */
@Service
public class GaeaExportServiceImpl implements GaeaExportService {
    @Autowired
    private GaeaExportMapper gaeaExportMapper;
    @Autowired
    private GaeaFileMapper gaeaFileMapper;

    @Override
    public GaeaBaseMapper<GaeaExport> getMapper() {
        return gaeaExportMapper;
    }


    @Override
    @GaeaQuery
    public Page<GaeaExport> getExportListPage(GaeaExportQueryParam queryParam, QueryWrapper... qe) {
        Page<GaeaExport> page = new Page<>(queryParam.getPageNumber(), queryParam.getPageSize());
        QueryWrapper queryWrapper = (null != qe && qe.length > 0) ? qe[0] : null;
        List<GaeaExport> gaeaExports = gaeaExportMapper.queryExportInfo(page, queryParam, queryWrapper);
        page.setRecords(gaeaExports);
        return page;
    }

    @Override
    @Transactional
    public Boolean saveExportLog(ExportOperation exportOperation) {
        //需要保存两张表数据 gaea_file ,gaea_export数据
        Date nowDate = new Date();
        GaeaFile gaeaFile = new GaeaFile();
        gaeaFile.setFileId(exportOperation.getFileId());
        gaeaFile.setFilePath(exportOperation.getFilePath());
        gaeaFile.setCreateBy(exportOperation.getCreaterUsername());
        gaeaFile.setCreateTime(nowDate);
        gaeaFile.setUpdateBy(exportOperation.getCreaterUsername());
        gaeaFile.setUpdateTime(nowDate);
        gaeaFileMapper.insert(gaeaFile);
        GaeaExport export = new GaeaExport();
        BeanUtils.copyProperties(exportOperation, export);
        export.setCreateBy(exportOperation.getCreaterUsername());
        export.setCreateTime(nowDate);
        export.setUpdateBy(exportOperation.getCreaterUsername());
        export.setUpdateTime(nowDate);
        gaeaExportMapper.insert(export);
        return true;
    }
}
