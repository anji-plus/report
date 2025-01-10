import { http } from '@/utils/http/axios';

export function getPageList(params) {
  return http.request({
    url: '/report/pageList',
    method: 'get',
    params,
  })
}
