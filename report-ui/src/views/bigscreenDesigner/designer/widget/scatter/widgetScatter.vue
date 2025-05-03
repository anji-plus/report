<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :option="options" autoresize v-if="show"/>
  </div>
</template>

<script>
import {
  originWidgetLinkageLogic,
  targetWidgetLinkageLogic,
} from "@/views/bigscreenDesigner/designer/linkageLogic";

export default {
  name: "widgetScatter",
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
      options: {
        grid: {},
        legend: {
          textStyle: {
            color: "#fff",
          },
        },
        xAxis: {
          type: "category",
          data: [],
          axisLabel: {
            show: true,
            textStyle: {
              color: "#fff",
            },
          },
        },
        yAxis: {
          type: "value",
          data: [],
          axisLabel: {
            show: true,
            textStyle: {
              color: "#fff",
            },
          },
        },
        series: [
          {
            data: [],
            symbolSize: 10,
            type: "scatter",
          },
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsSetup: {},
      flagInter: null,
      show:true
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
    optionsData(){
      // this.show=false;
      // this.$nextTick(()=>{
      //   this.show=true
      // })
    }
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
      this.setOptionsX();
      this.setOptionsY();
      this.setOptionsLegend();
      this.setOptionsTooltip();
      this.setOptionsMargin();
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
      const xAxis = {
        type: "category",
        // 坐标轴是否显示
        show: optionsSetup.hideX,
        // 坐标轴名称
        name: optionsSetup.nameX,
        nameTextStyle: {
          color: optionsSetup.nameColorX,
          fontSize: optionsSetup.nameFontSizeX,
        },
        // 轴反转
        inverse: optionsSetup.reversalX,
        axisLabel: {
          show: true,
          interval: optionsSetup.textInterval,
          // 文字角度
          rotate: optionsSetup.textAngleX,
          textStyle: {
            // 坐标文字颜色
            color: optionsSetup.colorX,
            fontSize: optionsSetup.fontSizeX,
          },
        },
        axisLine: {
          show: true,
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
      const yAxis = {
        max: optionsSetup.maxY !== "" ? optionsSetup.maxY : null,
        min: optionsSetup.minY !== "" ? optionsSetup.minY : null,
        type: "value",
        scale: optionsSetup.scale,
        // 均分
        splitNumber: optionsSetup.splitNumberY,
        // 坐标轴是否显示
        show: optionsSetup.isShowY,
        // 坐标轴名称
        name: optionsSetup.textNameY,
        nameTextStyle: {
          color: optionsSetup.nameColorY,
          fontSize: optionsSetup.nameFontSizeY,
        },
        // 轴反转
        inverse: optionsSetup.reversalY,
        axisLabel: {
          show: true,
          // 文字角度
          rotate: optionsSetup.textAngleY,
          textStyle: {
            // 坐标文字颜色
            color: optionsSetup.colorY,
            fontSize: optionsSetup.fontSizeY,
          },
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsSetup.lineColorY,
            width: optionsSetup.lineWidthY,
          },
        },
        splitLine: {
          show: optionsSetup.isShowSplitLineY,
          lineStyle: {
            color: optionsSetup.splitLineColorY,
            width: optionsSetup.splitLineWidthY,
          },
        },
      };
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
    // 图例
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
        // this.options.series =  optionsData.series
      // 联动接收者逻辑结束
      optionsData.dataType === "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.refreshTime);
    },
    // 静态数据
    staticDataFn(val) {
      const optionsSetup = this.optionsSetup;
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      const series = this.options.series;
      let axis = [];
      let data = [];
      for (const i in val) {
        axis[i] = val[i].axis;
        data[i] = val[i].data;
      }
      const legendName = [];
      legendName.push("scatter");
      for (const i in series) {
        if (series[i].type === "scatter") {
          series[i].type = "scatter";
          series[i].symbol = optionsSetup.symbol;
          series[i].symbolSize = optionsSetup.pointSize;
          series[i].label = {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.dataColor === '' ? "inherit" : optionsSetup.dataColor,
            fontWeight: optionsSetup.fontWeight,
            formatter: !!optionsSetup.percentSign ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyle,
            fontFamily: optionsSetup.fontFamily,
          };
          // 获取颜色样式
          if (optionsSetup.colorStyle === 'same') {
            series[i].itemStyle = {
              normal: {
                color: arrColor[i],
              },
            };
          } else {
            series[i].itemStyle = {
              normal: {
                color: (params) => {
                  return arrColor[params.dataIndex];
                },
              },
            };
          }
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
          series[i].data = data;
        }
      }
      // 根据图表的宽度 x轴的字体大小、长度来估算X轴的label能展示多少个字
      const rowsNum = optionsSetup.textRowsNum !== "" ? optionsSetup.textRowsNum : parseInt((this.optionsStyle.width / axis.length) / optionsSetup.fontSizeX)
      const axisLabel = {
        show: true,
        interval: optionsSetup.textInterval,
        // 文字角度
        rotate: optionsSetup.textAngleX,
        textStyle: {
          // 坐标文字颜色
          color: optionsSetup.colorX,
          fontSize: optionsSetup.fontSizeX,
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
      };
      // x轴
      this.options.xAxis.data = axis;
      if (optionsSetup.textRowsBreakAuto) {
        this.options.xAxis.axisLabel = axisLabel;
      }
      this.options.legend["data"] = legendName;
      this.setOptionsLegendName(legendName);
    },
    // 动态数据
    dynamicDataFn(refreshTime) {
      const optionsSetup = this.optionsSetup;
      const optionsData = this.optionsData;
      const val = optionsData.dynamicData;
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
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      const series = [];
      const legendName = [];
      for (const i in val.series) {
        legendName.push(val.series[i].name);
        const obj = {};
        if (val.series[i].type === "scatter") {
          obj.type = "scatter";
          obj.symbol = optionsSetup.symbol;
          obj.symbolSize = optionsSetup.pointSize;
          obj.label = {
            show: optionsSetup.isShow,
            position: optionsSetup.fontPosition,
            distance: optionsSetup.fontDistance,
            fontSize: optionsSetup.fontSize,
            color: optionsSetup.dataColor === '' ? "inherit" : optionsSetup.dataColor,
            fontWeight: optionsSetup.fontWeight,
            formatter: !!optionsSetup.percentSign ? '{c}%' : '{c}',
            fontStyle: optionsSetup.fontStyle,
            fontFamily: optionsSetup.fontFamily,
          };
          // 获取颜色样式
          if (optionsSetup.colorStyle === 'same') {
            obj.itemStyle = {
              normal: {
                color: arrColor[i],
              },
            };
          } else {
            obj.itemStyle = {
              normal: {
                color: (params) => {
                  return arrColor[params.dataIndex];
                },
              },
            };
          }
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
          }
          obj.data = val.series[i].data;
          series.push(obj);
        }
      }
      // 根据图表的宽度 x轴的字体大小、长度来估算X轴的label能展示多少个字
      const xAxisDataLength = val.length !== 0 ? val.xAxis.length : 1;
      const rowsNum = optionsSetup.textRowsNum !== "" ? optionsSetup.textRowsNum : parseInt((this.optionsStyle.width / xAxisDataLength) / optionsSetup.fontSizeX);
      const axisLabel = {
        show: true,
        interval: optionsSetup.textInterval,
        // 文字角度
        rotate: optionsSetup.textAngleX,
        textStyle: {
          // 坐标文字颜色
          color: optionsSetup.colorX,
          fontSize: optionsSetup.fontSizeX,
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
      };
      // x轴
      this.options.xAxis.data = val.xAxis;
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
