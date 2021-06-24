<template>
  <div class="text" :style="styleColor">
    <marquee behavior="" :direction="styleColor.direction">{{ styleColor.text }}</marquee>
  </div>
</template>

<script>
export default {
  name: 'WidgetMarquee',
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {},
    }
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options)
    },
    styleColor() {
      return {
        position: this.ispreview ? 'absolute' : 'static',
        color: this.transStyle.color,
        'font-weight': this.transStyle.fontWeight,
        text: this.transStyle.text,
        'font-size': this.transStyle.fontSize + 'px',
        'letter-spacing': this.transStyle.letterSpacing + 'em',
        background: this.transStyle.background,
        'text-align': this.transStyle.textAlign,
        width: this.transStyle.width + 'px',
        height: this.transStyle.height + 'px',
        left: this.transStyle.left + 'px',
        top: this.transStyle.top + 'px',
        right: this.transStyle.right + 'px',

        marqueeSet: this.transStyle.marqueeSet,
        styleColor: this.transStyle.marqueeQuit,
      }
    },
    isBehavior() {
      return this.styleColor.marqueeSet ? 'start()' : 'stop()'
    },
  },
  watch: {
    value: {
      handler(val) {
        this.options = val
      },
      deep: true,
    },
  },
  mounted() {
    this.options = this.value
  },
  methods: {},
}
</script>

<style scoped lang="scss">
.text {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
