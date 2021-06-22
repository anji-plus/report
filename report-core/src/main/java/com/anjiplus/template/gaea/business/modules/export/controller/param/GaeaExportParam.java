package com.anjiplus.template.gaea.business.modules.export.controller.param;


import com.anji.plus.gaea.annotation.Query;
import com.anji.plus.gaea.constant.QueryEnum;
import com.anji.plus.gaea.curd.params.PageParam;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 导出中心(GaeaExport)param
 *
 * @author makejava
 * @since 2021-02-07 17:12:26
 */
@Getter
@Setter
public class GaeaExportParam extends PageParam implements Serializable {
    /**
     * 文件标题
     */
    @Query(QueryEnum.LIKE)
    private String fileTitle;
}
