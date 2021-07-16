package com.anjiplus.template.gaea.business.modules.user.service.impl;

import com.anji.plus.gaea.cache.CacheHelper;
import com.anji.plus.gaea.exception.BusinessExceptionBuilder;
import com.anji.plus.gaea.utils.GaeaUtils;
import com.anji.plus.gaea.utils.JwtBean;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.modules.user.dao.GaeaUserMapper;
import com.anjiplus.template.gaea.business.modules.user.dao.entity.GaeaUser;
import com.anjiplus.template.gaea.business.modules.user.dto.GaeaUserDTO;
import com.anjiplus.template.gaea.business.modules.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by raodeming on 2021/6/23.
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Autowired
    private JwtBean jwtBean;

    @Autowired
    private GaeaUserMapper gaeaUserMapper;

    @Autowired
    private CacheHelper cacheHelper;

    @Override
    public Object login(GaeaUserDTO dto) {

        String username = dto.getUsername();
        String password = dto.getPassword();
        //1.判断用户是否存在
        LambdaQueryWrapper<GaeaUser> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(GaeaUser::getUsername, username);
        GaeaUser gaeaUser = gaeaUserMapper.selectOne(wrapper);
        if (null == gaeaUser || !gaeaUser.getPassword().equals(encrypt(password))) {
            throw BusinessExceptionBuilder.build(ResponseCode.LOGIN_ERROR);
        }


        Map<String, String> map = Maps.newHashMap();

        //将登录信息缓存,默认一小时
        if (cacheHelper.exist(username)) {
            map.put("token", cacheHelper.stringGet(username));
            map.put("username", username);
        } else {
            String uuid = GaeaUtils.UUID();
            String token = jwtBean.createToken(username, uuid);
            cacheHelper.stringSetExpire(username, token, 3600);
            map.put("token", token);
            map.put("username", username);
        }

        return map;
    }

    /**
     * 获取指定字符串的md5值
     * @param dataStr 明文
     * @return String
     */
    public static String encrypt(String dataStr) {
        try {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.update(dataStr.getBytes("UTF8"));
            byte[] s = m.digest();
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < s.length; i++) {
                result.append(Integer.toHexString((0x000000FF & s[i]) | 0xFFFFFF00).substring(6));
            }
            return result.toString();
        } catch (Exception e) {
            log.error("error",e);
        }
        return "";
    }
}
