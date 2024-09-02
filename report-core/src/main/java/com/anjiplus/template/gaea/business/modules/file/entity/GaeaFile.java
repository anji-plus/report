package com.anjiplus.template.gaea.business.modules.file.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * (GaeaFile)实体类
 *
 * @author peiyanni
 * @since 2021-02-18 14:48:20
 */
@TableName(keepGlobalPrefix=true, value = "gaea_file")
@Data
public class GaeaFile extends GaeaBaseEntity implements Serializable {

    /** 文件标识 */
    private String fileId;

    /** 文件类型 */
    private String fileType;

    /** 文件路径 */
    private String filePath;

    /** url路径 */
    private String urlPath;

    /** 内容说明 */
    private String fileInstruction;
}
