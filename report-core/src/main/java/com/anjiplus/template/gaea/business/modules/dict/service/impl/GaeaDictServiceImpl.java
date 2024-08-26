package com.anjiplus.template.gaea.business.modules.dict.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.anji.plus.gaea.bean.KeyValue;
import com.anji.plus.gaea.cache.CacheHelper;
import com.anji.plus.gaea.constant.Enabled;
import com.anji.plus.gaea.constant.GaeaConstant;
import com.anji.plus.gaea.constant.GaeaKeyConstant;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.utils.GaeaUtils;
import com.anjiplus.template.gaea.business.modules.dict.dao.GaeaDictItemMapper;
import com.anjiplus.template.gaea.business.modules.dict.dao.GaeaDictMapper;
import com.anjiplus.template.gaea.business.modules.dict.dao.entity.GaeaDict;
import com.anjiplus.template.gaea.business.modules.dict.dao.entity.GaeaDictItem;
import com.anjiplus.template.gaea.business.modules.dict.service.GaeaDictService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * (GaeaDict)ServiceImpl
 *
 * @author lr
 * @since 2021-02-23 10:01:02
 */
@Service
public class GaeaDictServiceImpl implements GaeaDictService {

    @Autowired
    private GaeaDictMapper gaeaDictMapper;

    @Autowired
    private GaeaDictItemMapper gaeaDictItemMapper;

    @Autowired
    private CacheHelper cacheHelper;

    @Override
    public GaeaBaseMapper<GaeaDict> getMapper() {
        return  gaeaDictMapper;
    }

    /**
     * 刷新全部缓存
     * @param dictCodes
     */
    @Override
    public void refreshCache(List<String> dictCodes, String language) {
        // 查询指定字典项
        List<GaeaDictItem> gaeaDictItems = findItems(dictCodes, language);
        // 对数据字典项进行分组，分组key=语言标识:字典编码
        Map<String, List<GaeaDictItem>> dictItemMap = gaeaDictItems.stream().collect(
                Collectors.groupingBy(item -> item.getLocale() + GaeaConstant.REDIS_SPLIT +item.getDictCode(), Collectors.toList())
        );

        //遍历并保持到Redis中
        dictItemMap.entrySet().stream().forEach(entry -> {
            String key = GaeaKeyConstant.DICT_PREFIX  + entry.getKey();
            List<GaeaDictItem> dictItems = entry.getValue();
            // 转换成KeyValue后缓存
            List<KeyValue> keyValues = convertToKeyValueAndCache(dictItems, key);
        });
    }

    /**
     * 根据国际化语言查询指定字典编码下拉列表
     * 先从Redis中获取
     * @param dictCode 字典名称
     * @param language 语言
     * @return
     */
    @Override
    public List<KeyValue> select(String dictCode, String language) {
        // 先看缓存中是否存在
        String dictKey = GaeaKeyConstant.DICT_PREFIX  + language + GaeaConstant.REDIS_SPLIT + dictCode;
        String keyValueListStr = cacheHelper.stringGet(dictKey);
        if(StringUtils.isNoneBlank(keyValueListStr)){
            List<KeyValue> keyValues = JSONArray.parseArray(keyValueListStr, KeyValue.class);
            return keyValues;
        }

        // 缓存中没有，从数据库中查询
        List<String> dictCodes = new ArrayList<>();
        dictCodes.add(dictCode);
        List<GaeaDictItem> list = findItems(dictCodes, language);
        List<KeyValue> keyValues = convertToKeyValueAndCache(list, dictKey);
        return keyValues;
    }

    private List<GaeaDictItem> findItems(List<String> dictCodes, String language) {
        LambdaQueryWrapper<GaeaDictItem> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(GaeaDictItem::getEnabled, Enabled.YES.getValue())
                .eq(GaeaDictItem::getLocale, language);
        if (!CollectionUtils.isEmpty(dictCodes)) {
            wrapper.in(GaeaDictItem::getDictCode, dictCodes);
        }
        wrapper.orderByAsc(GaeaDictItem::getSort);

        List<GaeaDictItem> list = gaeaDictItemMapper.selectList(wrapper);
        return list;
    }

    /**
     * 将一个字典的所有项，转换成KeyValue并缓存
     * @param list
     * @return
     *
     * @author Devli
     * @date 2024-07-17 16:15:11.902
     */
    private List<KeyValue> convertToKeyValueAndCache(List<GaeaDictItem> list, String cacheKey){
        // 入参数校验
        List<KeyValue> keyValues = new ArrayList<>();
        if(CollectionUtils.isEmpty(list)){
            return keyValues;
        }

        // 数据类型转换
        keyValues = list.stream()
                .map(dictItemEntity -> new KeyValue(dictItemEntity.getItemValue(), dictItemEntity.getItemName(), dictItemEntity.getItemExtend()))
                .collect(Collectors.toList());

        // 缓存
        if(StringUtils.isNoneBlank(cacheKey)){
            String cacheValue = JSONArray.toJSONString(keyValues);
            cacheHelper.delete(cacheKey);
            cacheHelper.stringSet(cacheKey, cacheValue);
        }
        return keyValues;
    }

    @Override
    public Collection<KeyValue> selectTypeCode(String system, String language) {

        //缓存字典Key
        String dictKey = GaeaKeyConstant.DICT_PREFIX + language + GaeaConstant.REDIS_SPLIT + system;

        Map<String, String> dictMap = cacheHelper.hashGet(dictKey);

        //当查询的字典为空时
        if (CollectionUtils.isEmpty(dictMap)) {
            LambdaQueryWrapper<GaeaDict> wrapper = Wrappers.lambdaQuery();
            //wrapper.eq(GaeaDict::getLocale, language).orderByAsc(GaeaDict::getSort);

            List<GaeaDict> list = getMapper().selectList(wrapper);

            Set<KeyValue> keyValues = list.stream()
                    .map(dictItemEntity -> new KeyValue(dictItemEntity.getDictCode(),
                            dictItemEntity.getDictName()))
                    .collect(Collectors.toSet());
            return keyValues;
        }

        return GaeaUtils.formatKeyValue(dictMap);
    }


    @Override
    public Map<String, List<KeyValue>> all(String language) {
        LambdaQueryWrapper<GaeaDictItem> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(GaeaDictItem::getEnabled, Enabled.YES.getValue())
                .eq(GaeaDictItem::getLocale, language)
                .orderByAsc(GaeaDictItem::getSort);

        List<GaeaDictItem> list = gaeaDictItemMapper.selectList(wrapper);
        Map<String, List<KeyValue>> all = list.stream().collect(
                Collectors.groupingBy(
                        GaeaDictItem::getDictCode,
                        Collectors.mapping(dictItemEntity -> {
                            Object itemValue = null;
                            try{
                                itemValue = Integer.parseInt(dictItemEntity.getItemValue());
                            }catch (Exception e){
                                itemValue = dictItemEntity.getItemValue();
                            }
                            return new KeyValue(itemValue, dictItemEntity.getItemName(), dictItemEntity.getItemExtend());
                        },Collectors.toList())));
        return all;
    }

}
