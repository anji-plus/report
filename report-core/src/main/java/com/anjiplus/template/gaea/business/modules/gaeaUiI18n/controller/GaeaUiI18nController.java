
package com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller;

import com.anji.plus.gaea.annotation.AccessKey;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anji.plus.gaea.curd.service.GaeaBaseService;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anji.plus.gaea.utils.GaeaUtils;
import com.anjiplus.template.gaea.business.base.BaseController;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller.dto.GaeaUiI18nDto;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.controller.param.GaeaUiI18nParam;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.dao.entity.GaeaUiI18n;
import com.anjiplus.template.gaea.business.modules.gaeaUiI18n.service.GaeaUiI18nService;

import io.swagger.annotations.Api;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @desc ui文字国际化处理 controller
* @website https://gitee.com/anji-plus/gaea
* @author 王斌
* @date 2021-03-25 15:30:59.286
**/
@RestController
@Api(tags = "ui文字国际化处理管理")
@RequestMapping("/gaeaUiI18n")
public class GaeaUiI18nController extends BaseController<GaeaUiI18nParam, GaeaUiI18n, GaeaUiI18nDto> {

    @Autowired
    private GaeaUiI18nService gaeaUiI18nService;

    @Override
    public GaeaBaseService<GaeaUiI18nParam, GaeaUiI18n> getService() {
        return gaeaUiI18nService;
    }

    @Override
    public GaeaUiI18n getEntity() {
        return new GaeaUiI18n();
    }

    @Override
    public GaeaUiI18nDto getDTO() {
        return new GaeaUiI18nDto();
    }


    @GetMapping({"/{id}"})
    @AccessKey
    @Override
    public ResponseBean detail(@PathVariable("id") Long id) {
        this.logger.info("{}根据ID查询服务开始，id为：{}", this.getClass().getSimpleName(), id);
        GaeaUiI18n result = gaeaUiI18nService.getDetail(id);
        GaeaUiI18nDto dto = this.getDTO();
        GaeaBeanUtils.copyAndFormatter(result, dto);
        ResponseBean responseBean = this.responseSuccessWithData(this.resultDtoHandle(dto));
        this.logger.info("{}根据ID查询结束，结果：{}", this.getClass().getSimpleName(), GaeaUtils.toJSONString(responseBean));
        return responseBean;
    }

    @PostMapping(value = "/scan")
    public ResponseBean scan(@RequestParam String table){
        gaeaUiI18nService.scan(table);
        return responseSuccess();
    }

    @GetMapping(value = "/getTables")
    public ResponseBean getTables(){
        List<String> t = gaeaUiI18nService.getUi18nTables();
        return responseSuccessWithData(t);
    }

    @PostMapping(value = "/listI18nFields")
    public ResponseBean getI18nFields(@RequestBody GaeaUiI18nDto q){
        GaeaUiI18n qry = new GaeaUiI18n();
        GaeaBeanUtils.copyAndFormatter(q,qry);
        // 客户端测试时，以前端参数为准
        if(StringUtils.isEmpty(qry.getLocale())) {
            qry.setLocale(getI18nLang());
        }
        Map ret = new HashMap();
        for(String table : q.getRefer().split(",")) {
            qry.setRefer(table);
            Map t = gaeaUiI18nService.getI18nFields(qry);
            ret.putIfAbsent(qry.getModule(),new HashMap<>());
            // 合并module子节点
            ((Map)ret.get(qry.getModule())).putAll((Map)t.get(qry.getModule()));
        }

        ret.put("locale",q.getLocale());
        return responseSuccessWithData(ret);
    }

}
