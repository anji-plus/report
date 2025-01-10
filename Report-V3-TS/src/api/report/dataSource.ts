import { http } from '@/utils/http/axios';

export function toGetPageList(params) {
  return http.request({
    url: 'dataSource/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: 'dataSource',
    method: 'post',
    data
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: 'dataSource/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: 'dataSource',
    method: 'put',
    data
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: 'dataSource/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}

export function testConnection (data) {
  return http.request({
    url: '/dataSource/testConnection',
    method: 'post',
    data,
  })
}
