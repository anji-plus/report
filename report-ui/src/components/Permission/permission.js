import store from '@/store'

export default {
  inserted(el, binding, vnode) {
    const { value } = binding // v-permission 绑定的权限值
    const auths = store.getters && store.getters.authorities // 拥有的权限列表
    if (value) {
      //auths.indexOf(value) === -1 && el.parentNode && el.parentNode.removeChild(el)
    } else {
      // 未绑定权限值或者绑定的权限值为 假
      return
    }
  },
}
