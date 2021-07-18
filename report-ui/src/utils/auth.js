import { getStorageItem, setStorageItem, delStorageItem } from '@/utils/storage'

const TokenKey = 'token'
const AccessUserKey = 'gaeaUser'

export function getToken() {
  return getStorageItem(TokenKey)
}
export function setToken(token) {
  return setStorageItem(TokenKey, token)
}
export function delToken() {
  return delStorageItem(TokenKey)
}

export function getAccessUser() {
  return getStorageItem(AccessUserKey)
}
export function setAccessUser(accessUser) {
  return setStorageItem(AccessUserKey, accessUser)
}
export function delAccessUser() {
  return delStorageItem(AccessUserKey)
}
