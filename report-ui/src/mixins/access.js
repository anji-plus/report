import { setItem, getItem } from '@/utils/storage';

export default {
  data() {
    return {
    }
  },
  computed: {
    getUser: function(){
      // var user = getItem('user');
      var user =JSON.parse(localStorage.getItem('user')) 
      if(user != null ){
        return user;
      }else{
        return {};
      }
    },
    isAdmin() {
      if (this.getUser == null) {
        return false
      }
      return this.getUser.userId === 1
    },
    opLoginName() {
      return this.getUser == null ? '' : this.getUser.userName
    },
    opNikeName() {
      return this.getUser == null ? '' : this.getUser.nikeName
    },
    opUserType() {
      return this.getUser == null ? '' : this.getUser.userType
    },
    opAuthorities() {
      return this.getUser == null ? [] : this.getUser.authorityWithOrgIds
    }
  },
  created() {
  },
  mounted() {
  },
  destroyed() {
  },
  methods: {
    hasPermission(permissionStr, orgIds) {
      //判断用户权限列表是否为空
			if (this.opAuthorities == null) {
				return false
      }
      if(this.isAdmin){
        return true;
      }
      if(permissionStr && permissionStr.indexOf('|') !== -1) {
        let flag = false
        let arr = permissionStr.split('|')
        for(let i=0; i< arr.length; i++) {
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
      if (typeof(orgIds) == 'undefined' || orgIds == null) {
        return true
      } 
      //验证登录用户是否有某个项目的有操作权限
      var orgIdsHasPermission = this.opAuthorities[permissionStr]
      //如果projectIds是个数字，只要验证登录用户是否有该项目的操作权限
      if (typeof orgIds == 'number') {
        if (orgIdsHasPermission.indexOf(orgIds) > -1) {
          return true
        }else{
          return false
        }
      }else{
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
    //深拷贝
    deepClone(obj){
		  var temp = JSON.stringify(obj);
		  return JSON.parse(temp);
    },
    
		//从所有字典中，取某个字典的列表
		getDict(dictname){
			var basecode = JSON.parse(localStorage.getItem('queryForCodeSelect'));
			var dictList = basecode[dictname]
			return dictList;
		},
		//从某个字典的列表，获取某个字典对象
		getDictCode(dictname, codeValue , value='value'){
      //如果 codeValue传过来的是字符串 all 则字典数组返回
			var dictList = this.getDict(dictname);
			for (var i = 0; i < dictList.length; i++) {
				var codeItem = dictList[i]
				if(codeItem[value] == codeValue){
					return codeItem;
        }
        if(codeValue =='all'){
          return dictList
        }
			}
			return {};
		},
  }
}
