<template>
  <div id="app">
    <router-view v-if="isRouterAlive" />
  </div>
</template>

<script>
import '@/assets/iconfont/iconfont.css'
import { initDictToLocalstorage } from '@/api/dict-data'
export default {
  name: 'App',
  provide () {
    return {
      reload: this.reload,
    }
  },
  data () {
    return {
      isRouterAlive: false,
    }
  },
  computed: {},
  created () {
    // 初始化数据字典到浏览器本地缓存
    initDictToLocalstorage(() => {
      this.isRouterAlive = true
    })
  },
  mounted () {
  },
  beforeDestroy () {
  },
  methods: {
    reload () {
      this.isRouterAlive = false
      this.$nextTick(function () {
        this.isRouterAlive = true
      })
    },
  }
}
</script>
