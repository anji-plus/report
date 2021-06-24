import request from '@/utils/request'
/** i18n版本*/
export function add (data) {
  return request({
    url: 'business/deviceInfo',
    method: 'post',
    data,
  })
}

export function del (ids) {
  return request({
    url: 'business/deviceInfo/' + ids,
    method: 'delete',
    data: ids,
  })
}

export function edit (data) {
  return request({
    url: 'business/deviceInfo',
    method: 'put',
    data,
  })
}

export function preview (data) {
  return request({
    url: 'business/deviceInfo/' + data.id,
    method: 'get',
    params: data,
  })
}

export default { add, edit, del, preview }
