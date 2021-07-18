import { getToken, getAccessUser } from '@/utils/auth'
export default {
  data () {
    return {
    }
  },
  computed: {
    operator: function () {
      return this.getUser.loginName
    },
    operatorText: function () {
      return `${this.getUser.realName}[${this.getUser.loginName}]`
    },
    operatorToken: function (){
      return getToken()
    },
    getUser: function () {
      var user = getAccessUser()
      if (user != null) {
        return user;
      } else {
        return {};
      }
    },
    opAuthorities () {
      return this.getUser == null ? [] : this.getUser.authorities
    }
  },
  created () {
  },
  mounted () {
  },
  destroyed () {
  },
  methods: {
    hasPermission (permissionStr) {
      if (permissionStr == null || permissionStr.length == 0) {
        return true
      }
      // 登录用户权限列表
      if (this.opAuthorities == null) {
        return false
      }
      // 用户有的全部权限码
      var opAuthoritiesStr = JSON.stringify(this.opAuthorities)

      // permissionStr可能是：authorityManage、authorityManage:insert、authorityManage:insert|authorityManage:update
      var needPermissionArray = permissionStr.split('|')
      for (var i = 0; i < needPermissionArray.length; i++) {
        // 只要有其中的一个权限，就返回true
        var needPermission = needPermissionArray[i] // authorityManage、authorityManage:insert
        needPermission = needPermission.replace(/\ /g, "") // 去除authorityManage : insert中:前后的空格

        if(opAuthoritiesStr.indexOf(needPermission)>=0){
          return true
        }
      }
      return false
    },
  }
}
