<template>
  <div :style="styleObj">
    <v-chart ref="myVChart" :options="options" autoresize/>
  </div>
</template>

<script>
import {targetWidgetLinkageLogic} from "@/views/bigscreenDesigner/designer/linkageLogic";

import echarts from "echarts";

export default {
  name: "widgetMoreBarLineChart",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      options: {
        tooltip: {
          trigger: "item",
          axisPointer: {
            type: "shadow",
          },
        },
        grid: {
          left: "2%",
          right: "4%",
          bottom: "14%",
          top: "16%",
          containLabel: true,
        },
        legend: {},
        xAxis: {
          type: "category",
          data: [
            "2012",
            "2013",
            "2014",
            "2015",
            "2016",
            "2017",
            "2018",
            "2019",
          ],
          axisLine: {
            lineStyle: {
              color: "#cdd5e2",
            },
          },
          axisLabel: {
            textStyle: {
              color: "#666666",
            },
          },
        },
        yAxis: [
          {
            type: "value",
            axisLine: {
              show: true,
              lineStyle: {
                color: "#cdd5e2",
              },
            },
            splitLine: {
              show: false,
            },
            axisLabel: {
              textStyle: {
                color: "#666666",
              },
            },
          },
          {
            type: "value",
            nameTextStyle: {
              color: "#666666",
            },
            axisLine: {
              lineStyle: {
                color: "#cdd5e2",
              },
            },
            splitLine: {
              show: false,
            },
            axisLabel: {
              show: true,
              textStyle: {
                color: "#666666",
              },
            },
          },
        ],
        series: [
          {
            name: "调解成功",
            type: "bar",
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                  {
                    offset: 0,
                    color: "#29acff",
                  },
                  {
                    offset: 1,
                    color: "#4bdfff",
                  },
                ]),
                barBorderRadius: 6,
              },
            },
            data: [],
          },
          {
            name: "调解失败",
            type: "bar",
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                  {
                    offset: 0,
                    color: "#3d93f2",
                  },
                  {
                    offset: 1,
                    color: "#5dc1fd",
                  },
                ]),
                barBorderRadius: 6,
              },
            },
            data: [],
          },
          {
            name: "调解成功率",
            type: "line",
            yAxisIndex: 1, //使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用
            smooth: false, //平滑曲线显示
            symbol: "circle", //标记的图形为实心圆
            symbolSize: 8, //标记的大小
            /*itemStyle: {
              normal: {
                color: '#ffa43a',
                borderColor: 'rgba(255, 234, 0, 0.5)',  //圆点透明 边框
                borderWidth: 5
              },
            },*/
            lineStyle: {
              color: "#ffa43a",
            },
            data: [],
          },
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
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
    //获取堆叠样式
    getStackStyle() {
      const optionsSetup = this.optionsSetup;
      let style = "";
      if (optionsSetup.stackStyle == "upDown") {
        style = "total";
      }
      return style;
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
      //颜色
      const customColor = optionsSetup.customColor;
      const arrColor = [];
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color);
      }
      const series = this.options.series;
      let axis = [];
      let bar1 = [];
      let bar2 = [];
      let line = [];
      for (const i in val) {
        axis[i] = val[i].date;
        bar1[i] = val[i].unsales;
        bar2[i] = val[i].manus;
        line[i] = val[i].sales;
      }
      const legendName = [];
      legendName.push("调解成功");
      legendName.push("调解失败");
      legendName.push("调解成功率");
      // x轴
      this.options.xAxis.data = axis;
      // series
      for (const i in series) {
        if (series[i].type == "bar") {
          series[i].name = legendName[i];
          series[i].type = "bar";
          series[i].barGap = optionsSetup.barGap + "%";
          series[i].barMinHeight = optionsSetup.minHeight;
          series[i].stack = this.getStackStyle();
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
          series[i].barWidth = optionsSetup.maxWidth;
          series[i].itemStyle.normal["barBorderRadius"] = optionsSetup.radius;
          series[i].itemStyle.normal["color"] = arrColor[i];
        } else if (series[i].type == "line") {
          series[i].name = legendName[i];
          series[i].type = "line";
          series[i].yAxisIndex = 1;
          series[i].symbol = optionsSetup.symbol;
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
          series[i].itemStyle = {
            normal: {
              color: arrColor[i],
            },
          };
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
      series[0].data = bar1;
      series[1].data = bar2;
      series[2].data = line;
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
        if (val.series[i].type == "bar") {
          obj.name = val.series[i].name;
          obj.type = val.series[i].type;
          obj.barGap = optionsSetup.barGap + "%";
          obj.barMinHeight = optionsSetup.minHeight;
          obj.stack = this.getStackStyle();
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
          obj.barWidth = optionsSetup.maxWidth;
          obj.itemStyle = {
            normal: {
              color: arrColor[i],
              barBorderRadius: optionsSetup.radius,
            },
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
          obj.data = val.series[i].data;
          series.push(obj);
        } else if (val.series[i].type == "line") {
          obj.name = val.series[i].name;
          obj.type = val.series[i].type;
          obj.yAxisIndex = 1;
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
          obj.itemStyle = {
            normal: {
              color: arrColor[i],
            },
          };
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

<style scoped lang='scss'>
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
