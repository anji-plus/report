import request from '@/utils/request'

// 字典项管理查询
export function dictItemPageList(params) {
  return request({
    url: '/gaeaDictItem/pageList',
    method: 'GET',
    params,
  })
}

// 字典项管理新增
export function dictItemAdd(data) {
  return request({
    url: '/gaeaDictItem',
    method: 'POST',
    data,
  })
}

// 字典项管理编辑
export function dictItemEdit(data) {
  return request({
    url: '/gaeaDictItem',
    method: 'PUT',
    data,
  })
}

// 字典项管理批量删除
export function dictsItemDelect(data) {
  return request({
    url: `/gaeaDictItem/delete/batch`,
    method: 'POST',
    data,
  })
}

export function dictItemDetail(data) {
  return request({
    url: '/gaeaDictItem/' + data.id,
    method: 'get',
    params: { accessKey: data.accessKey },
  })
}

export default { dictItemDetail, dictItemPageList, dictItemAdd, dictItemEdit, dictsItemDelect }
