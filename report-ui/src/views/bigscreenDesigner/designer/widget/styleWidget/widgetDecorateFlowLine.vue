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
      containerWidth: '400px',
      containerHeight: '4px',
      rotationAngle: 0, // 旋转的角度
      flowingLightColor: null,
      flowingLightSpeed: 'medium',
      flowingLightRotationCenter: 'center',
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
        height: this.containerHeight + "px",
        position: 'relative',
        overflow: 'hidden',
        flexDirection: this.direction === 'left' ? 'row-reverse' : 'row', // 根据流光方向设置进度条的方向
        transform: `rotate(${this.rotationAngle}deg)`, // 添加旋转角度
        transformOrigin: this.flowingLightRotationCenter, // 设置旋转中心
      }
    },
    flowingLightStyle() {
      let duration = 0; // 初始化动画持续时间

      if (this.flowingLightSpeed === 'low') {
        duration = 8; // 低速持续时间
      } else if (this.flowingLightSpeed === 'medium') {
        duration = 4; // 中速持续时间
      } else if (this.flowingLightSpeed === 'high') {
        duration = 2; // 高速持续时间
      }
      return {
        height: '4px',
        width: '80px',
        background: 'linear-gradient(to right, transparent,' + this.flowingLightColor + ')',
        position: 'absolute',
        animation: this.direction === 'right' ? `right_to_left ${duration}s 0s infinite` : `left_to_right ${duration}s 0s infinite` // 根据流光方向设置动画
      }
    },
  },
  methods: {
    editorOptions() {
      const optionsSetup = this.optionsSetup;
      const optionsStyle = this.optionsStyle;
      this.background = optionsSetup.background;
      this.direction = optionsSetup.flowDirection;
      this.rotationAngle = optionsSetup.rotationAngle;
      this.containerWidth = optionsStyle.width;
      this.containerHeight = optionsStyle.height;
      this.flowingLightColor = optionsSetup.lightColor;
      this.flowingLightSpeed = optionsSetup.flowingLightSpeed;
      this.flowingLightRotationCenter = optionsSetup.flowingLightRotationCenter;
    },
  }
})
</script>
<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  background: transparent;
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
