<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="text" :style="styleColor">{{ styleColor.text }}</div>
</template>

<script>
export default {
  name: "WidgetText",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {}
    };
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options);
    },
    styleColor() {
      return {
        position: this.ispreview ? "absolute" : "static",
        color: this.transStyle.color,
        "font-weight": this.transStyle.fontWeight,
        text: this.transStyle.text,
        "font-size": this.transStyle.fontSize + "px",
        "letter-spacing": this.transStyle.letterSpacing + "em",
        background: this.transStyle.background,
        "text-align": this.transStyle.textAlign,
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px"
      };
    }
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
      },
      deep: true
    }
  },
  mounted() {
    this.options = this.value;
  },
  methods: {}
};
</script>

<style scoped lang="scss">
.text {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
