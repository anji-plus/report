<!--
 * @Descripttion: 大屏报表设计器-动态组件
 * @Author: qianming
 * @Date: 2021-8-24 16:38:27
 * @LastEditors: qianming
 * @LastEditTime: 2023-11-21 17:38:44
-->
<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetBarCompareChart",
  //参考 https://www.makeapie.com/editor.html?c=xrJwcCF3NZ
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        title: {
          //text: '柱状对比图',
          x: "center",
          textStyle: {
            color: "#ffffff",
          },
        },
        //边距
        grid: [
          {
            //左
            show: false, //边框线
            left: "4%",
            top: 60,
            bottom: 10,
            containLabel: true,
            width: "40%",
          },
          {
            //中间字体位置
            show: false,
            left: "50.5%",
            top: 60,
            bottom: 25,
            width: "0%",
          },
          {
            //右
            show: false,
            right: "4%",
            top: 60,
            bottom: 10,
            containLabel: true,
            width: "40%",
          },
        ],
        //图例
        legend: {
          textStyle: {
            color: "#fff",
            textAlign: "center",
          },
          //itemGap:80,
          //itemWidth: 0
        },
        xAxis: [
          {
            // 左
            splitNumber: 2,
            show: true,
            type: "value",
            inverse: true,
            axisLine: {
              //底分割线
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: "bottom",
            axisLabel: {
              // x轴
              show: true,
              textStyle: {
                color: "#ffffff",
                fontSize: 12,
              },
            },
            splitLine: {
              // 竖分割线
              show: true,
              lineStyle: {
                color: "#57617f",
                width: 1,
                type: "solid",
              },
            },
          },
          {
            gridIndex: 1,
            show: false,
          },
          {
            // 右
            gridIndex: 2,
            show: true,
            type: "value",
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            position: "bottom",
            axisLabel: {
              show: true,
              textStyle: {
                color: "#ffffff",
                fontSize: 12,
              },
            },
            splitLine: {
              show: true,
              lineStyle: {
                color: "#57617f",
                width: 1,
                type: "solid",
              },
            },
          },
        ],
        yAxis: [
          {
            type: "category",
            inverse: true,
            position: "right",
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            axisLabel: {
              show: false,
            },
            data: [],
          },
          {
            //处理轴数据
            gridIndex: 1,
            type: "category",
            inverse: true,
            position: "left",
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            axisLabel: {
              show: true,
              textStyle: {
                align: "center",
                color: "#ffffff",
                fontSize: 14,
              },
            },
            data: [],
          },
          {
            gridIndex: 2,
            type: "category",
            inverse: true,
            position: "left",
            axisLine: {
              show: false,
            },
            axisTick: {
              show: false,
            },
            axisLabel: {
              show: false,
            },
          },
        ],
        series: [
          {
            name: "",
            type: "bar",
            barGap: 20,
            barWidth: 15,
            label: {
              normal: {
                show: true,
                color: "red",
                position: "insideLeft",
                textStyle: {
                  color: "#ffffff",
                },
              },
              emphasis: {
                show: false,
              },
            },
            itemStyle: {
              normal: {
                color: "#36c5e7",
                barBorderRadius: [8, 0, 0, 8],
              },
              emphasis: {
                show: false,
              },
            },
            data: [],
          },
          {
            name: "",
            type: "bar",
            barGap: 20,
            barWidth: 15,
            xAxisIndex: 2,
            yAxisIndex: 2,
            label: {
              normal: {
                show: true,
                color: "red",
                position: "insideRight",
                textStyle: {
                  color: "#ffffff",
                },
              },
            },
            itemStyle: {
              normal: {
                color: "#e68b55",
                barBorderRadius: [0, 8, 8, 0],
              },
              emphasis: {
                show: false,
              },
            },
            data: [],
          },
        ],
      },
      optionsStyle: {},
      optionsData: {},
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
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsXLeft();
      this.setOptionsXRight();
      this.setOptionsY();
      this.setOptionsTop();
      this.setOptionsTooltip();
      this.setOptionsGrid();
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
    // 左X轴设置
    setOptionsXLeft() {
      const optionsSetup = this.optionsSetup;
      const xAxisLeft = {
        max: optionsSetup.maxXLeft !== "" ? optionsSetup.maxXLeft : null,
        splitNumber: optionsSetup.splitNumberXLeft,
        type: "value",
        show: optionsSetup.isShowXLeft,
        inverse: true,
        position: "bottom",
        axisLabel: {
          // x轴
          show: optionsSetup.isShowAxisLabelXLeft,
          //interval: optionsSetup.textIntervalXLeft,
          textStyle: {
            color: optionsSetup.textColorXLeft,
            fontSize: optionsSetup.textFontSizeXLeft,
            fontWeight: optionsSetup.textFontWeightXLeft,
            fontStyle: optionsSetup.textFontStyleXLeft,
            fontFamily: optionsSetup.textFontFamilyXLeft,
          },
        },
        //X轴线
        axisLine: {
          show: optionsSetup.isShowAxisLineXLeft,
          lineStyle: {
            color: optionsSetup.lineColorXLeft,
            width: optionsSetup.lineWidthXLeft,
          },
        },
        // X轴刻度线
        axisTick: {
          show: optionsSetup.isShowAxisLineXLeft,
          lineStyle: {
            color: optionsSetup.lineColorXLeft,
            width: optionsSetup.lineWidthXLeft,
          },
        },
        splitLine: {
          // 分割线
          show: optionsSetup.isShowSplitLineXLeft,
          lineStyle: {
            color: optionsSetup.splitLineColorXLeft,
            width: optionsSetup.splitLineWidthXLeft,
            type: "solid",
          },
        },
      };
      this.options.xAxis[0] = xAxisLeft;
    },
    // 右X轴设置
    setOptionsXRight() {
      const optionsSetup = this.optionsSetup;
      const xAxisRight = {
        max: optionsSetup.maxXRight !== "" ? optionsSetup.maxXRight : null,
        gridIndex: 2,
        splitNumber: optionsSetup.splitNumberXRight,
        show: optionsSetup.isShowXRight,
        type: "value",
        position: "bottom",
        axisLabel: {
          // x轴
          show: optionsSetup.isShowAxisLabelXRight,
          textStyle: {
            color: optionsSetup.textColorXRight,
            fontSize: optionsSetup.textFontSizeXRight,
            fontWeight: optionsSetup.textFontWeightXRight,
            fontStyle: optionsSetup.textFontStyleXRight,
            fontFamily: optionsSetup.textFontFamilyXRight,
          },
        },
        axisLine: {
          //X轴线
          show: optionsSetup.isShowAxisLineXRight,
          lineStyle: {
            color: optionsSetup.lineColorXRight,
            width: optionsSetup.lineWidthXRight,
          },
        },
        axisTick: {
          show: optionsSetup.isShowAxisLineXRight,
          lineStyle: {
            color: optionsSetup.lineColorXRight,
            width: optionsSetup.lineWidthXRight,
          },
        },
        splitLine: {
          // 分割线
          show: optionsSetup.isShowSplitLineXRight,
          lineStyle: {
            color: optionsSetup.splitLineColorXRight,
            width: optionsSetup.splitLineWidthXRight,
            type: "solid",
          },
        },
      };
      this.options.xAxis[2] = xAxisRight;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const yAxis = {
        //处理轴数据
        gridIndex: 1,
        type: "category",
        inverse: true,
        show: true,
        axisLabel: {
          show: optionsSetup.isShowAxisLabelY,
          interval: optionsSetup.textIntervalY,
          textStyle: {
            align: "center",
            color: optionsSetup.textColorY,
            fontSize: optionsSetup.textFontSizeY,
            fontWeight: optionsSetup.textFontWeightY,
            fontStyle: optionsSetup.textFontStyleY,
            fontFamily: optionsSetup.textFontFamilyY,
          },
        },
        axisLine: {
          show: false,
        },
        axisTick: {
          show: false,
        },
      };
      this.options.yAxis[1] = yAxis;
    },
    // 数值设定、柱体设置
    setOptionsTop() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      series[0].label = {
        normal: {
          show: optionsSetup.isShow,
          position: "insideLeft",
          textStyle: {
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.dataColor,
            fontWeight: optionsSetup.fontWeight,
          },
        },
        emphasis: {
          show: false,
        },
      };
      series[1].label = {
        normal: {
          show: optionsSetup.isShow,
          color: "red",
          position: "insideRight",
          textStyle: {
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.dataColor,
            fontWeight: optionsSetup.fontWeight,
          },
        },
        emphasis: {
          show: false,
        },
      };
      for (const key in series) {
        series[key].barWidth = optionsSetup.maxWidth;
        //柱体背景属性
        series[key].showBackground = optionsSetup.isShowBackground;
        series[key].backgroundStyle = {
          color: optionsSetup.backgroundStyleColor,
          borderColor: optionsSetup.backgroundStyleBorderColor,
          borderWidth: optionsSetup.backgroundStyleBorderWidth,
          borderType: optionsSetup.backgroundStyleBorderType,
          shadowBlur: optionsSetup.backgroundStyleShadowBlur,
          shadowColor: optionsSetup.backgroundStyleShadowColor,
          opacity: optionsSetup.backgroundStyleOpacity / 100,
        };
      }
      this.options.series = series;
    },
    // tooltip 提示语设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        show: optionsSetup.isShowTooltip,
        trigger: optionsSetup.tooltipTrigger,
        axisPointer: {
          type: optionsSetup.tooltipAxisPointerType,
        },
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
    // 边距设置
    setOptionsGrid() {
      const optionsSetup = this.optionsSetup;
      const grid = [
        {
          //左
          show: optionsSetup.frameLineLeft,
          borderColor: optionsSetup.borderColorLeft,
          borderWidth: optionsSetup.borderWidthLeft,
          left: optionsSetup.marginLeftRight,
          top: optionsSetup.marginTop,
          bottom: optionsSetup.marginBottom,
          containLabel: true,
          width: "40%",
        },
        {
          //中间字体位置
          show: false,
          left: "51%",
          top: optionsSetup.marginTop,
          bottom: optionsSetup.marginBottom + 15,
          width: "0%",
        },
        {
          //右
          show: optionsSetup.frameLineRight,
          borderColor: optionsSetup.borderColorRight,
          borderWidth: optionsSetup.borderWidthRight,
          right: optionsSetup.marginLeftRight,
          top: optionsSetup.marginTop,
          bottom: optionsSetup.marginBottom,
          containLabel: true,
          width: "40%",
        },
      ];
      this.options.grid = grid;
    },
    // 图例操作
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
    // 图例名称设置
    setOptionsLegendName(name) {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      const legendName = optionsSetup.legendName;
      // 图例没有手动写则显示原值，写了则显示新值
      if (null == legendName || legendName == "") {
        for (let i = 0; i < name.length; i++) {
          series[i].name = name[i];
        }
        this.options.legend["data"] = name;
      } else {
        const arr = legendName.split("|");
        for (let i = 0; i < arr.length; i++) {
          series[i].name = arr[i];
        }
        this.options.legend["data"] = arr;
      }
    },
    // 颜色修改、圆角修改
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const customColor = optionsSetup.customColor;
      if (!customColor) return;
      const itemStyleLeft = {
        normal: {
          color: customColor[0].color,
          barBorderRadius: [optionsSetup.radius, 0, 0, optionsSetup.radius],
        },
        emphasis: {
          show: false,
        },
      };
      const itemStyleRight = {
        normal: {
          color: customColor[1].color,
          barBorderRadius: [0, optionsSetup.radius, optionsSetup.radius, 0],
        },
        emphasis: {
          show: false,
        },
      };
      this.options.series[0].itemStyle = itemStyleLeft;
      this.options.series[1].itemStyle = itemStyleRight;
    },
    // 数据解析
    setOptionsData(e, paramsConfig) {
      const optionsSetup = this.optionsSetup;
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
        ? this.staticDataFn(optionsData.staticData, optionsSetup)
        : this.dynamicDataFn(
          optionsData.dynamicData,
          optionsData.refreshTime,
          optionsSetup
        );
    },
    //去重
    setUnique(arr) {
      let newArr = [];
      arr.forEach((item) => {
        return newArr.includes(item) ? "" : newArr.push(item);
      });
      return newArr;
    },
    //静态数据
    staticDataFn(val) {
      //数据
      let xAxisList = [];
      let yAxisList = [];
      let arrayList = [];
      const legendName = [];
      for (const i in val) {
        xAxisList[i] = val[i].axis;
        yAxisList[i] = val[i].name;
      }
      xAxisList = this.setUnique(xAxisList);
      yAxisList = this.setUnique(yAxisList);
      for (const i in yAxisList) {
        const data = new Array(xAxisList.length).fill(0);
        for (const j in xAxisList) {
          for (const k in val) {
            if (val[k].name == yAxisList[i]) {
              if (val[k].axis == xAxisList[j]) {
                data[j] = val[k].data;
              }
            }
          }
        }
        arrayList.push({
          name: yAxisList[i],
          data: data,
        });
        legendName.push(yAxisList[i]);
      }
      this.options.series[0]["name"] = arrayList[0].name;
      this.options.series[0]["data"] = arrayList[0].data;
      this.options.series[1]["name"] = arrayList[1].name;
      this.options.series[1]["data"] = arrayList[1].data;
      this.options.yAxis[1]["data"] = xAxisList;
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
    },
    // 动态数据
    dynamicDataFn(val, refreshTime, optionsSetup) {
      if (!val) return;
      if (this.ispreview) {
        this.getEchartData(val, optionsSetup);
        this.flagInter = setInterval(() => {
          this.getEchartData(val, optionsSetup);
        }, refreshTime);
      } else {
        this.getEchartData(val, optionsSetup);
      }
    },
    getEchartData(val, optionsSetup) {
      const data = this.queryEchartsData(val);
      data.then((res) => {
        this.renderingFn(optionsSetup, res);
      });
    },
    renderingFn(optionsSetup, val) {
      const legendName = [];
      this.options.yAxis[1]["data"] = val.xAxis;
      if (val.series[0].type == "bar") {
        this.options.series[0]["name"] = val.series[0].name;
        this.options.series[0]["data"] = val.series[0].data;
        this.options.series[1]["name"] = val.series[1].name;
        this.options.series[1]["data"] = val.series[1].data;
        legendName.push(val.series[0].name);
        legendName.push(val.series[1].name);
      }
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
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
