<template>
  <div :style="styleObj">
    <component :is="value.setup.showtype" :value="value"/>
  </div>
</template>
<script>
export default ({
  name: "widgetBorder",
  components: {},
  data() {
    return {
      optionsStyle: {}, // 样式
    }
  },
  props: {
    value: Object,
    ispreview: Boolean,
    widgetIndex: {
      type: Number,
      default: 0,
    }, // 当前组件，在工作区变量widgetInWorkbench中的索引
  },
  watch: {
    value: {
      handler(val) {
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsCollapse = val.collapse;
        this.optionsSetup = val.setup;
      },
      deep: true,
      immediate: true
    },
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
  }
})
</script>
<style scoped lang="scss">
</style>
