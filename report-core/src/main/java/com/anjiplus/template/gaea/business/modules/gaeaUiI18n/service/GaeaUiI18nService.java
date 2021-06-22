
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.service;

import com.anjiplus.template.gaea.business.base.BaseService;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.entity.GaeaUiI18n;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller.param.GaeaUiI18nParam;

import java.util.List;
import java.util.Map;

/**
* @desc GaeaUiI18n ui文字国际化处理服务接口
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
public interface GaeaUiI18nService extends BaseService<GaeaUiI18nParam, GaeaUiI18n> {

    /***
     * 查询详情
     *
     * @param id
     * @return
     */
    GaeaUiI18n getDetail(Long id);

    /**
     * 新加功能菜单时，i18n同步、初始化,以单表为单位处理
     * 优先从 自动生成处理表查询，没有则从源表查询，减少重复维护
     *
     * @param table 表名称
     */
    void scan(String table);

    /**
     * 查询项目所有的表
     * @return
     */
    List<String> getUi18nTables();

    /**
     * 菜单初始化时，查询该菜单需要的国际化列表
     * @param initQry
     * @return map
     */
    Map getI18nFields(GaeaUiI18n initQry);
}