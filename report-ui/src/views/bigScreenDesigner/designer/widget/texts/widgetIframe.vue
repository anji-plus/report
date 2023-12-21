<template>
  <iframe
    :style="styleColor"
    :src="this.toGetUrl(styleColor.iframeAdress)"
    width="100%"
    height="100%"
  />
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
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px",
        iframeAdress: this.transStyle.iframeAdress
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
  methods: {
    toGetUrl(url) {
      if (url.indexOf('{') < 0 && url.indexOf('}' < 0)) {
        return url
      }
      const reg = /{[a-zA-Z0-9]*\}/g
      const list = url.match(reg)
      console.log(list)
      let result = url
      const query = this.$route.query
      for (let i = 0; i < list.length; i++) {
        const sub = list[i]
        const key = sub.replace('{', '').replace('}', '')
        result = result.replace(sub, query[key])
      }
      return result
    }
  }
};
</script>

<style scoped lang="scss">
iframe {
  width: 100%;
  height: 100%;
  border: none;
}
</style>
