<template>
  <el-input
    ref="input"
    :style="styleObj"
    v-model="inputValue"
    placeholder="请输入内容"
    @[eventChange]="change"
  />
</template>
<script>
import { eventBus } from "@/utils/eventBus";

export default {
  name: "WidgetInput",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      inputValue: "",
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
        background: this.optionsSetup.select_background,
        color: this.optionsSetup.select_color,
      };
    },
    eventChange() {
      return "change";
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
  methods: {
    change(event) {
      const optionsSetup = this.optionsSetup;
      const params = {};
      params[optionsSetup.field] = event;
      params["assChart"] = optionsSetup.assChart;
      eventBus.$emit("eventParams", params);
    },
  },
};
</script>
<style lang="scss" scoped>
/deep/ .el-select {
  height: 100%;

  .el-input {
    height: 100%;

    .el-input__inner {
      height: 100%;
      background: inherit;
      color: inherit;
      &::placeholder {
        color: inherit;
      }
    }
  }
}
</style>
