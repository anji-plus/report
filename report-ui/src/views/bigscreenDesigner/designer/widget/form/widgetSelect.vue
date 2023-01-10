<template>
  <anji-select
    ref="select"
    :style="styleObj"
    v-model="selectValue"
    :localOptions="options"
    label="text"
    option="id"
  />
</template>
<script>
export default {
  name: "WidgetSelect",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: [
        {
          id: "选项1",
          text: "黄金糕",
        },
        {
          id: "选项2",
          text: "双皮奶",
        },
        {
          id: "选项3",
          text: "蚵仔煎",
        },
        {
          id: "选项4",
          text: "龙须面",
        },
        {
          id: "选项5",
          text: "北京烤鸭",
        },
      ],
      selectValue: "",
      optionsStyle: {},
      optionsData: {},
      optionsSetup: {},
    };
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
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetup = val.setup;
        this.optionsData = val.data;
        this.optionsStyle = val.position;
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsSetup = this.value.setup;
    this.optionsData = this.value.data;
    this.optionsStyle = this.value.position;
  },
  methods: {},
};
</script>
<style lang="scss" scoped>
/deep/.el-select {
  height: 100%;
  .el-input {
    height: 100%;
    .el-input__inner {
      height: 100%;
    }
  }
}
</style>