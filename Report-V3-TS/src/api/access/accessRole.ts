import { http } from '@/utils/http/axios';

export function toGetPageList(params) {
  return http.request({
    url: 'accessRole/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: 'accessRole',
    method: 'post',
    data
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: 'accessRole/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: 'accessRole',
    method: 'put', data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: 'accessRole/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}

export function accessRoleAuthorityTree(roleCode) {
  return http.request({
    url: 'accessRole/authorityTree/' + roleCode,
    method: 'get',
  })
}

export function saveAuthorityTree(data) {
  return http.request({
    url: 'accessRole/saveAuthorityTree',
    method: 'post',
    data
  })
}
