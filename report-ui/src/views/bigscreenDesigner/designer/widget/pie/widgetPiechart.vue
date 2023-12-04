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
  name: "WidgetPiechart",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        title: {
          text: "",
          left: "center",
          textStyle: {
            color: "#fff",
          },
        },
        legend: {
          orient: "vertical",
          left: "left",
          textStyle: {
            color: "#fff",
          },
        },
        series: [
          {
            type: "pie",
            radius: "50%",
            data: [],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
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
        this.optionsCollapse = val.collapse;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true,
    },
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.collapse;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
    originWidgetLinkageLogic(this); // 联动-源组件逻辑
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsPie();
      this.setOptionsTitle();
      this.setOptionsValue();
      this.setOptionsTooltip();
      this.setOptionsLegend();
      this.setOptionsColor();
      this.setOptionsData();
      this.setOptionsPiechartStyle();
    },
    // 饼图设置
    setOptionsPie() {
      const optionsSetup = this.optionsSetup;
      const series = {
        type: "pie",
        radius: [optionsSetup.innerNumber + "%", optionsSetup.outerNumber + "%"],
        clockwise: optionsSetup.clockwise,
        startAngle: optionsSetup.startAngle,
        minAngle: optionsSetup.minAngle,
        minShowLabelAngle: optionsSetup.minShowLabelAngle,
        percentPrecision: optionsSetup.percentPrecision,
        // echarts v5.0.0开始支持
/*        itemStyle: {
          borderRadius: [optionsSetup.borderRadius + "%", optionsSetup.borderRadius + "%"],
        },
        */
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: "rgba(0, 0, 0, 0.5)",
          },
          label: {
            show: true,
            fontSize: 14,
            fontWeight: 'bold'
          },
        },
      };
      this.options.series[0] = series;
    },
    // 标题设置
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {};
      title.text = optionsSetup.titleText;
      title.show = optionsSetup.isNoTitle;
      title.left = optionsSetup.textAlign;
      title.textStyle = {
        color: optionsSetup.textColor,
        fontSize: optionsSetup.textFontSize,
        fontWeight: optionsSetup.textFontWeight,
        fontStyle: optionsSetup.textFontStyle,
      };
      title.subtext = optionsSetup.subText;
      title.subtextStyle = {
        color: optionsSetup.subTextColor,
        fontWeight: optionsSetup.subTextFontWeight,
        fontSize: optionsSetup.subTextFontSize,
        fontStyle: optionsSetup.subTextFontStyle,
      };
      this.options.title = title;
    },
    // 数值设定
    setOptionsValue() {
      const optionsSetup = this.optionsSetup;
      const numberValue = optionsSetup.numberValue ? "\n{c}" : "";
      const percentage = optionsSetup.percentage ? "\n({d}%)" : "";
      const label = {
        show: optionsSetup.isShow,
        position: optionsSetup.position,
        formatter: `{b}:${numberValue}${percentage}`,
        rich: {
          a: {
            padding: [-30, 15, -20, 15],
            color: optionsSetup.dataColor,
            fontSize: optionsSetup.fontSize,
            fontWeight: optionsSetup.fontWeight,
          },
        },
        fontSize: optionsSetup.fontSize,
        fontWeight: optionsSetup.optionsSetup,
      };
      // 引导线
      const labelLine = {
        show: optionsSetup.isShowLabelLine,
        length: optionsSetup.labelLineLength,
        length2: optionsSetup.labelLineLength2,
        smooth: optionsSetup.labelLineSmooth,
      }
      this.options.series[0].label = label;
      this.options.series[0].labelLine = labelLine;
    },
    // 提示语设置 tooltip
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        textStyle: {
          color: optionsSetup.tipsColor,
          fontSize: optionsSetup.tipsFontSize,
        },
      };
      this.options.tooltip = tooltip;
    },
    // 图例操作 legend
    setOptionsLegend() {
      const optionsSetup = this.optionsSetup;
      const legend = this.options.legend;
      legend.show = optionsSetup.isShowLegend;
      legend.left = optionsSetup.lateralPosition;
      legend.right = optionsSetup.lateralPosition;
      legend.top = optionsSetup.longitudinalPosition;
      legend.bottom =
        optionsSetup.longitudinalPosition;
      legend.orient = optionsSetup.layoutFront;
      legend.textStyle = {
        color: optionsSetup.legendColor,
        fontSize: optionsSetup.legendFontSize,
      };
      legend.itemWidth = optionsSetup.legendWidth;
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
      for (const key in this.options.series) {
        if (this.options.series[key].type == "pie") {
          this.options.series[key].data = staticData;
        }
      }
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
      for (const key in this.options.series) {
        if (this.options.series[key].type == "pie") {
          this.options.series[key].data = val;
        }
      }
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
