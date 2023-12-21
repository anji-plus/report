<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetBarCompareChart",
  //参考 https://www.makeapie.com/editor.html?c=xOjLyozu2W
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        axisPointer: {
          link: {
            xAxisIndex: "all",
          },
        },
        title: {
          x: "center",
          textStyle: {
            color: "#ffffff",
          },
        },
        tooltip: {
          show: true,
          trigger: "axis",
          axisPointer: {
            type: "line",
            lineStyle: {
              color: "#ffffff",
              type: "dashed",
            },
          },
          /*axisPointer: {
              type: 'cross',
              lineStyle: {
                  color: '#ffffff',
                  type: 'dashed',
              },
              crossStyle: {
                  color: '#ffffff',
              }
          },*/
        },
        //边距
        grid: [
          {
            // 上
            left: 30,
            right: 20,
            top: "60px",
            containLabel: true,
            bottom: "50%",
          },
          {
            // 下
            left: 30,
            containLabel: true,
            right: 20,
            top: "51%",
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
            //
            gridIndex: 0,
            show: true,
            type: "category",
            boundaryGap: true, // 居中
            axisLine: {
              //x轴线
              show: true,
              lineStyle: {
                color: "#ffffff",
              },
            },
            axisTick: {
              // 刻度
              show: true,
            },
            axisLabel: {
              // X轴数据
              show: true,
              textStyle: {
                interval: 0,
                color: "#ffffff",
                fontSize: 14,
              },
            },
            data: [],
          },
          {
            //
            gridIndex: 1,
            show: true,
            type: "category",
            position: "top",
            boundaryGap: true, // 居中
            axisLine: {
              // x轴线
              show: true,
              lineStyle: {
                color: "#ffffff",
              },
            },
            axisTick: {
              // 刻度
              show: true,
            },
            axisLabel: {
              show: false,
              interval: 0,
            },
            data: [],
          },
        ],
        yAxis: [
          {
            gridIndex: 0,
            show: true,
            scale: true, // 是否不从0开始,false从0开始
            axisLabel: {
              show: true,
              textStyle: {
                color: "#ffffff",
                fontSize: 14,
              },
            },
            axisLine: {
              // 轴线
              show: true,
              lineStyle: {
                color: "#ffffff",
              },
            },
            splitLine: {
              show: false,
              lineStyle: {
                color: "#ffffff",
              },
            },
            axisPointer: {
              snap: true,
            },
          },
          {
            gridIndex: 1,
            scale: false, // 是否从0开始
            inverse: true, // 翻转
            axisLabel: {
              show: true,
              textStyle: {
                color: "#ffffff",
                fontSize: 14,
              },
            },
            axisLine: {
              // 轴线
              show: true,
              lineStyle: {
                color: "#ffffff",
              },
            },
            splitLine: {
              show: false,
              lineStyle: {
                color: "#ffffff",
              },
            },
            axisPointer: {
              snap: true,
            },
          },
        ],
        series: [
          {
            name: "",
            type: "line",
            xAxisIndex: 0,
            yAxisIndex: 0,
            showSymbol: true, // 标记点
            symbol: "circle",
            symbolSize: 5,
            smooth: true, // 曲线，折线
            itemStyle: {
              color: "#36c5e7",
            },
            lineStyle: {
              color: "#36c5e7",
              width: 2,
            },
            label: {
              // 数值
              position: "top",
              distance: 10,
              show: true,
              color: "#36c5e7",
              fontSize: 14,
            },
            data: [],
          },
          {
            name: "",
            type: "line",
            xAxisIndex: 1,
            yAxisIndex: 1,
            showSymbol: true, // 标记点
            symbol: "circle",
            symbolSize: 5,
            smooth: true, // 曲线，折线
            itemStyle: {
              color: "#e68b55",
            },
            lineStyle: {
              color: "#e68b55",
              width: 2,
            },
            label: {
              // 数值
              position: "bottom",
              distance: 10,
              show: true,
              color: "#e68b55",
              fontSize: 16,
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
      this.setOptionsX();
      this.setOptionsYTop();
      this.setOptionsYBottom();
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
    // X轴设置
    setOptionsX() {
      const optionsSetup = this.optionsSetup;
      const xAxis0 = {
        gridIndex: 0,
        type: "category",
        show: optionsSetup.isShowX,
        name: optionsSetup.nameX, // 坐标轴名称
        nameLocation: optionsSetup.nameLocationX,
        nameTextStyle: {
          color: optionsSetup.nameColorX,
          fontSize: optionsSetup.nameFontSizeX,
          fontWeight: optionsSetup.nameFontWeightX,
          fontStyle: optionsSetup.nameFontStyleX,
          fontFamily: optionsSetup.nameFontFamilyX,
        },
        boundaryGap: true, // 值居中
        axisLabel: {
          // X轴数据
          show: optionsSetup.isShowAxisLabelX,
          interval: optionsSetup.textIntervalX,
          textStyle: {
            color: optionsSetup.textColorX,
            fontSize: optionsSetup.textFontSizeX,
            fontWeight: optionsSetup.textFontWeightX,
            fontStyle: optionsSetup.textFontStyleX,
            fontFamily: optionsSetup.textFontFamilyX,
          },
        },
        axisLine: {
          //x轴线
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
        axisTick: {
          // 刻度
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
      };
      const xAxis1 = {
        gridIndex: 1,
        show: optionsSetup.isShowX,
        type: "category",
        position: "top",
        boundaryGap: true, // 值居中
        axisLabel: {
          show: false,
        },
        axisLine: {
          //x轴线
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
        axisTick: {
          // 刻度
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
      };
      this.options.xAxis[0] = xAxis0;
      this.options.xAxis[1] = xAxis1;
    },
    // 上y轴设置
    setOptionsYTop() {
      const optionsSetup = this.optionsSetup;
      const yAxis = {
        max: optionsSetup.maxYTop !== "" ? optionsSetup.maxYTop : null,
        gridIndex: 0,
        splitNumber: optionsSetup.splitNumberYTop,
        show: optionsSetup.isShowYTop,
        // 缩放
        scale: optionsSetup.scaleYTop,
        position: optionsSetup.positionYTop,
        offset: optionsSetup.offsetYTop,
        // 坐标轴名称
        name: optionsSetup.textNameY,
        nameLocation: "end",
        nameTextStyle: {
          color: optionsSetup.nameColorY,
          fontSize: optionsSetup.nameFontSizeY,
          fontWeight: optionsSetup.nameFontWeightY,
          fontStyle: optionsSetup.nameFontStyleY,
          fontFamily: optionsSetup.nameFontFamilyY,
        },
        axisLabel: {
          show: optionsSetup.isShowAxisLabelYTop,
          rotate: optionsSetup.textAngleYTop,
          textStyle: {
            color: optionsSetup.textColorYTop,
            fontSize: optionsSetup.textFontSizeYTop,
            fontWeight: optionsSetup.textFontWeightYTop,
            fontStyle: optionsSetup.textFontStyleYTop,
            fontFamily: optionsSetup.textFontFamilyYTop,
          },
        },
        axisLine: {
          // 轴线
          show: optionsSetup.isShowAxisLineYTop,
          lineStyle: {
            color: optionsSetup.lineColorYTop,
            width: optionsSetup.lineWidthYTop,
          },
        },
        axisTick: {
          // 刻度
          show: optionsSetup.isShowAxisLineYTop,
          lineStyle: {
            color: optionsSetup.lineColorYTop,
            width: optionsSetup.lineWidthYTop,
          },
        },
        splitLine: {
          show: optionsSetup.isShowSplitLineYTop,
          lineStyle: {
            color: optionsSetup.splitLineColorYTop,
            width: optionsSetup.splitLineWidthYTop,
          },
        },
        axisPointer: {
          snap: true,
        },
      };
      this.options.yAxis[0] = yAxis;
    },
    // 下Y轴设置
    setOptionsYBottom() {
      const optionsSetup = this.optionsSetup;
      const yAxis = {
        max: optionsSetup.maxYBottom !== "" ? optionsSetup.maxYBottom : null,
        gridIndex: 1,
        splitNumber: optionsSetup.splitNumberYBottom,
        show: optionsSetup.isShowYBottom,
        // 缩放
        scale: optionsSetup.scaleYBottom,
        // 坐标轴名称
        name: optionsSetup.textNameY,
        nameLocation: "end",
        nameTextStyle: {
          color: optionsSetup.nameColorY,
          fontSize: optionsSetup.nameFontSizeY,
          fontWeight: optionsSetup.nameFontWeightY,
          fontStyle: optionsSetup.nameFontStyleY,
          fontFamily: optionsSetup.nameFontFamilyY,
        },
        inverse: true, // 翻转
        axisLabel: {
          show: optionsSetup.isShowAxisLabelYBottom,
          rotate: optionsSetup.textAngleYBottom,
          textStyle: {
            color: optionsSetup.textColorYBottom,
            fontSize: optionsSetup.textFontSizeYBottom,
            fontWeight: optionsSetup.textFontWeightYBottom,
            fontStyle: optionsSetup.textFontStyleYBottom,
            fontFamily: optionsSetup.textFontFamilyYBottom,
          },
        },
        axisLine: {
          // 轴线
          show: optionsSetup.isShowAxisLineYBottom,
          lineStyle: {
            color: optionsSetup.lineColorYBottom,
            width: optionsSetup.lineWidthYBottom,
          },
        },
        axisTick: {
          // 刻度
          show: optionsSetup.isShowAxisLineYBottom,
          lineStyle: {
            color: optionsSetup.lineColorYBottom,
            width: optionsSetup.lineWidthYBottom,
          },
        },
        splitLine: {
          show: optionsSetup.isShowSplitLineYTop,
          lineStyle: {
            color: optionsSetup.splitLineColorYBottom,
            width: optionsSetup.splitLineWidthYBottom,
          },
        },
        axisPointer: {
          snap: true,
        },
      };
      this.options.yAxis[1] = yAxis;
    },
    // 数值设定 折线设置
    setOptionsTop() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      // 折线
      for (const key in series) {
        series[key].symbol = optionsSetup.symbol;
        series[key].showSymbol = optionsSetup.markPoint;
        series[key].symbolSize = optionsSetup.pointSize;
        series[key].smooth = optionsSetup.smoothCurve;
        if (optionsSetup.area) {
          series[key].areaStyle = {
            opacity: optionsSetup.areaThickness / 100,
          };
        } else {
          series[key].areaStyle = {
            opacity: 0,
          };
        }
      }
      // 数值
      if (series[0].type == "line") {
        series[0].label = {
          position: "top",
          distance: optionsSetup.fontDistance,
          show: optionsSetup.isShow,
          color: optionsSetup.fontColor,
          fontSize: optionsSetup.fontSize,
          fontWeight: optionsSetup.fontWeight,
          formatter: !!optionsSetup.percentSign ? '{c}%' : '{c}',
          fontStyle: optionsSetup.fontStyle,
          fontFamily: optionsSetup.fontFamily,
        };
        series[1].label = {
          position: "bottom",
          distance: optionsSetup.fontDistance,
          show: optionsSetup.isShow,
          color: optionsSetup.fontColor,
          fontSize: optionsSetup.fontSize,
          fontWeight: optionsSetup.fontWeight,
          formatter: !!optionsSetup.percentSign ? '{c}%' : '{c}',
          fontStyle: optionsSetup.fontStyle,
          fontFamily: optionsSetup.fontFamily,
        };
      }
    },
    // tooltip 提示语设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      let tooltip = {};
      if (optionsSetup.tipsType == "line") {
        tooltip = {
          show: optionsSetup.tipsShow,
          trigger: "axis",
          axisPointer: {
            type: optionsSetup.tipsType,
            lineStyle: {
              color: optionsSetup.tipsColor,
              type: "dashed",
            },
          },
        };
      } else {
        tooltip = {
          show: optionsSetup.tipsShow,
          trigger: "axis",
          axisPointer: {
            type: optionsSetup.tipsType,
            lineStyle: {
              color: optionsSetup.tipsColor,
              type: "dashed",
            },
            crossStyle: {
              color: optionsSetup.tipsColor,
            },
          },
        };
      }
      this.options.tooltip = tooltip;
    },
    // 边距设置
    setOptionsGrid() {
      const optionsSetup = this.optionsSetup;
      const grid = [
        {
          // 上
          left: optionsSetup.marginLeft,
          right: optionsSetup.marginRight,
          top: optionsSetup.marginTop,
          containLabel: true,
          bottom: "50%",
        },
        {
          // 下
          left: optionsSetup.marginLeft,
          right: optionsSetup.marginRight,
          containLabel: true,
          top: "51%",
          bottom: optionsSetup.marginBottom,
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
    // 颜色修改、宽度修改
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const customColor = optionsSetup.customColor;
      const series = this.options.series;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      if (!customColor) return;
      for (const key in series) {
        const itemStyle = {
          color: arrColor[key],
        };
        const lineStyle = {
          color: arrColor[key],
          width: optionsSetup.lineWidth,
        };
        this.options.series[key].itemStyle = itemStyle;
        this.options.series[key].lineStyle = lineStyle;
      }
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
      this.options.xAxis[0]["data"] = xAxisList;
      this.options.xAxis[1]["data"] = xAxisList;
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
      this.options.xAxis[0]["data"] = val.xAxis;
      this.options.xAxis[1]["data"] = val.xAxis;
      if (val.series[0].type == "line") {
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
