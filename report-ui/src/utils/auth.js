import Cookies from 'js-cookie'

const TokenKey = 'token'
const AccessUserKey = 'accessUser'

export function getToken() {
  return Cookies.get(TokenKey)
}
export function setToken(token) {
  return Cookies.set(TokenKey, token)
}
export function delToken() {
  return Cookies.remove(TokenKey)
}

export function getAccessUser() {
  return Cookies.getJSON(AccessUserKey)
}
export function setAccessUser(accessUser) {
  return Cookies.set(AccessUserKey, accessUser)
}
export function delAccessUser() {
  return Cookies.remove(AccessUserKey)
}
