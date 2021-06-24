import miment from 'miment'
export default {
  data() {
    return {
      // form select-input key
      selectInput: {
        keyname: '',
        keyword: ''
      },

      //日期时间快捷选项
      datetimeRangePickerOptions:{
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            const end = new Date();
            const start = new Date(new Date(new Date().getTime()).setHours(0, 0, 0, 0));
            picker.$emit('pick', [start, end]);
          }
        },{
          text: '昨天',
          onClick(picker) {
            const start=new Date(new Date(new Date().getTime()-24*60*60*1000).setHours(0, 0, 0, 0));
            const end=new Date(new Date(new Date().getTime()-24*60*60*1000).setHours(23, 59, 59, 999));
            picker.$emit('pick', [start, end]);
          }
        },{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(miment().add(-1, 'ww').stamp());
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(miment().add(-1, 'MM').stamp());
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(miment().add(-3, 'MM').stamp());
            picker.$emit('pick', [start, end]);
          }
        }],
        // disabledDate(time){
        //   return time.getTime() > Date.now() 
        // }
      }
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
    // 搜索重置搜索页码
    search(){
      this.params.currentPage=1;
      this.queryByPage();
    },
    // 把selectInput中的值赋到params查询对象中
    parseParamsBySelectInput(keyname, keyword) {
      if (this.params === undefined || this.params === null) {
        console.warn('query form must bind to params object in vue data')
        return
      }
      // if (!this.params.hasOwnProperty(keyname)) {
      //   console.warn('params has no field:' + keyname)
      //   return
      // }
      if (keyword !== undefined ) {
        this.params[keyname] = keyword.trim()
      }
    },
    resetForm(data) {
      let formKeys = Object.keys(data)
      for (let k of formKeys) {
        data[k] = null
      }
    },
    handlerInputchange(val){
      this.parseParamsBySelectInput(this.selectInput.keyname, val)
    }
  },
  watch: {
    'selectInput.keyname'(newVal, oldVal) {
      this.resetForm(this.params)
      this.params.currentPage = 1
      this.params.pageSize = 10
      this.parseParamsBySelectInput(newVal, this.selectInput.keyword)
    },
    'selectInput.keyword'(newVal, oldVal) {
      if (!this.selectInput.keyname) return 
      this.parseParamsBySelectInput(this.selectInput.keyname, newVal)
    }
    // 'selectInput.keyword'(newVal, oldVal) {
    //   this.parseParamsBySelectInput(this.selectInput.keyname, newVal)
    // }
  }
}
