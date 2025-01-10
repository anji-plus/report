import { http } from '@/utils/http/axios';


export function toGetPageList(params) {
  return http.request({
    url: 'dataSet/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: 'dataSet',
    method: 'post',
    data
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: 'dataSet/delete/batch',
    method: 'post',
    data
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: 'dataSet',
    method: 'put', data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: 'dataSet/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey }
  })
}

export function reportDataSetCopy(data) {
  return http.request({
    url: '/dataSet/copy',
    method: 'post',
    data
  })
}

// 数据源
export function getReportData() {
  return http.request({
    url: '/dataSource/queryAllDataSource',
    method: 'get'
  })
}
