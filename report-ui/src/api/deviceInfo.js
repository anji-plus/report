import request from '@/utils/request'
/** i18n版本*/
export function add (data) {
  return request({
    url: 'deviceInfo',
    method: 'post',
    data,
  })
}

export function del (ids) {
  return request({
    url: 'deviceInfo/' + ids,
    method: 'delete',
    data: ids,
  })
}

export function edit (data) {
  return request({
    url: 'deviceInfo',
    method: 'put',
    data,
  })
}

export function preview (data) {
  return request({
    url: 'deviceInfo/' + data.id,
    method: 'get',
    params: data,
  })
}

export default { add, edit, del, preview }
