import { http } from '@/utils/http/axios';

export function toGetPageList (params) {
  return http.request({
    url: 'accessUser/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi (data) {
  return http.request({
    url: 'accessUser',
    method: 'post',
    data
  })
}

export function toDeleteApi (data) {
  return http.request({
    url: 'accessUser/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi (data) {
  return http.request({
    url: 'accessUser',
    method: 'put', data,
  })
}

export function toGetDataDetailApi (data) {
  return http.request({
    url: 'accessUser/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}


export function getRoleTree (loginName) {
  return http.request({
    url: 'accessUser/roleTree/' + loginName,
    method: 'get',
  })
}

export function saveRoleTree (data) {
  return http.request({
    url: 'accessUser/saveRoleTree',
    method: 'post',
    data
  })
}

export function resetPassword (data) {
  return http.request({
    url: 'accessUser/resetPassword',
    method: 'post',
    data
  })
}
