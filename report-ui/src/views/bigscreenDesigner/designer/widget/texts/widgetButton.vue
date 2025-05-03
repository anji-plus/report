<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template >
  <div class="button">
      <el-button
        :style="{
                      position:styleColor.position,
                      width: styleColor.width,
                      height: styleColor.height,
                      left: styleColor.left,
                      right: styleColor.right,
                      top: styleColor.top,
                      color: styleColor.color,
                      borderRadius: styleColor.borderRadius,
                      'line-height': styleColor['line-height'],
                      'text-align': styleColor['text-align'],
                      'font-weight': styleColor['font-weight'],
                      'font-size': styleColor['font-size'],
                      'letter-spacing': styleColor['letter-spacing'],
                      'background-color': styleColor['background-color'],
                      display: styleColor.display
               }"
        @click="click"
      >
        {{styleColor.text}}
      </el-button>
  </div>

</template>

<script>
import {
  originWidgetLinkageLogic,
  targetWidgetLinkageLogic,
} from "@/views/bigscreenDesigner/designer/linkageLogic";
export default {
  name: "WidgetButton",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
    widgetIndex: {
      type: Number,
      default: 0,
    }, // 当前组件，在工作区变量widgetInWorkbench中的索引
  },
  data() {
    return {
      options: {},
      formData: {} , //要提交的参数表单
    };
  },
  computed: {
    transStyle() {
      return this.objToOne(this.options);
    },
    styleColor() {
      return {
        position: this.ispreview ? "relative" : "static",
        color: this.transStyle.color || "#00FF00",
        text: this.transStyle.text || "按钮",
        width: this.transStyle.width + "px",
        height: this.transStyle.height + "px",
        left: this.transStyle.left + "px",
        top: this.transStyle.top + "px",
        right: this.transStyle.right + "px",
        borderRadius: this.transStyle.isBorderRadius === "true"? this.transStyle.borderRadius +"px" :"0px",
        "text-align": this.transStyle.textAlign,
        "font-weight": this.transStyle.fontWeight || "600",
        "font-size": this.transStyle.fontSize + "px" || "12px",
        "letter-spacing": this.transStyle.letterSpacing + "em",
        "background-color": this.transStyle.backgroundColor || "#0000ff",
        display:
          this.transStyle.hideLayer === undefined
            ? "block"
            : this.transStyle.hideLayer ? "none" : "block",
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
  },
  watch: {
    value: {
      handler(val) {
        this.options = val;
      },
      deep: true,
    },
  },
  mounted() {
    this.options = this.value;
    this.optionsSetup = this.value.setup;
    this.optionsData = this.value.data;
    this.optionsStyle = this.value.position;
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
  },
  methods: {
    //设置表单Key
    setFormData(paramConfig){
      console.log("paramConfig:" + paramConfig);
      paramConfig.forEach(item =>{
        this.formData[item.targetKey] = "";
      });
    },
    click() {
      console.log(this.formData);
      let formDataKey = Object.keys(this.formData);
      let needInputAll = false;
      for(let index in formDataKey){
        if(this.formData[formDataKey[index]] === null || this.formData[formDataKey[index]] === "" ){
          needInputAll = true;
          break;
        }
      }
      if(needInputAll){
        this.$message.error("请填写所有必填字段");
        return;
      }
      originWidgetLinkageLogic(this, true, {
        currentData: this.formData,
      }); // 联动-源组件逻辑
    },

    setOptionsData(e, paramsConfig) {
      let _this = this;
      console.log("ces", e);
      console.log("ces", paramsConfig);
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      // 联动接收者逻辑开始
      optionsData.dynamicData = optionsData.dynamicData || {}; // 兼容 dynamicData undefined
      const myDynamicData = optionsData.dynamicData;
      clearInterval(this.flagInter); // 不管咋，先干掉上一次的定时任务，避免多跑
      if (
        e &&
        optionsData.dataType !== "staticData" &&
        Object.keys(myDynamicData.contextData).length
      ) {
        const keyArr = Object.keys(myDynamicData.contextData);
        paramsConfig.forEach((conf) => {
          if (keyArr.includes(conf.targetKey)) {
            myDynamicData.contextData[conf.targetKey] = e[conf.originKey];
            _this.formData[conf.targetKey] = e[conf.originKey];    //把参数设置到FormData
          }
        });
      }
      //这里，button按钮是要通过【按钮】联动触发其他组件，本身没有要展示的动态数据，所以无需执行 dynamicDataFn
      // // 联动接收者逻辑结束
      // optionsData.dataType == "staticData"
      //   ? this.staticDataFn(optionsData.staticData)
      //   : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    }
  },
};
</script>

<style scoped lang="scss">

</style>
