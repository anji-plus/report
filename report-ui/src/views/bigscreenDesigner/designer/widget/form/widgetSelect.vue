<template>
  <anji-select
    ref="select"
    :style="styleObj"
    :placeholder="placeholder"
    v-model="selectValue"
    :localOptions="options"
    label="label"
    option="value"
    @[eventChange]="(val, item) => change(val, item)"
  />
</template>
<script>
import {
  originWidgetLinkageLogic,
  targetWidgetLinkageLogic,
} from "@/views/bigscreenDesigner/designer/linkageLogic";
export default {
  name: "WidgetSelect",
  props: {
    value: Object,
    ispreview: Boolean,
    widgetIndex: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      selectValue: "",
      optionsStyle: {},
      optionsData: {},
      optionsSetup: {},
      options: {},
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
    placeholder(){
      return this.optionsSetup.select_text;
    },
    eventChange() {
      return "change";
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
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

    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    change(event, item) {
      originWidgetLinkageLogic(this, true, {
        currentData: item,
      }); // 联动-源组件逻辑
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
