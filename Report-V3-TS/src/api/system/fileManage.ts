import { http } from '@/utils/http/axios';

export function download(fileId) {
  return http.request({
    url: `/file/download/${fileId}`,
    responseType: 'blob',
    method: 'GET',
  })
}

export function toGetPageList(params) {
  return http.request({
    url: '/file/pageList',
    method: 'GET',
    params,
  })
}

export function toAddApi(data) {
  return http.request({
    url: '/file',
    method: 'post',
    data,
  })
}

export function toDeleteApi(data) {
  return http.request({
    url: `/file/delete/batch`,
    method: 'POST',
    data,
  })
}

export function toUpdateApi(data) {
  return http.request({
    url: '/file',
    method: 'put',
    data,
  })
}

export function toGetDataDetailApi(data) {
  return http.request({
    url: '/file/' + data.id,
    method: 'get',
    params: data,
  })
}
