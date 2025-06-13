<template>
  <div class="iframe-container" :style="containerStyle">
    <transition :name="transitionName">
      <iframe
        v-if="hasIframes"
        :ref="`iframe-${currentIframeIndex}`"
        :key="`iframe-${currentIframeIndex}`"
        :style="iframeStyle"
        :src="processedUrl"
        width="100%"
        height="100%"
        class="iframe"
      />
    </transition>
    
    <!-- 切换按钮，只在有多个iframe时显示 -->
    <div v-if="hasMultipleUrls" class="iframe-switcher">
      <div 
        v-for="(iframe, index) in iframeUrls" 
        :key="index"
        :class="['switcher-dot', currentIframeIndex === index ? 'active' : '']"
        @click="switchToIframe(index)"
        :title="iframe.name || `地址${index+1}`">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "WidgetIframe",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {},
      currentIframeIndex: 0,
      switchTimer: null,
      processedUrl: ''
    };
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options);
    },
    // 容器样式 - 分离样式属性
    containerStyle() {
      return {
        position: this.ispreview ? "absolute" : "static",
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px"
      };
    },
    // iframe样式
    iframeStyle() {
      return {
        width: "100%",
        height: "100%",
        border: "none"
      };
    },
    // 获取iframe地址数组
    iframeUrls() {
      return this.transStyle.iframeUrls || [];
    },
    // 判断是否有iframe地址配置
    hasIframes() {
      return this.iframeUrls.length > 0;
    },
    // 判断是否有多个iframe地址
    hasMultipleUrls() {
      return this.iframeUrls.length > 1;
    },
    // 当前显示的iframe地址
    currentIframeUrl() {
      if (!this.hasIframes || this.currentIframeIndex >= this.iframeUrls.length) {
        return '';
      }
      return this.iframeUrls[this.currentIframeIndex].url;
    },
    // 根据选择的动画效果返回transition名称
    transitionName() {
      const effect = this.transStyle.transitionEffect;
      if (!effect || effect === 'none') return '';
      return effect;
    }
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
        // 如果配置变化，重新设置自动切换
        this.setupAutoSwitch();
        // 更新处理后的URL
        this.updateUrl();
        
        // 当iframe列表变更时，确保当前索引在有效范围内
        if (this.hasIframes && this.currentIframeIndex >= this.iframeUrls.length) {
          this.currentIframeIndex = 0;
        }
      },
      deep: true
    },
    currentIframeUrl: {
      handler() {
        this.updateUrl();
      }
    }
  },
  mounted() {
    this.options = this.value;
    this.setupAutoSwitch();
    this.updateUrl();
  },
  beforeDestroy() {
    // 组件销毁前清除定时器
    this.clearSwitchTimer();
  },
  methods: {
    // 更新处理后的URL
    updateUrl() {
      if (this.currentIframeUrl) {
        this.processedUrl = this.toGetUrl(this.currentIframeUrl);
      } else {
        this.processedUrl = '';
      }
    },
    
    toGetUrl(url) {
      if (!url || (url.indexOf('{') < 0 && url.indexOf('}') < 0)) {
        return url;
      }
      const reg = /{[a-zA-Z0-9]*\}/g;
      const list = url.match(reg);
      if (!list) return url;
      
      let result = url;
      const query = this.$route.query;
      for (let i = 0; i < list.length; i++) {
        const sub = list[i];
        const key = sub.replace('{', '').replace('}', '');
        result = result.replace(sub, query[key] || '');
      }
      return result;
    },
    // 切换到指定的iframe
    switchToIframe(index) {
      if (index === this.currentIframeIndex || index >= this.iframeUrls.length) return;
      
      this.currentIframeIndex = index;
    },
    // 设置自动切换
    setupAutoSwitch() {
      this.clearSwitchTimer();
      
      const interval = this.transStyle.autoSwitchInterval;
      if (interval && interval > 0 && this.iframeUrls.length > 1) {
        this.switchTimer = setInterval(() => {
          this.currentIframeIndex = (this.currentIframeIndex + 1) % this.iframeUrls.length;
        }, interval * 1000);
      }
    },
    // 清除自动切换定时器
    clearSwitchTimer() {
      if (this.switchTimer) {
        clearInterval(this.switchTimer);
        this.switchTimer = null;
      }
    }
  }
};
</script>

<style scoped lang="scss">
.iframe-container {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.iframe {
  width: 100%;
  height: 100%;
  border: none;
  position: absolute;
  top: 0;
  left: 0;
}

/* 切换指示器样式 */
.iframe-switcher {
  position: absolute;
  bottom: 10px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 8px;
  z-index: 10;
}

.switcher-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  transition: all 0.3s;
}

.switcher-dot.active {
  background-color: #fff;
  box-shadow: 0 0 5px rgba(255, 255, 255, 0.8);
}

/* 淡入淡出动画 */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}

/* 滑动动画 */
.slide-enter-active, .slide-leave-active {
  transition: transform 0.5s;
}
.slide-enter {
  transform: translateX(100%);
}
.slide-leave-to {
  transform: translateX(-100%);
}

/* 缩放动画 */
.zoom-enter-active, .zoom-leave-active {
  transition: transform 0.5s, opacity 0.5s;
}
.zoom-enter {
  transform: scale(0.8);
  opacity: 0;
}
.zoom-leave-to {
  transform: scale(1.2);
  opacity: 0;
}
</style>
