import { http } from '@/utils/http/axios';


// 字典项管理查询
export function toGetPageList(params) {
  return http.request({
    url: '/gaeaDictItem/pageList',
    method: 'GET',
    params,
  })
}

// 字典项管理新增
export function toAddApi(data) {
  return http.request({
    url: '/gaeaDictItem',
    method: 'POST',
    data,
  })
}

// 字典项管理编辑
export function toUpdateApi(data) {
  return http.request({
    url: '/gaeaDictItem',
    method: 'PUT',
    data,
  })
}

// 字典项管理批量删除
export function toDeleteApi(data) {
  return http.request({
    url: `/gaeaDictItem/delete/batch`,
    method: 'POST',
    data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: '/gaeaDictItem/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey },
  })
}
