/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-30 01:22:56
 * @LastEditors: qianlishi
 * @LastEditTime: 2024-12-30 01:23:21
 */
import { http } from '@/utils/http/axios';

// 获取所属菜单树结构
export function getAuthorityTree(data = {}) {
  return http.request({
    url: 'accessAuthority/menuTree',
    method: 'get',
    data,
  });
}

// 列表查询数据
export function toGetPageList(params) {
  return http.request({
    url: 'accessAuthority/pageList',
    method: 'GET',
    params,
  })
}

// 新增
export function toAddApi(data) {
  return http.request({
    url: 'accessAuthority',
    method: 'post',
    data
  })
}

// 修改
export function toUpdateApi(data) {
  return http.request({
    url: 'accessAuthority',
    method: 'put', 
    data,
  })
}

// 批量删除
export function toDeleteApi(data) {
  return http.request({
    url: 'accessAuthority/delete/batch',
    method: 'post',
    data
  })
}

// 查询详情页
export function toGetDataDetailApi(data) {
  return http.request({
    url: 'accessAuthority/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}
