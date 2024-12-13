/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-13 16:05:55
 * @LastEditors: qianlishi
 * @LastEditTime: 2024-12-13 16:43:57
 */
import { http } from '@/utils/http/axios';

export function login(data) {
  return http.request({
    url: 'accessUser/login',
    method: 'post',
    data,
  });
}

// 登录之后   根据旧修改密码
export function reqUpdatePassword(data) {
  return http.request({
    url: '/accessUser/updatePassword',
    method: 'post',
    data,
  });
}
