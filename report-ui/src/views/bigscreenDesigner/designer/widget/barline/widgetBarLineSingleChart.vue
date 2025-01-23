<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :option="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetBarLineSingleChart",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        color: [],
        grid: {},
        title: {
          text: "",
          textStyle: {
            color: "#fff",
          },
        },
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c}%",
        },
        legend: {
          textStyle: {
            color: "#fff",
          },
        },
        xAxis: [
          {
            type: "category",
            data: [],
            axisLabel: {
              show: false,
              textStyle: {
                color: "#fff",
              },
            },
          },
        ],
        yAxis: [
          {
            type: "value",
            name: "",
            min: 0,
            max: 250,
            interval: 50,
            axisLabel: {
              show: true,
              textStyle: {
                color: "#fff",
              },
            },
          },
        ],
        series: [
          {
            name: "",
            type: "bar",
            data: [],
            itemStyle: {
              barBorderRadius: null,
            },
          },
          {
            name: "",
            type: "line",
            data: [],
            itemStyle: {},
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
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsX();
      this.setOptionsY();
      this.setOptionsTooltip();
      this.setOptionsData();
      this.setOptionsMargin();
      this.setOptionsLegend();
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
      const xAxis = {
        type: "category",
        // 坐标轴是否显示
        show: optionsSetup.isShowX,
        position: optionsSetup.positionX,
        offset: optionsSetup.offsetX,
        // 坐标轴名称
        name: optionsSetup.nameX,
        nameLocation: optionsSetup.nameLocationX,
        nameTextStyle: {
          color: optionsSetup.nameColorX,
          fontSize: optionsSetup.nameFontSizeX,
          fontWeight: optionsSetup.nameFontWeightX,
          fontStyle: optionsSetup.nameFontStyleX,
          fontFamily: optionsSetup.nameFontFamilyX,
        },
        // 轴反转
        inverse: optionsSetup.reversalX,
        axisLabel: {
          show: optionsSetup.isShowAxisLabelX,
          interval: optionsSetup.textIntervalX,
          // 文字角度
          rotate: optionsSetup.textAngleX,
          textStyle: {
            // 坐标文字颜色
            color: optionsSetup.textColorX,
            fontSize: optionsSetup.textFontSizeX,
            fontWeight: optionsSetup.textFontWeightX,
            fontStyle: optionsSetup.textFontStyleX,
            fontFamily: optionsSetup.textFontFamilyX,
          },
        },
        // X轴线
        axisLine: {
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
        // X轴刻度线
        axisTick: {
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
        // X轴分割线
        splitLine: {
          show: optionsSetup.isShowSplitLineX,
          lineStyle: {
            color: optionsSetup.splitLineColorX,
            width: optionsSetup.splitLineWidthX,
          },
        },
      };
      this.options.xAxis = xAxis;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const yAxis = [
        {
          max: optionsSetup.maxY !== "" ? optionsSetup.maxY : null,
          min: optionsSetup.minY !== "" ? optionsSetup.minY : null,
          type: "value",
          scale: optionsSetup.scaleY,
          // 均分
          splitNumber: optionsSetup.splitNumberY,
          // 坐标轴是否显示
          show: optionsSetup.isShowY,
          position: optionsSetup.positionY,
          offset: optionsSetup.offsetY,
          // 坐标轴名称
          name: optionsSetup.textNameY,
          nameLocation: optionsSetup.nameLocationY,
          // 别名
          nameTextStyle: {
            color: optionsSetup.nameColorY,
            fontSize: optionsSetup.nameFontSizeY,
            fontWeight: optionsSetup.nameFontWeightY,
            fontStyle: optionsSetup.nameFontStyleY,
            fontFamily: optionsSetup.nameFontFamilyY,
          },
          axisLabel: {
            show: optionsSetup.isShowAxisLabelY,
            // 文字角度
            rotate: optionsSetup.textAngleY,
            textStyle: {
              // 坐标文字颜色
              color: optionsSetup.textColorY,
              fontSize: optionsSetup.textFontSizeY,
              fontWeight: optionsSetup.textFontWeightY,
              fontStyle: optionsSetup.textFontStyleY,
              fontFamily: optionsSetup.textFontFamilyY,
            },
          },
          axisLine: {
            show: optionsSetup.isShowAxisLineY,
            lineStyle: {
              width: optionsSetup.lineWidthY,
              color: optionsSetup.lineColorY,
            },
          },
          axisTick: {
            // 刻度
            show: optionsSetup.isShowAxisLineY,
            lineStyle: {
              width: optionsSetup.lineWidthY,
              color: optionsSetup.lineColorY,
            },
          },
          splitLine: {
            show: optionsSetup.isShowSplitLineY,
            lineStyle: {
              color: optionsSetup.splitLineColorY,
              width: optionsSetup.splitLineFontWidthY,
            },
          },
        },
      ];
      this.options.yAxis = yAxis;
    },
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        show: optionsSetup.isShowTooltip,
        trigger: optionsSetup.tooltipTrigger,
        axisPointer: {
          type: optionsSetup.tooltipAxisPointerType,
        },
        backgroundColor: optionsSetup.tooltipBackgroundColor,
        borderColor: optionsSetup.tooltipBorderColor,
        borderWidth: optionsSetup.tooltipBorderWidth,
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
    setOptionsMargin() {
      const optionsSetup = this.optionsSetup;
      const grid = {
        left: optionsSetup.marginLeft,
        right: optionsSetup.marginRight,
        bottom: optionsSetup.marginBottom,
        top: optionsSetup.marginTop,
        containLabel: true,
      };
      this.options.grid = grid;
    },
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
      if (null == legendName || legendName === "") {
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
    // 数据处理
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
      optionsData.dataType === "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const series = this.options.series;
      const optionsSetup = this.optionsSetup;
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      let axis = [];
      let bar = [];
      let line = [];
      for (const i in val) {
        axis[i] = val[i].axis;
        bar[i] = val[i].bar;
        line[i] = val[i].line;
      }
      const legendName = [];
      legendName.push("bar");
      legendName.push("line");
      // x轴
      this.options.xAxis.data = axis;
      // series
      for (const i in series) {
        if (series[i].type === "bar") {
          series[i].name = legendName[i];
          series[i].type = "bar";
          series[i].barGap = optionsSetup.barGap + "%";
          series[i].data = bar;
          series[i].barWidth = optionsSetup.maxWidth;
          series[i].barMinHeight = optionsSetup.minHeight;
          series[i].label = {
            show: optionsSetup.isShowBar,
            position: optionsSetup.fontPositionBar,
            distance: optionsSetup.fontDistanceBar,
            fontSize: optionsSetup.fontSizeBar,
            color: optionsSetup.fontColorBar,
            fontWeight: optionsSetup.fontWeightBar,
            formatter: !!optionsSetup.percentSignBar ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyleBar,
            fontFamily: optionsSetup.fontFamilyBar,
          };
          //柱体背景属性
          series[i].showBackground = optionsSetup.isShowBackground;
          series[i].backgroundStyle = {
            color: optionsSetup.backgroundStyleColor,
            borderColor: optionsSetup.backgroundStyleBorderColor,
            borderWidth: optionsSetup.backgroundStyleBorderWidth,
            borderType: optionsSetup.backgroundStyleBorderType,
            shadowBlur: optionsSetup.backgroundStyleShadowBlur,
            shadowColor: optionsSetup.backgroundStyleShadowColor,
            opacity: optionsSetup.backgroundStyleOpacity / 100,
          };
          series[i].itemStyle = {
            normal: {
              color: arrColor[i],
              barBorderRadius: optionsSetup.radius,
            },
          };
        } else if (series[i].type === "line") {
          series[i].name = legendName[i];
          series[i].type = "line";
          series[i].data = line;
          series[i].showSymbol = optionsSetup.markPoint;
          series[i].symbolSize = optionsSetup.pointSize;
          series[i].smooth = optionsSetup.smoothCurve;
          if (optionsSetup.area) {
            series[i].areaStyle = {
              opacity: optionsSetup.areaThickness / 100,
            };
          } else {
            series[i].areaStyle = {
              opacity: 0,
            };
          }
          series[i].lineStyle = {
            color: arrColor[i],
            width: optionsSetup.lineWidth,
          };
          series[i].label = {
            show: optionsSetup.isShowLine,
            position: optionsSetup.fontPositionLine,
            distance: optionsSetup.fontDistanceLine,
            fontSize: optionsSetup.fontSizeLine,
            color: optionsSetup.fontColorLine,
            fontWeight: optionsSetup.fontWeightLine,
            formatter: !!optionsSetup.percentSignLine ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyleLine,
            fontFamily: optionsSetup.fontFamilyLine,
          };
        }
      }
      // 根据图表的宽度 x轴的字体大小、长度来估算X轴的label能展示多少个字
      const rowsNum = optionsSetup.textRowsNum !== "" ? optionsSetup.textRowsNum : parseInt((this.optionsStyle.width / axis.length) / optionsSetup.textFontSizeX);
      const axisLabel = {
        show: optionsSetup.isShowAxisLabelX,
        interval: optionsSetup.textIntervalX,
        // 文字角度
        rotate: optionsSetup.textAngleX,
        textStyle: {
          // 坐标文字颜色
          color: optionsSetup.textColorX,
          fontSize: optionsSetup.textFontSizeX,
          fontWeight: optionsSetup.textFontWeightX,
          fontStyle: optionsSetup.textFontStyleX,
          fontFamily: optionsSetup.textFontFamilyX,
        },
        // 自动换行
        formatter: function (value, index) {
          const strs = value.split('');
          let str = ''
          for (let i = 0, s; s = strs[i++];) {
            str += s;
            if (!(i % rowsNum)) str += '\n';
          }
          return str
        }
      }
      if (optionsSetup.textRowsBreakAuto) {
        this.options.xAxis.axisLabel = axisLabel;
      }
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
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
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      this.options.xAxis.data = val.xAxis;
      const series = [];
      const legendName = [];
      for (const i in val.series) {
        legendName.push(val.series[i].name);
        const obj = {};
        if (val.series[i].type === "bar") {
          obj.name = val.series[i].name;
          obj.type = "bar";
          obj.barGap = optionsSetup.barGap + "%";
          obj.barWidth = optionsSetup.maxWidth;
          obj.barMinHeight = optionsSetup.minHeight;
          obj.label = {
            show: optionsSetup.isShowBar,
            position: optionsSetup.fontPositionBar,
            distance: optionsSetup.fontDistanceBar,
            fontSize: optionsSetup.fontSizeBar,
            color: optionsSetup.fontColorBar,
            fontWeight: optionsSetup.fontWeightBar,
            formatter: !!optionsSetup.percentSignBar ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyleBar,
            fontFamily: optionsSetup.fontFamilyBar,
          };
          //柱体背景属性
          obj.showBackground = optionsSetup.isShowBackground;
          obj.backgroundStyle = {
            color: optionsSetup.backgroundStyleColor,
            borderColor: optionsSetup.backgroundStyleBorderColor,
            borderWidth: optionsSetup.backgroundStyleBorderWidth,
            borderType: optionsSetup.backgroundStyleBorderType,
            shadowBlur: optionsSetup.backgroundStyleShadowBlur,
            shadowColor: optionsSetup.backgroundStyleShadowColor,
            opacity: optionsSetup.backgroundStyleOpacity / 100,
          };
          obj.itemStyle = {
            normal: {
              color: arrColor[i],
              barBorderRadius: optionsSetup.radius,
            },
          };
          obj.data = val.series[i].data;
          series.push(obj);
        } else if (val.series[i].type === "line") {
          obj.name = val.series[i].name;
          obj.type = "line";
          obj.symbol = optionsSetup.symbol;
          obj.showSymbol = optionsSetup.markPoint;
          obj.symbolSize = optionsSetup.pointSize;
          obj.smooth = optionsSetup.smoothCurve;
          if (optionsSetup.area) {
            obj.areaStyle = {
              opacity: optionsSetup.areaThickness / 100,
            };
          } else {
            obj.areaStyle = {
              opacity: 0,
            };
          }
          obj.lineStyle = {
            color: arrColor[i],
            width: optionsSetup.lineWidth,
          };
          obj.label = {
            show: optionsSetup.isShowLine,
            position: optionsSetup.fontPositionLine,
            distance: optionsSetup.fontDistanceLine,
            fontSize: optionsSetup.fontSizeLine,
            color: optionsSetup.fontColorLine,
            fontWeight: optionsSetup.fontWeightLine,
            formatter: !!optionsSetup.percentSignLine ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyleLine,
            fontFamily: optionsSetup.fontFamilyLine,
          };
          obj.data = val.series[i].data;
          series.push(obj);
        }
      }
      // 根据图表的宽度 x轴的字体大小、长度来估算X轴的label能展示多少个字
      const xAxisDataLength = val.length !== 0 ? val.xAxis.length : 1;
      const rowsNum = optionsSetup.textRowsNum !== "" ? optionsSetup.textRowsNum : parseInt((this.optionsStyle.width / xAxisDataLength) / optionsSetup.textFontSizeX);
      const axisLabel = {
        show: optionsSetup.isShowAxisLabelX,
        interval: optionsSetup.textIntervalX,
        // 文字角度
        rotate: optionsSetup.textAngleX,
        textStyle: {
          // 坐标文字颜色
          color: optionsSetup.textColorX,
          fontSize: optionsSetup.textFontSizeX,
          fontWeight: optionsSetup.textFontWeightX,
          fontStyle: optionsSetup.textFontStyleX,
          fontFamily: optionsSetup.textFontFamilyX,
        },
        // 自动换行
        formatter: function (value, index) {
          const strs = value.split('');
          let str = ''
          for (let i = 0, s; s = strs[i++];) {
            str += s;
            if (!(i % rowsNum)) str += '\n';
          }
          return str
        }
      }
      if (optionsSetup.textRowsBreakAuto) {
        this.options.xAxis.axisLabel = axisLabel;
      }
      this.options.series = series;
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
