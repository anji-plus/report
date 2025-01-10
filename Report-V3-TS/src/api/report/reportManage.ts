import { http } from '@/utils/http/axios';

export function toGetPageList(params) {
  return http.request({
    url: '/report/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: '/report',
    method: 'post',
    data
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: '/report/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: '/report',
    method: 'put', data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: '/report/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}

export function reportCopy(data) {
  return http.request({
    url: '/report/copy',
    method: 'post',
    data
  })
}
