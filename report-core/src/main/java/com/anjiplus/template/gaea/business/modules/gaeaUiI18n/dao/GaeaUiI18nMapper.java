package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.entity.GaeaUiI18n;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.service.impl.ColumnDesc;

/**
* GaeaUiI18n Mapper
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@Mapper
public interface GaeaUiI18nMapper extends GaeaBaseMapper<GaeaUiI18n> {

    /**
     * 查询表的定义，字段中文描述等信息
     * @param tableName
     * @return
     */
    List<ColumnDesc> queryColumns(@Param(value = "tableName") String tableName);

    /**
     * 查询项目所有的表名
     * @param s
     * @return
     */
    List<String> queryTables(@Param(value = "tableName") String s);
}