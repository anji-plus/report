/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-30 01:22:56
 * @LastEditors: qianlishi
 * @LastEditTime: 2024-12-30 01:23:21
 */
import { http } from '@/utils/http/axios';

export function getAuthorityTree(data = {}) {
  return http.request({
    url: 'accessAuthority/menuTree',
    method: 'get',
    data,
  });
}
