import { http } from '@/utils/http/axios';

export function toGetPageList(params) {
  return http.request({
    url: 'reportShare/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: 'reportDashboard/share',
    method: 'post',
    data
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: 'reportShare/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: 'reportShare',
    method: 'put', data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: 'reportShare/' + data.id,
    method: 'get',
    params: {accessKey: data.accessKey}
  })
}

export function excelShareAdd(data) {
  return http.request({
    url: 'reportExcel/share',
    method: 'post',
    data
  })
}

export function reportShareDelay(data) {
  return http.request({
    url: 'reportShare/shareDelay',
    method: 'post',
    data
  })
}

export function reportShareDetailByCode(data) {
  return http.request({
    url: 'reportShare/detailByCode',
    method: 'get',
    params: {shareCode: data}
  })
}
