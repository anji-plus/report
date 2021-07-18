
package com.anjiplus.template.gaea.business.modules.accessuser.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.anji.plus.gaea.bean.TreeNode;
import com.anji.plus.gaea.cache.CacheHelper;
import com.anji.plus.gaea.exception.BusinessExceptionBuilder;
import com.anji.plus.gaea.utils.GaeaBeanUtils;
import com.anji.plus.gaea.curd.mapper.GaeaBaseMapper;
import com.anji.plus.gaea.utils.GaeaUtils;
import com.anji.plus.gaea.utils.JwtBean;
import com.anjiplus.template.gaea.business.code.ResponseCode;
import com.anjiplus.template.gaea.business.constant.BusinessConstant;
import com.anjiplus.template.gaea.business.modules.accessrole.dao.AccessRoleMapper;
import com.anjiplus.template.gaea.business.modules.accessrole.dao.entity.AccessRole;
import com.anjiplus.template.gaea.business.modules.accessuser.controller.dto.AccessUserDto;
import com.anjiplus.template.gaea.business.modules.accessuser.controller.dto.GaeaUserDto;
import com.anjiplus.template.gaea.business.modules.accessuser.dao.AccessUserRoleMapper;
import com.anjiplus.template.gaea.business.modules.accessuser.dao.entity.AccessUser;
import com.anjiplus.template.gaea.business.modules.accessuser.dao.entity.AccessUserRole;
import com.anjiplus.template.gaea.business.modules.accessuser.service.AccessUserService;
import com.anjiplus.template.gaea.business.modules.accessuser.dao.AccessUserMapper;
import com.anjiplus.template.gaea.business.util.MD5Util;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
* @desc AccessUser 用户管理服务实现
* @author 木子李·De <lide1202@hotmail.com>
* @date 2019-02-17 08:50:11.902
**/
@Service
public class AccessUserServiceImpl implements AccessUserService {

    @Autowired
    private AccessRoleMapper accessRoleMapper;

    @Autowired
    private AccessUserMapper accessUserMapper;

    @Autowired
    private AccessUserRoleMapper accessUserRoleMapper;

    @Override
    public GaeaBaseMapper<AccessUser> getMapper() {
      return accessUserMapper;
    }

    @Autowired
    private JwtBean jwtBean;

    @Autowired
    private CacheHelper cacheHelper;

    @Override
    public Map getRoleTree(String loginName, String operator) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<TreeNode> treeData = new ArrayList<>();
        List checkedKeys = new ArrayList();

        // 角色树
        LambdaQueryWrapper<AccessRole> roleQuery = Wrappers.lambdaQuery();
        roleQuery.select(AccessRole::getRoleCode, AccessRole::getRoleName);
        // 按operator去筛选role 后面再加where
        List<AccessRole> roleList = accessRoleMapper.selectList(roleQuery);
        if(roleList == null || roleList.isEmpty()){
            result.put("treeData", treeData);
            result.put("checkedKeys", checkedKeys);
            return result;
        }
        treeData = roleList.stream().map(role -> {
            TreeNode treeNode = new TreeNode();
            treeNode.setId(role.getRoleCode());
            treeNode.setLabel(role.getRoleName());
            return treeNode;
        }).collect(Collectors.toList());

        // 该用户已保存的角色
        LambdaQueryWrapper<AccessUserRole> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.select(AccessUserRole::getRoleCode)
                .eq(AccessUserRole::getLoginName, loginName);
        checkedKeys = accessUserRoleMapper.selectObjs(queryWrapper);

        result.put("treeData", treeData);
        result.put("checkedKeys", checkedKeys);
        return result;
    }

    @Override
    public Boolean saveRoleTree(AccessUserDto accessUserDto) {
        // 校验
        String loginName = accessUserDto.getLoginName();
        List<String> roleCodeList = accessUserDto.getRoleCodeList();
        if(StringUtils.isBlank(loginName)){
            throw BusinessExceptionBuilder.build(ResponseCode.Not_Empty, loginName);
        }
        if(roleCodeList == null || roleCodeList.isEmpty()){
            throw BusinessExceptionBuilder.build(ResponseCode.Not_Empty, roleCodeList);
        }

        // 先清除该用户已保存的角色
        LambdaQueryWrapper<AccessUserRole> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(AccessUserRole::getLoginName, loginName);
        accessUserRoleMapper.delete(wrapper);

        // 保存勾选的角色
        roleCodeList.stream().forEach(roleCode -> {
            AccessUserRole accessUserRole = new AccessUserRole();
            accessUserRole.setLoginName(loginName);
            accessUserRole.setRoleCode(roleCode);
            accessUserRoleMapper.insert(accessUserRole);
        });
        return true;
    }

    @Override
    public Boolean resetPassword(GaeaUserDto gaeaUserDto) {
        return false;
    }

    @Override
    public GaeaUserDto login(GaeaUserDto gaeaUserDto) {

        String loginName = gaeaUserDto.getLoginName();
        String password = gaeaUserDto.getPassword();

        // 1.判断用户是否存在
        LambdaQueryWrapper<AccessUser> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(AccessUser::getLoginName, loginName);
        AccessUser accessUser = accessUserMapper.selectOne(wrapper);
        if (null == accessUser) {
            throw BusinessExceptionBuilder.build(ResponseCode.LOGIN_ERROR);
        }
        // 2.密码错误
        if (!accessUser.getPassword().equals(MD5Util.encrypt(password))) {
            throw BusinessExceptionBuilder.build(ResponseCode.USER_PASSWORD_ERROR);
        }

        // 3.如果该用户登录未过期，这里允许一个用户在多个终端登录
        String tokenKey = String.format(BusinessConstant.GAEA_SECURITY_LOGIN_TOKEN, loginName);
        String userKey = String.format(BusinessConstant.GAEA_SECURITY_LOGIN_USER, loginName);
        String token = "";
        GaeaUserDto gaeaUser = new GaeaUserDto();
        if (cacheHelper.exist(tokenKey) && cacheHelper.exist(userKey)) {
            token = cacheHelper.stringGet(tokenKey);
            gaeaUser = JSONObject.parseObject(cacheHelper.stringGet(userKey), GaeaUserDto.class);
            return gaeaUser;
        }

        // 4.生成用户token
        String uuid = GaeaUtils.UUID();
        token = jwtBean.createToken(loginName, uuid);
        cacheHelper.stringSetExpire(tokenKey, token, 3600);

        // 5.缓存用户权限主信息
        List<String> authorities = accessUserMapper.queryAuthoritiesByLoginName(loginName);
        gaeaUser.setLoginName(loginName);
        gaeaUser.setRealName(accessUser.getRealName());
        gaeaUser.setToken(token);
        gaeaUser.setAuthorities(authorities);
        String gaeaUserStr = JSONObject.toJSONString(gaeaUser);
        cacheHelper.stringSetExpire(userKey, gaeaUserStr, 3600);

        return gaeaUser;
    }
}