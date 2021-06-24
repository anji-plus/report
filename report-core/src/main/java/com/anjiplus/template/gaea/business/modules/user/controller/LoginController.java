package com.anjiplus.template.gaea.business.modules.user.controller;

import com.anji.plus.gaea.bean.ResponseBean;
import com.anjiplus.template.gaea.business.modules.user.dto.GaeaUserDTO;
import com.anjiplus.template.gaea.business.modules.user.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 简单登录
 * Created by raodeming on 2021/6/23.
 */
@RestController
@Api(tags = "用户管理")
public class LoginController {

    @Autowired
    private UserService userService;


    /**
     * 简单实现登录
     * @param dto
     * @return
     */
    @PostMapping({"/login"})
    public ResponseBean login(@RequestBody @Validated GaeaUserDTO dto) {
        return ResponseBean.builder().data(userService.login(dto)).build();
    }

    @PostMapping({"/health"})
    public ResponseBean health() {
        return ResponseBean.builder().build();
    }
}
