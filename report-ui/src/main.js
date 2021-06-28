import Vue from 'vue'

// element-ui
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import zhLocale from 'element-ui/lib/locale/lang/zh-CN'
import 'normalize.css/normalize.css'// A modern alternative to CSS resets
import '@/assets/styles/common.css'
import '@/assets/styles/index.scss'// custome global css

// app router vuex filter mixins
import App from './App'
import router from './router'
import store from './store'
import * as filter from './filter'
import mixins from '@/mixins'
import echarts from 'echarts';
// 全局定义echarts
import ECharts from 'vue-echarts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/component/tooltip'
// import 'echarts-gl'
Vue.component('v-chart', ECharts)

// permission control
import '@/permission'

import '@/extend'

import Avue from '@smallwei/avue';
import '@smallwei/avue/lib/index.css';
Vue.use(Avue);

// enable element zh-cn
Vue.use(ElementUI, { zhLocale })

// register global filter.
Object.keys(filter).forEach(key => {
  Vue.filter(key, filter[key])
})

// register global mixins.
Vue.mixin(mixins)

Vue.config.productionTip = false

// create the app instance.
new Vue({ el: '#app', router, store, render: h => h(App) })
