package com.anjiplus.template.gaea.business.modules.user.service;

import com.anjiplus.template.gaea.business.modules.user.dto.GaeaUserDTO;

/**
 * Created by raodeming on 2021/6/23.
 */
public interface UserService {
    Object login(GaeaUserDTO dto);
}
