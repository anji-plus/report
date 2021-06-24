package com.anjiplus.template.gaea.business.modules.user.dao;

import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anjiplus.template.gaea.business.modules.user.dao.entity.GaeaUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by raodeming on 2021/6/23.
 */
@Mapper
public interface GaeaUserMapper extends GaeaBaseMapper<GaeaUser> {
}
