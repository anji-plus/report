
package com.anjiplus.template.gaea.business.modules.reportexcel.controller.dto;

import com.anji.plus.gaea.curd.dto.GaeaBaseDTO;
import lombok.Data;

import java.io.Serializable;


/**
 * @author chenxg
 * @date 2023/8/1 10:37
 */
@Data
public class ReportExcelStyleDto extends GaeaBaseDTO implements Serializable {
    /**
     * 单元格值格式
     */
    private CellStyleDto ct;

    /**
     * 内容的原始值
     */
    private String v;

    /**
     * 内容的显示值
     */
    private String m;

    /**
     * 背景颜色
     */
    private String bg;

    /**
     * 字体编号
     */
    private String ff;

    /**
     * 字体颜色
     */
    private String fc;

    /**
     * 是否加粗
     */
    private boolean bl;

    /**
     * 是否斜体
     */
    private boolean it;

    /**
     * 字体大小
     */
    private int fs;

    /**
     * 是否删除线
     */
    private boolean cl;

    /**
     * 水平对齐方式
     */
    private int ht;

    /**
     * 垂直对齐方式
     */
    private int vt;

    /**
     * 文字旋转角度
     */
    private int tr;

    /**
     * 是否自动换行
     */
    private int tb;

    /**
     * 批注信息
     */
    private CommentDto ps;

    /**
     * 单元格公式
     */
    private String f;


}