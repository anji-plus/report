package com.anjiplus.template.gaea.business.modules.file.controller.param;


import com.anji.plus.gaea.annotation.Query;
import com.anji.plus.gaea.constant.QueryEnum;
import com.anji.plus.gaea.curd.params.PageParam;

import java.io.Serializable;

/**
 * (GaeaFile)param
 *
 * @author peiyanni
 * @since 2021-02-18 14:48:29
 */
public class GaeaFileParam extends PageParam implements Serializable {

    /**
     * 文件在linux中的完整目录，比如/app/dist/export/excel/${fileid}.xlsx
     */
    @Query(QueryEnum.LIKE)
    private String filePath;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
