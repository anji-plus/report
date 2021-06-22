package com.anjiplus.template.gaea.business.modules.export.dao;

import com.anjiplus.template.gaea.business.modules.export.controller.param.GaeaExportQueryParam;
import com.anjiplus.template.gaea.business.modules.export.dao.entity.GaeaExport;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 导出中心(GaeaExport)Mapper
 *
 * @author makejava
 * @since 2021-02-07 17:12:16
 */
@Mapper
public interface GaeaExportMapper extends GaeaBaseMapper<GaeaExport> {
    /**
     * 导出信息的高级查询
     * @param page
     * @param bo
     * @param wrapper
     * @return
     */
    List<GaeaExport> queryExportInfo(Page<GaeaExport> page, @Param("bo") GaeaExportQueryParam bo, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
