import request from './axios'

export function login (data) {
  return request({
    url: 'accessUser/login',
    method: 'post',
    data
  })
}

export function logout () {
  return request({
    url: 'accessUser/logout',
    method: 'post'
  })
}

// 登录之后   根据旧修改密码
export const reqUpdatePassword = data => request({
  url: '/auth-service/user/updatePassword',
  method: 'post',
  data: data
})
