<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {
  originWidgetLinkageLogic,
  targetWidgetLinkageLogic,
} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetPieNightingaleRoseArea", //南丁格尔玫瑰图面积模式 参考：https://echarts.apache.org/examples/zh/editor.html?c=pie-roseType-simple
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        legend: {
          top: "bottom",
        },
        toolbox: {
          show: true,
          feature: {
            mark: {show: true},
          },
        },
        series: [
          {
            //name: "面积模式",
            type: "pie",
            radius: ["10%", "50%"],
            center: ["50%", "50%"],
            roseType: "area",
            itemStyle: {
              borderRadius: 8,
            },
            data: [],
          },
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsCollapse: {}, // 图标属性
      optionsSetup: {},
      flagInter: null,
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
        background: this.optionsSetup.background,
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
  },
  watch: {
    value: {
      handler(val) {
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsCollapse = val.setup;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true,
    },
  },
  mounted() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.setup;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
    originWidgetLinkageLogic(this); // 联动-源组件逻辑
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsTooltip();
      this.setOptionsLegend();
      this.setOptionsColor();
      this.setOptionsData();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {
        text: optionsSetup.text,
        show: optionsSetup.isShowTitle,
        left: optionsSetup.titleLeft,
        top: optionsSetup.titleTop + "%",
        itemGap: optionsSetup.titleItemGap,
        textStyle: {
          color: optionsSetup.textColor,
          fontSize: optionsSetup.textFontSize,
          fontWeight: optionsSetup.textFontWeight,
          fontStyle: optionsSetup.textFontStyle,
          fontFamily: optionsSetup.textFontFamily,
        },
        subtext: optionsSetup.subtext,
        subtextStyle: {
          color: optionsSetup.subtextColor,
          fontWeight: optionsSetup.subtextFontWeight,
          fontSize: optionsSetup.subtextFontSize,
          fontStyle: optionsSetup.subtextFontStyle,
          fontFamily: optionsSetup.subtextFontFamily
        },
      };
      this.options.title = title;
    },
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: optionsSetup.isShowTooltip,
        textStyle: {
          color: optionsSetup.tooltipColor,
          fontSize: optionsSetup.tooltipFontSize,
          fontWeight: optionsSetup.tooltipFontWeight,
          fontStyle: optionsSetup.tooltipFontStyle,
          fontFamily: optionsSetup.tooltipFontFamily,
        },
      };
      this.options.tooltip = tooltip;
    },
    // 图例操作 legend
    setOptionsLegend() {
      const optionsSetup = this.optionsSetup;
      const legend = {
        show: optionsSetup.isShowLegend,
        left: optionsSetup.lateralPosition,
        //right: optionsSetup.lateralPosition,
        top: optionsSetup.longitudinalPosition,
        //bottom: optionsSetup.longitudinalPosition,
        orient: optionsSetup.layoutFront,
        textStyle: {
          color: optionsSetup.legendColor,
          fontSize: optionsSetup.legendFontSize,
          fontWeight: optionsSetup.legendFontWeight,
          fontStyle: optionsSetup.legendFontStyle,
          fontFamily: optionsSetup.legendFontFamily,
        },
        itemHeight: optionsSetup.legendHeight,
        itemWidth: optionsSetup.legendWidth,
      };
      this.options.legend = legend;
    },
    // 图例颜色修改
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const customColor = optionsSetup.customColor;
      if (!customColor) return;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      this.options.color = arrColor;
      this.options = Object.assign({}, this.options);
    },
    // 数据解析
    setOptionsData(e, paramsConfig) {
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
          }
        });
      }
      // 联动接收者逻辑结束
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const staticData = typeof val == "string" ? JSON.parse(val) : val;
      const optionsSetup = this.optionsSetup;
      const numberValue = optionsSetup.numberValue ? "\n{c}" : "";
      const percentage = optionsSetup.percentage ? "\n({d}%)" : "";
      const series = {
        type: "pie",
        center: ["50%", "50%"],
        left: optionsSetup.left,
        top: optionsSetup.top,
        right: optionsSetup.right,
        bottom: optionsSetup.bottom,
        // 饼图模式 面积模式"area" 半径模式"radius"//name: "面积模式",
        roseType: optionsSetup.nightingaleRoseType,
        radius: [optionsSetup.innerNumber + "%", optionsSetup.outerNumber + "%"],
        clockwise: optionsSetup.clockwise,
        startAngle: optionsSetup.startAngle,
        minAngle: optionsSetup.minAngle,
        minShowLabelAngle: optionsSetup.minShowLabelAngle,
        percentPrecision: optionsSetup.percentPrecision,
        // echarts v5.0.0开始支持
        /*        itemStyle: {
                  borderRadius: [optionsSetup.borderRadius + "%", optionsSetup.borderRadius + "%"],
                },*/
        // 高亮的扇区
        emphasis: {
          label: {
            show: optionsSetup.isShowEmphasisLabel,
            color: optionsSetup.emphasisLabelFontColor == '' ? null : optionsSetup.EmphasisLabelFontColor,
            fontSize: optionsSetup.emphasisLabelFontSize,
            fontWeight: optionsSetup.emphasisLabelFontWeight,
            fontStyle: optionsSetup.emphasisLabelFontStyle,
            fontFamily: optionsSetup.emphasisLabelFontFamily,
          },
          // 视觉引导线
          labelLine: {
            show: false,
          },
          // 色块描边
          itemStyle: {
            borderColor: optionsSetup.borderColor == '' ? null : optionsSetup.borderColor,
            borderWidth: optionsSetup.borderWidth,
            borderType: optionsSetup.borderType,
            shadowBlur: optionsSetup.shadowBlur,
            shadowColor: optionsSetup.shadowColor,
          },
        },
        label: {
          show: optionsSetup.isShow,
          position: optionsSetup.position,
          rotate: optionsSetup.rotate,
          formatter: `{b}${numberValue}${percentage}`,
          padding: optionsSetup.padding,
          fontSize: optionsSetup.fontSize,
          color: optionsSetup.fontColor == '' ? null : optionsSetup.fontColor,
          fontWeight: optionsSetup.fontWeight,
          fontStyle: optionsSetup.fontStyle,
          fontFamily: optionsSetup.fontFamily,
        },
        // 引导线
        labelLine: {
          show: optionsSetup.isShowLabelLine,
          length: optionsSetup.labelLineLength,
          length2: optionsSetup.labelLineLength2,
          smooth: optionsSetup.labelLineSmooth,
          lineStyle: {
            color: optionsSetup.lineStyleColor == '' ? null : optionsSetup.lineStyleColor,
            width: optionsSetup.lineStyleWidth,
            type: optionsSetup.lineStyleType,
          }
        },
        data: staticData,
      };
      this.options.series[0] = series;
    },
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
      const optionsSetup = this.optionsSetup;
      const numberValue = optionsSetup.numberValue ? "\n{c}" : "";
      const percentage = optionsSetup.percentage ? "\n({d}%)" : "";
      const series = {
        type: "pie",
        center: ["50%", "50%"],
        left: optionsSetup.left,
        top: optionsSetup.top,
        right: optionsSetup.right,
        bottom: optionsSetup.bottom,
        // 饼图模式 面积模式"area" 半径模式"radius"//name: "面积模式",
        roseType: optionsSetup.nightingaleRoseType,
        radius: [optionsSetup.innerNumber + "%", optionsSetup.outerNumber + "%"],
        clockwise: optionsSetup.clockwise,
        startAngle: optionsSetup.startAngle,
        minAngle: optionsSetup.minAngle,
        minShowLabelAngle: optionsSetup.minShowLabelAngle,
        percentPrecision: optionsSetup.percentPrecision,
        // echarts v5.0.0开始支持
        /*        itemStyle: {
                  borderRadius: [optionsSetup.borderRadius + "%", optionsSetup.borderRadius + "%"],
                },*/
        // 高亮的扇区
        emphasis: {
          label: {
            show: optionsSetup.isShowEmphasisLabel,
            color: optionsSetup.emphasisLabelFontColor == '' ? null : optionsSetup.EmphasisLabelFontColor,
            fontSize: optionsSetup.emphasisLabelFontSize,
            fontWeight: optionsSetup.emphasisLabelFontWeight,
            fontStyle: optionsSetup.emphasisLabelFontStyle,
            fontFamily: optionsSetup.emphasisLabelFontFamily,
          },
          // 视觉引导线
          labelLine: {
            show: false,
          },
          // 色块描边
          itemStyle: {
            borderColor: optionsSetup.borderColor == '' ? null : optionsSetup.borderColor,
            borderWidth: optionsSetup.borderWidth,
            borderType: optionsSetup.borderType,
            shadowBlur: optionsSetup.shadowBlur,
            shadowColor: optionsSetup.shadowColor,
          },
        },
        label: {
          show: optionsSetup.isShow,
          position: optionsSetup.position,
          rotate: optionsSetup.rotate,
          formatter: `{b}${numberValue}${percentage}`,
          padding: optionsSetup.padding,
          fontSize: optionsSetup.fontSize,
          color: optionsSetup.fontColor == '' ? null : optionsSetup.fontColor,
          fontWeight: optionsSetup.fontWeight,
          fontStyle: optionsSetup.fontStyle,
          fontFamily: optionsSetup.fontFamily,
        },
        // 引导线
        labelLine: {
          show: optionsSetup.isShowLabelLine,
          length: optionsSetup.labelLineLength,
          length2: optionsSetup.labelLineLength2,
          smooth: optionsSetup.labelLineSmooth,
          lineStyle: {
            color: optionsSetup.lineStyleColor == '' ? null : optionsSetup.lineStyleColor,
            width: optionsSetup.lineStyleWidth,
            type: optionsSetup.lineStyleType,
          }
        },
        data: val,
      };
      this.$set(this.options.series, 0, series);
    },
  },
};
</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
