package com.anjiplus.template.gaea.business.modules.user.dao.entity;

import com.anji.plus.gaea.annotation.Unique;
import com.anji.plus.gaea.curd.entity.GaeaBaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * Created by raodeming on 2021/6/23.
 */
@Data
public class GaeaUser  extends GaeaBaseEntity implements Serializable {
    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;
}
