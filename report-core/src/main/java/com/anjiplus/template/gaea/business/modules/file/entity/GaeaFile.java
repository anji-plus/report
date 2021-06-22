package com.anjiplus.template.gaea.business.modules.file.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;

import java.io.Serializable;

/**
 * (GaeaFile)实体类
 *
 * @author peiyanni
 * @since 2021-02-18 14:48:20
 */
@TableName("gaea_file")
public class GaeaFile extends GaeaBaseEntity implements Serializable {

    /**
     * 文件uuid
     */
    private String fileId;
    /**
     * 文件在linux中的完整目录，比如/app/dist/export/excel/${fileid}.xlsx
     */
    private String filePath;
    /**
     * 通过接口的下载完整http路径
     */
    private String urlPath;
    /**
     * 文件内容说明，比如 对账单(202001~202012)
     */
    private String fileInstruction;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getUrlPath() {
        return urlPath;
    }

    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }

    public String getFileInstruction() {
        return fileInstruction;
    }

    public void setFileInstruction(String fileInstruction) {
        this.fileInstruction = fileInstruction;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }
}
