/*
 * @Author: zyk
 * @Date: 2021-02-23 15:13:17
 * @Last Modified by: zyk
 * @Last Modified time: 2021-03-15 13:28:36
 */
import request from '@/utils/request'
// 导出中心

export function download(fileId) {
  return request({
    url: `/file/download/${fileId}`,
    responseType: 'blob',
    method: 'GET',
  })
}

export function fileList(params) {
  return request({
    url: '/file/pageList',
    method: 'GET',
    params,
  })
}

export function fileAdd(data) {
  return request({
    url: '/file',
    method: 'post',
    data,
  })
}

export function fileDel(data) {
  return request({
    url: `/file/delete/batch`,
    method: 'POST',
    data,
  })
}

export function fileUpdate(data) {
  return request({
    url: '/file',
    method: 'put',
    data,
  })
}

export function fileDetail(data) {
  return request({
    url: '/file/' + data.id,
    method: 'get',
    params: data,
  })
}

export default { fileList, fileAdd, fileDel, fileUpdate, fileDetail }
