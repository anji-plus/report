<template>
  <el-radio-group
    class="el-radio-button-custom"
    ref="select"
    v-model="selectValue"
    size="medium"
    :style="styleObj"
     @[eventChange]="(val) => change(val, options.find(item => item.value === val))"
    v-if="model === '2'">
    <el-radio-button v-for="item in options" :key="item.value" :label="item.value">{{ item.label }}</el-radio-button>
  </el-radio-group>
  <anji-select
    v-else
    class="select"
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
      model: '1'
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
      const optionsSetup = this.optionsSetup;
      this.selectValue = optionsSetup.defaultValue;
      this.model = optionsSetup.model;
      return optionsData.dataType === "staticData"
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
<style scoped lang="scss">
::v-deep.select {
  .el-select {
    height: 100%;
    .el-input {
      height: 100%;

      .el-input__inner {
        height: 100%;
        background: inherit;
        color: inherit;
        &::placeholder {
          color: inherit;
          font-size: 16px;
          font-weight: normal;
          font-family: sans-serif;
        }
      }
    }
  }
}

::v-deep.el-radio-button-custom {
  display: flex;
  flex-direction: row;
  .el-radio-button {
    height: 100%!important;
    flex: 1;
  }
  .el-radio-button__inner {
    padding: 0!important;
    height: 100%!important;
    width: 100%!important;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    background: inherit;
    color: inherit;
  }
  .el-radio-button__orig-radio:checked+.el-radio-button__inner {
    background-color: #40a0ffb3!important;
    color: #ffffff!important;
    border: 1px solid #ffffff!important;
  }
}

</style>
