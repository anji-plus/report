<!--
 * @Author: qianlishi qianlishi@anji-plus.com
 * @Date: 2023-03-06 15:38:10
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-03-06 16:11:21
-->
<template>
  <el-date-picker
    :style="styleObj"
    v-model="timeValue"
    type="daterange"
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
      timeValue: "",
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
        background: this.optionsSetup.select_fontSize,
        color: this.optionsSetup.select_color,
      };
    },
    eventChange() {
      return this.optionsSetup.event || "change";
    },
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetup = val.setup;
        this.optionsData = val.data;
        this.optionsStyle = val.position;
        this.setOptions();
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsSetup = this.value.setup;
    this.optionsData = this.value.data;
    this.optionsStyle = this.value.position;
    this.setOptions();
  },
  methods: {
    change(event) {
      const optionsSetup = this.optionsSetup;
      const params = {};
      params[optionsSetup.field] = event;
      params["assChart"] = optionsSetup.assChart;
      eventBus.$emit("eventParams", params);
    },
    setOptions() {
      const optionsData = this.optionsData;
      return optionsData.dataType == "staticData"
        ? this.staticData(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticData(data) {
      this.options = data;
    },
    //动态数据字典解析
    dynamicDataFn(val, refreshTime) {
      if (!val) return;
      if (this.ispreview) {
        this.getEchartData(val);
        this.flagInter = setInterval(() => {
          this.getEchartData(val);
        }, refreshTime);
      } else {
        this.getEchartData(val);
      }
    },
    getEchartData(val) {
      const data = this.queryEchartsData(val);
      data.then((res) => {
        this.renderingFn(res);
      });
    },
    renderingFn(val) {
      this.options = val;
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
