
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.service.impl;

import cn.hutool.core.util.StrUtil;

import com.anji.plus.gaea.constant.BaseOperationEnum;
import com.anji.plus.gaea.constant.Enabled;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;

import com.anji.plus.gaea.exception.BusinessException;
import com.anjiplus.template.gaea.generator.domain.Column;
import com.anjiplus.template.gaea.generator.service.GeneratorService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.entity.GaeaUiI18n;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.service.GaeaUiI18nService;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.GaeaUiI18nMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
* @desc GaeaUiI18n ui文字国际化处理服务实现
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@Service
@Slf4j
public class GaeaUiI18nServiceImpl implements GaeaUiI18nService {

    @Autowired
    private GaeaUiI18nMapper gaeaUiI18nMapper;

    @Override
    public GaeaBaseMapper<GaeaUiI18n> getMapper() {
      return gaeaUiI18nMapper;
    }

    @Override
    public GaeaUiI18n getDetail(Long id) {
        GaeaUiI18n gaeaUiI18n = this.selectOne(id);
        return gaeaUiI18n;
    }

    @Autowired(required = false)
    GeneratorService generatorService;

    @Value("${spring.application.name}")
    private String applicationName;

    @Override
    public void processBeforeOperation(GaeaUiI18n entity,
                                BaseOperationEnum type) throws BusinessException {
        if(BaseOperationEnum.INSERT.equals(type)){
            entity.setSystem(applicationName);
            //entity.setCataType("");
        }
    }

    @Override
    public void scan(String table) {
        assert table!=null;
        LambdaQueryWrapper<GaeaUiI18n> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(GaeaUiI18n::getRefer,table);
        if(gaeaUiI18nMapper.selectCount(wrapper) > 0){
            log.warn("{} exist,ignore",table);
            throw new BusinessException("6001",new String[]{"该表的字段已维护国际化配置"});
        }
        List<Column> columnDescList = generatorService.getColumns(table);
        //List<ColumnDesc> columnDescList = gaeaUiI18nMapper.queryColumns(table);
        if(!CollectionUtils.isEmpty(columnDescList)){
            List<GaeaUiI18n> list = columnDescList.stream().map(item->{
                if(item.getRemark()!=null && item.getRemark().length()>20){
                    item.setRemark(item.getRemark().substring(0,20));
                }
                GaeaUiI18n it = new GaeaUiI18n();
                it.setCode(StrUtil.toCamelCase(item.getColumnName()));
                it.setName(item.getRemark());
                it.setLocale(getI18nLang());
                it.setSystem(applicationName);
                it.setRemark(item.getRemark());
                it.setEnabled(Enabled.YES.getValue());
                it.setRefer(item.getTableName());
                return it;
            }).collect(Collectors.toList());

            int ret = gaeaUiI18nMapper.insertBatch(list);
            log.info("insert-batch-for:{},size:{}",table,ret);
        }
    }

    private String getI18nLang(){
        return LocaleContextHolder.getLocale().getLanguage();
    }

    @Override
    public List<String> getUi18nTables() {
        return gaeaUiI18nMapper.queryTables("");
    }

    @Override
    public Map getI18nFields(GaeaUiI18n q) {
        String table =  q.getRefer();
        String tableAlias = "";
        // 提取表名称和别名
        if(q.getRefer().contains(":")) {
            table = q.getRefer().split(":")[0];
            tableAlias = Optional.ofNullable(q.getRefer().substring(table.length() + 1)).orElse("");
            q.setRefer(table);
        }

        LambdaQueryWrapper<GaeaUiI18n> qry = Wrappers.lambdaQuery();
        qry.eq(GaeaUiI18n::getLocale,q.getLocale())
            .and(t->t.eq(GaeaUiI18n::getEnabled,Enabled.YES.getValue()))
            // 所属行业
            .and(t->t.eq(GaeaUiI18n::getCataType,q.getCataType()).or().isNull(GaeaUiI18n::getCataType))
            // 同一个表 或同一个菜单
            .and(t->t.eq(GaeaUiI18n::getRefer,q.getRefer()).or().eq(GaeaUiI18n::getModule,q.getModule()))
        ;
        List<GaeaUiI18n> list = gaeaUiI18nMapper.selectList(qry);

        HashMap kv = new HashMap();
        // 表级别 字段默认设置
        list.stream().filter(i->i.getRefer()!=null && i.getCataType()==null).forEach(i->{
            kv.put(i.getCode(),i.getName());
        });
        // 表级别 字段行业属性,覆盖默认设置
        list.stream().filter(i->i.getRefer()!=null && i.getCataType()!=null).forEach(i->{
            kv.put(i.getCode(),i.getName());
        });

        Map result = new HashMap();
        // 挂载在module根节点
        if(tableAlias.length()<1) {
            result.put(q.getModule(), kv);
        }else {
            // 作为module的子节点
            result.putIfAbsent(q.getModule(),new HashMap<>());
            ((Map)result.get(q.getModule())).put(tableAlias,kv);
        }

        // 设置模块级别的字段配置
        HashMap m = new HashMap();
        list.stream().filter(i->i.getRefer()==null && i.getModule().equals(q.getModule())).forEach(item->{
            m.put(item.getCode(),item.getName());
        });
        if(!m.isEmpty()) {
            ((Map)result.get(q.getModule())).putAll(m);
        }
        return result;
    }
}