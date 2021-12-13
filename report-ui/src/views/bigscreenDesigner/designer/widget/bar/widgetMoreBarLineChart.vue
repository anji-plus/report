<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>

export default {
  //https://echarts.apache.org/examples/zh/editor.html?c=multiple-y-axis
  name: "widgetMoreBarLineChart",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          }
        },
        grid: {
          right: '20%'
        },
        legend: {
          data: ['Evaporation', 'Precipitation', 'Temperature']
        },
        xAxis: [
          {
            type: 'category',
            axisTick: {
              alignWithLabel: true
            },
            // prettier-ignore
            data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
          }
        ],
        yAxis: [
          {
            type: 'value',
            name: 'Evaporation',
            min: 0,
            max: 250,
            position: 'right',
            axisLine: {
              show: true,
              lineStyle: {
                color: '#5470C6'
              }
            },
            axisLabel: {
              formatter: '{value} ml'
            }
          },
          {
            type: 'value',
            name: 'Precipitation',
            min: 0,
            max: 250,
            position: 'right',
            offset: 80,
            axisLine: {
              show: true,
              lineStyle: {
                color: '#91CC75'
              }
            },
            axisLabel: {
              formatter: '{value} ml'
            }
          },
          {
            type: 'value',
            name: '温度',
            min: 0,
            max: 25,
            position: 'left',
            axisLine: {
              show: true,
              lineStyle: {
                color: '#EE6666'
              }
            },
            axisLabel: {
              formatter: '{value} °C'
            }
          }
        ],
        series: [
          {
            name: 'Evaporation',
            type: 'bar',
            data: [
              2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
            ]
          },
          {
            name: 'Precipitation',
            type: 'bar',
            yAxisIndex: 1,
            data: [
              2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
            ]
          },
          {
            name: 'Temperature',
            type: 'line',
            yAxisIndex: 2,
            data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
          }
        ]
      }
    }
  },
  computed: {
    styleObj() {
      return {
        position: this.ispreview ? "absolute" : "static",
        width: this.optionsStyle.width + "px",
        height: this.optionsStyle.height + "px",
        left: this.optionsStyle.left + "px",
        top: this.optionsStyle.top + "px",
        background: this.optionsSetup.background
      };
    }
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
      deep: true
    }
  },
  created() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.collapse;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      /*this.setOptionsX();
      this.setOptionsY();
      this.setOptionsTop();
      this.setOptionsBar();
      this.setOptionsTooltip();
      this.setOptionsData();
      this.setOptionsMargin();
      this.setOptionsLegend();
      this.setOptionsColor();*/
    },
    // 标题修改
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {};
      title.text = optionsSetup.titleText;
      title.show = optionsSetup.isNoTitle;
      title.left = optionsSetup.textAlign;
      title.textStyle = {
        color: optionsSetup.textColor,
        fontSize: optionsSetup.textFontSize,
        fontWeight: optionsSetup.textFontWeight
      };
      title.subtext = optionsSetup.subText;
      title.subtextStyle = {
        color: optionsSetup.subTextColor,
        fontWeight: optionsSetup.subTextFontWeight,
        fontSize: optionsSetup.subTextFontSize
      };

      this.options.title = title;
    },
    // X轴设置
    setOptionsX() {
      const optionsSetup = this.optionsSetup;
      const xAxis = {
        type: "category",
        show: optionsSetup.hideX, // 坐标轴是否显示
        name: optionsSetup.xName, // 坐标轴名称
        nameTextStyle: {
          color: optionsSetup.nameColorX,
          fontSize: optionsSetup.nameFontSizeX
        },
        nameRotate: optionsSetup.textAngle, // 文字角度
        inverse: optionsSetup.reversalX, // 轴反转
        axisLabel: {
          show: true,
          interval: optionsSetup.textInterval, // 文字间隔
          rotate: optionsSetup.textAngle, // 文字角度
          textStyle: {
            color: optionsSetup.Xcolor, // x轴 坐标文字颜色
            fontSize: optionsSetup.fontSizeX
          }
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsSetup.lineColorX
          }
        },
        splitLine: {
          show: optionsSetup.isShowSplitLineX,
          lineStyle: {
            color: optionsSetup.splitLineColorX
          }
        }
      };
      this.options.xAxis = xAxis;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const yAxis = [
        {
          type: "value",
          splitNumber: optionsSetup.splitNumberLeft,// 均分
          show: optionsSetup.isShowYLeft, // 坐标轴是否显示
          name: optionsSetup.textNameYLeft, // 坐标轴名称
          nameTextStyle: { // 别名
            color: optionsSetup.nameColorYLeft,
            fontSize: optionsSetup.namefontSizeYLeft
          },
          inverse: optionsSetup.reversalY, // 轴反转
          axisLabel: {
            show: true,
            textStyle: {
              color: optionsSetup.colorY, // y轴 坐标文字颜色
              fontSize: optionsSetup.fontSizeY
            }
          },
          axisLine: {
            show: true,
            lineStyle: {
              color: optionsSetup.lineColorY
            }
          },
          splitLine: {
            show: false,
          }
        },
        {
          type: "value",
          splitNumber: optionsSetup.splitNumberRight,// 均分
          show: optionsSetup.isShowYRight, // 坐标轴是否显示
          name: optionsSetup.textNameYRight, // 坐标轴名称
          nameTextStyle: { // 别名
            color: optionsSetup.nameColorYRight,
            fontSize: optionsSetup.namefontSizeYRight
          },
          inverse: optionsSetup.reversalY, // 轴反转
          axisLabel: {
            show: true,
            textStyle: {
              color: optionsSetup.colorY, // y轴 坐标文字颜色
              fontSize: optionsSetup.fontSizeY
            }
          },
          axisLine: {
            show: true,
            lineStyle: {
              color: optionsSetup.lineColorY
            }
          },
          splitLine: {
            show: false,
          }
        }
      ];
      this.options.yAxis = yAxis;
    },
    // 折线设置 数值设置
    setOptionsTop() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      for (const key in series) {
        if (series[key].type == "line") {
          series[key].showSymbol = optionsSetup.markPoint;
          series[key].symbolSize = optionsSetup.pointSize;
          series[key].smooth = optionsSetup.smoothCurve;
          if (optionsSetup.area) {
            series[key].areaStyle = {
              opacity: optionsSetup.areaThickness / 100
            };
          } else {
            series[key].areaStyle = {
              opacity: 0
            };
          }
          series[key].lineStyle = {
            width: optionsSetup.lineWidth
          };
          series[key].itemStyle.borderRadius = optionsSetup.radius;
          series[key].label = {
            show: optionsSetup.isShowLine,
            position: "top",
            distance: optionsSetup.distanceLine,
            fontSize: optionsSetup.fontSizeLine,
            color: optionsSetup.subTextColorLine,
            fontWeight: optionsSetup.fontWeightLine
          };
        }
      }
      this.options.series = series;
    },
    // 柱体设置 数值设置
    setOptionsBar() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      for (const key in series) {
        if (series[key].type == "bar") {
          series[key].label = {
            show: optionsSetup.isShowBar,
            position: "top",
            distance: optionsSetup.distanceBar,
            fontSize: optionsSetup.fontSizeBar,
            color: optionsSetup.subTextColorBar,
            fontWeight: optionsSetup.fontWeightBar
          };
          series[key].barWidth = optionsSetup.maxWidth;
          series[key].barMinHeight = optionsSetup.minHeight;
          series[key].itemStyle.barBorderRadius = optionsSetup.radius;
        }
      }
      this.options.series = series;
    },
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: true,
        textStyle: {
          color: optionsSetup.lineColor,
          fontSize: optionsSetup.tipFontSize
        }
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
        containLabel: true
      };
      this.options.grid = grid;
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
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const series = this.options.series;
      let axis = [];
      let bar = [];
      let line = [];
      for (const i in val) {
        axis[i] = val[i].axis;
        bar[i] = val[i].bar;
        line[i] = val[i].line;
      }
      // x轴
      this.options.xAxis.data = axis;
      // series
      for (const i in series) {
        if (series[i].type == "bar") {
          series[i].data = bar;
        } else {
          series[i].data = line;
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
      data.then(res => {
        this.renderingFn(res);
      });
    },
    renderingFn(val) {
      this.options.xAxis.data = val.xAxis;
      // series
      const series = this.options.series;
      for (const i in series) {
        for (const j in val.series) {
          if (series[i].type == val.series[j].type) {
            series[i].data = val.series[j].data;
          }
        }
      }
    }
  }
};

</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
