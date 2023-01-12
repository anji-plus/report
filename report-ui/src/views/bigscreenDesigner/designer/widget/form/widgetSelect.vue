<template>
  <anji-select
    ref="select"
    :style="styleObj"
    v-model="selectValue"
    :localOptions="options"
    label="name"
    option="code"
    @[eventChange]="change"
  />
</template>
<script>
import { eventBus } from "@/utils/eventBus";
export default {
  name: "WidgetSelect",
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
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
    options() {
      const data = this.optionsData;
      return data.dataType == "staticData" ? data.staticData : data.dynamicData;
    },
    eventChange() {
      return this.optionsSetup.event || "change";
    },
  },
  watch: {
    value: {
      handler(val) {
        console.log("val", val);
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