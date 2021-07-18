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
    hasPermission (permissionStr, orgIds) {
      //判断用户权限列表是否为空
      if (this.opAuthorities == null) {
        return false
      }
      if (permissionStr && permissionStr.indexOf('|') !== -1) {
        let flag = false
        let arr = permissionStr.split('|')
        for (let i = 0; i < arr.length; i++) {
          let a = arr[i].replace(/(^\s*)|(\s*$)/g, "");
          if (this.opAuthorities.hasOwnProperty(a)) {
            flag = true
          }
        }
        return flag
      }
      //登录用户没有某个操作权限
      if (!this.opAuthorities.hasOwnProperty(permissionStr)) {
        return false
      }
      //如果当前验证，不包含项目级别验证，直接返回
      if (typeof (orgIds) == 'undefined' || orgIds == null) {
        return true
      }
      //验证登录用户是否有某个项目的有操作权限
      var orgIdsHasPermission = this.opAuthorities[permissionStr]
      //如果projectIds是个数字，只要验证登录用户是否有该项目的操作权限
      if (typeof orgIds == 'number') {
        if (orgIdsHasPermission.indexOf(orgIds) > -1) {
          return true
        } else {
          return false
        }
      } else {
        var result = false
        for (var i in orgIdsHasPermission) {
          var flag = orgIds.indexOf(orgIdsHasPermission[i]) > -1
          if (flag) {
            result = true
          }
        }
        return result
      }
    },
  }
}
