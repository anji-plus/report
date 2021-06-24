export default {
  data() {
    return {
    }
  },
  computed: {
  },
  created() {
  },
  mounted() {
  },
  destroyed() {
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    },
    refresh() {
      this.$router.go(0)
    },
    parseString(object) {
      if (typeof object === 'undefined' || object == null) {
        return ''
      }
      if (typeof object === 'number') {
        return object.toString()
      }
      if (typeof object === 'boolean') {
        return object.toString()
      }
      if (typeof object === 'object') {
        return JSON.stringify(object)
      }
      return ''
    },
    isBlank(val) {
      if (typeof val === 'undefined') {
        return true
      }
      if (val == null || val === '') {
        return true
      }
      return false
    },
		// 封装定制删除数组中的值
		contains(a, obj) {
			var i = a.length
			while (i--) {
				if (a[i] === obj) {
					return i
				}
			}
			return false
		},
		//获取url后边参数
    getUrlKey: function(name) {
			return (
				decodeURIComponent(
					(new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.href) || [, ''])[1].replace(
						/\+/g,
						'%20'
					)
				) || null
			)
    },
    /**
     * 
     */
    resetForm(data) {
      let formKeys = Object.keys(data)
      for (let k of formKeys) {
        data[k] = null
      }
    },
    sortArray(propertyName){
      return function(object1,object2){
        var value1 = object1[propertyName];
        var value2 = object2[propertyName];
        
        if(value1 < value2){
          return -1;
        }else if(value1 > value2){
          return 1;
        }else{
          return 0;
        }
      }
    }
  }
}
