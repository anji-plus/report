<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "WidgetBarDoubleYaxisChart",
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
          {
            type: "value",
            name: "",
            min: 0,
            max: 25,
            interval: 5,
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
            yAxisIndex: 0,
            data: [],
            itemStyle: {
              barBorderRadius: null,
            },
          },
          {
            name: "",
            type: "bar",
            yAxisIndex: 1,
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
      this.setOptionsBar();
      this.setOptionsTooltip();
      this.setOptionsData();
      this.setOptionsMargin();
      this.setOptionsLegend();
      this.setOptionsColor();
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
        axisLine: {
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
        axisTick: {
          show: optionsSetup.isShowAxisLineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
            width: optionsSetup.lineWidthX,
          },
        },
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
          max: optionsSetup.maxYLeft !== "" ? optionsSetup.maxYLeft : null,
          type: "value",
          scale: optionsSetup.scaleYLeft,
          // 均分
          splitNumber: optionsSetup.splitNumberYLeft,
          // 坐标轴是否显示
          show: optionsSetup.isShowYLeft,
          position: optionsSetup.positionYLeft,
          offset: optionsSetup.offsetYLeft,
          // 坐标轴名称
          name: optionsSetup.textNameYLeft,
          nameLocation: optionsSetup.nameLocationYLeft,
          // 别名
          nameTextStyle: {
            color: optionsSetup.nameColorYLeft,
            fontSize: optionsSetup.nameFontSizeYLeft,
            fontWeight: optionsSetup.nameFontWeightYLeft,
            fontStyle: optionsSetup.nameFontStyleYLeft,
            fontFamily: optionsSetup.nameFontFamilyYLeft,
          },
          axisLabel: {
            show: optionsSetup.isShowAxisLabelYLeft,
            // 文字角度
            rotate: optionsSetup.textAngleYLeft,
            textStyle: {
              // 坐标文字颜色
              color: optionsSetup.textColorYLeft,
              fontSize: optionsSetup.textFontSizeYLeft,
              fontWeight: optionsSetup.textFontWeightYLeft,
              fontStyle: optionsSetup.textFontStyleYLeft,
              fontFamily: optionsSetup.textFontFamilyYLeft,
            },
          },
          axisLine: {
            show: optionsSetup.isShowAxisLineYLeft,
            lineStyle: {
              width: optionsSetup.lineWidthYLeft,
              color: optionsSetup.lineColorYLeft,
            },
          },
          axisTick: {
            // 刻度
            show: optionsSetup.isShowAxisLineYLeft,
            lineStyle: {
              width: optionsSetup.lineWidthYLeft,
              color: optionsSetup.lineColorYLeft,
            },
          },
          splitLine: {
            show: optionsSetup.isShowSplitLineYLeft,
            lineStyle: {
              color: optionsSetup.splitLineColorYLeft,
              width: optionsSetup.splitLineFontWidthYLeft,
            },
          },
        },
        {
          max: optionsSetup.maxYRight !== "" ? optionsSetup.maxYRight : null,
          type: "value",
          scale: optionsSetup.scaleYRight,
          // 均分
          splitNumber: optionsSetup.splitNumberYRight,
          // 坐标轴是否显示
          show: optionsSetup.isShowYRight,
          position: optionsSetup.positionYRight,
          offset: optionsSetup.offsetYRight,
          // 坐标轴名称
          name: optionsSetup.textNameYRight,
          nameLocation: optionsSetup.nameLocationYRight,
          // 别名
          nameTextStyle: {
            color: optionsSetup.nameColorYRight,
            fontSize: optionsSetup.nameFontSizeYRight,
            fontWeight: optionsSetup.nameFontWeightYRight,
            fontStyle: optionsSetup.nameFontStyleYRight,
            fontFamily: optionsSetup.nameFontFamilyYRight,
          },
          axisLabel: {
            show: optionsSetup.isShowAxisLabelYRight,
            // 文字角度
            rotate: optionsSetup.textAngleYRight,
            textStyle: {
              // 坐标文字颜色
              color: optionsSetup.textColorYRight,
              fontSize: optionsSetup.textFontSizeYRight,
              fontWeight: optionsSetup.textFontWeightYRight,
              fontStyle: optionsSetup.textFontStyleYRight,
              fontFamily: optionsSetup.textFontFamilyYRight,
            },
          },
          axisLine: {
            show: optionsSetup.isShowAxisLineYRight,
            lineStyle: {
              width: optionsSetup.lineWidthYRight,
              color: optionsSetup.lineColorYRight,
            },
          },
          axisTick: {
            // 刻度
            show: optionsSetup.isShowAxisLineYRight,
            lineStyle: {
              width: optionsSetup.lineWidthYRight,
              color: optionsSetup.lineColorYRight,
            }
          },
          splitLine: {
            show: optionsSetup.isShowSplitLineYRight,
            lineStyle: {
              color: optionsSetup.splitLineColorYRight,
              width: optionsSetup.splitLineFontWidthYRight,
            },
          },
        },
      ];
      this.options.yAxis = yAxis;
    },
    // 柱体设置 数值设置
    setOptionsBar() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      for (const key in series) {
        if (series[key].type == "bar") {
          series[key].barGap = optionsSetup.barGap + "%";
          series[key].label = {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.fontColor,
            fontWeight: optionsSetup.fontWeight,
            formatter: !!optionsSetup.percentSign ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyle,
            fontFamily: optionsSetup.fontFamily,
          };
          series[key].barWidth = optionsSetup.maxWidth;
          series[key].barMinHeight = optionsSetup.minHeight;
          series[key].itemStyle.barBorderRadius = optionsSetup.radius;
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
      }
      this.options.series = series;
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
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      let axis = [];
      let bar1 = [];
      let bar2 = [];
      for (const i in val) {
        axis[i] = val[i].axis;
        bar1[i] = val[i].bar1;
        bar2[i] = val[i].bar2;
      }
      // x轴
      this.options.xAxis.data = axis;
      // series
      series[0].data = bar1;
      series[1].data = bar2;

      const legendName = [];
      legendName.push("bar1");
      legendName.push("bar2");
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
      this.options.xAxis.data = val.xAxis;
      // series
      const series = this.options.series;
      const legendName = [];
      let k = 0;
      for (const i in val.series) {
        if (val.series[i].type == "bar") {
          series[k]['data'] = val.series[i].data;
          k++
          legendName.push(val.series[i].name);
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
