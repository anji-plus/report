<template>
  <div :style="styleObj">
    <div :style="containerStyle" class="container">
      <div :style="progressBarStyle" class="progress-bar">
        <div :style="flowingLightStyle" class="flowing-light"></div>
      </div>
    </div>
  </div>
</template>
<script>
export default ({
  name: "widgetFlowLine",
  components: {},
  data() {
    return {
      optionsStyle: {}, // 样式
      optionsCollapse: {}, // 图标属性
      optionsSetup: {},
      direction: 'left', // 控制流光的方向，可选值: 'left' 和 'right'
      background: 'red', // 控制底色的值
      containerWidth: '400px'
    }
  },
  props: {
    value: Object,
    ispreview: Boolean,
  },
  watch: {
    value: {
      handler(val) {
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsCollapse = val.setup;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.setup;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  computed: {
    styleObj() {
      return {
        position: this.ispreview ? "absolute" : "static",
        width: this.optionsStyle.width + "px",
        height: this.optionsStyle.height + "px",
        left: this.optionsStyle.left + "px",
        top: this.optionsStyle.top + "px",
      };
    },
    containerStyle() {
      return {
        width: this.containerWidth + "px",
      }
    },
    progressBarStyle() {
      return {
        background: this.background,
        width: '100%',
        height: '4px',
        position: 'relative',
        overflow: 'hidden',
        flexDirection: this.direction === 'left' ? 'row-reverse' : 'row' // 根据流光方向设置进度条的方向
      }
    },
    flowingLightStyle() {
      return {
        height: '4px',
        width: '80px',
        background: 'linear-gradient(to right, transparent, #fff)',
        position: 'absolute',
        animation: this.direction === 'left' ? 'right_to_left 4s 0s infinite' : 'left_to_right 4s 0s infinite' // 根据流光方向设置动画
      }
    },
  },
  methods: {
    editorOptions() {
      const optionsSetup = this.optionsSetup;
      const optionsStyle = this.optionsStyle;
      this.background = optionsSetup.background;
      this.direction = optionsSetup.flowDirection;
      this.containerWidth = optionsStyle.width;
    },
  }
})
</script>
<style>
.container {
  height: 4px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #282c34;
}

.progress-bar {
  width: 100%;
  height: 100%;
}

.flowling-light {
  height: 4px;
  width: 80px;
  background: linear-gradient(to right, transparent, #fff);
  position: absolute;
}

@keyframes left_to_right {
  0% {
    left: -80px;
  }

  100% {
    left: calc(100% + 80px);
  }
}

@keyframes right_to_left {
  0% {
    right: -80px;
  }

  100% {
    right: calc(100% + 80px);
  }
}
</style>
