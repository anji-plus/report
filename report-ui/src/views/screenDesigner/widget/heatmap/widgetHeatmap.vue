<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>
export default {
  name: "widgetHeatmap",
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
        tooltip: {
          position: "top",
          show: true,
          textStyle: {},
        },
        grid: {
          height: "90%",
          width: "90%",
          top: 10,
          left: 20,
        },
        xAxis: {
          name: "",
          type: "category",
          axisLabel: {
            show: true,
            color: "#0f0",
          },
          data: [],
          splitArea: {
            show: false,
          },
          nameTextStyle: {
            color: "",
            fontSize: 14,
          },
        },
        yAxis: {
          name: "",
          type: "category",
          axisLabel: {
            show: true,
            color: "#0f0",
          },
          data: [],
          splitArea: {
            show: false,
          },
          nameTextStyle: {
            color: "",
            fontSize: 14,
          },
        },
        visualMap: {
          show: true,
          min: 0,
          max: 5000,
          calculable: true,
          orient: "horizontal",
          left: "center",
          bottom: 0,
          inRange: {
            color: [],
          },
          textStyle: {
            fontSize: 14,
            color: "#fff",
          },
        },
        series: [
          {
            name: "",
            type: "heatmap",
            data: [],
            label: {
              show: false,
              fontSize: 16,
            },
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
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
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsX();
      this.setOptionsY();
      this.setOptionsSeries();
      this.setOptionsMargin();
      this.setOptionsVisualMap();
      this.setOptionsData();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsSetup = this.optionsSetup;
      const title = {
        text: optionsSetup.titleText,
        show: optionsSetup.isNoTitle,
        left: optionsSetup.textAlign,
        textStyle: {
          color: optionsSetup.textColor,
          fontSize: optionsSetup.textFontSize,
          fontWeight: optionsSetup.textFontWeight
        },
        subtext: optionsSetup.subText,
        subtextStyle: {
          color: optionsSetup.subTextColor,
          fontWeight: optionsSetup.subTextFontWeight,
          fontSize: optionsSetup.subTextFontSize
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
        name: optionsSetup.xName,
        nameTextStyle: {
          color: optionsSetup.xNameColor,
          fontSize: optionsSetup.xNameFontSize
        },
        // 轴反转
        inverse: optionsSetup.reversalX,
        axisLabel: {
          show: true,
          // 文字间隔
          interval: optionsSetup.textInterval,
          // 文字角度
          rotate: optionsSetup.textAngleX,
          textStyle: {
            // 坐标文字颜色
            color: optionsSetup.Xcolor,
            fontSize: optionsSetup.fontSizeX
          }
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsSetup.lineColorX
          }
        },
        splitArea: {
          show: false,
        },
      };
      this.options.xAxis = xAxis;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const yAxis = {
        type: "category",
        // 坐标轴是否显示
        show: optionsSetup.isShowY,
        // 坐标轴名称
        name: optionsSetup.textNameY,
        nameTextStyle: {
          color: optionsSetup.NameColorY,
          fontSize: optionsSetup.NameFontSizeY
        },
        // y轴反转
        inverse: optionsSetup.reversalY,
        axisLabel: {
          show: true,
          // 文字角度
          rotate: optionsSetup.textAngleY,
          textStyle: {
            // 坐标文字颜色
            color: optionsSetup.colorY,
            fontSize: optionsSetup.fontSizeY
          }
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsSetup.lineColorY
          }
        },
        splitArea: {
          show: false,
        },
      };
      this.options.yAxis = yAxis;
    },
    // 数值设定
    setOptionsSeries() {
      const optionsSetup = this.optionsSetup;
      const lable = {
        show: optionsSetup.isShow,
        textStyle: {
          fontSize: optionsSetup.fontSize,
          color: optionsSetup.subTextColor,
          fontWeight: optionsSetup.fontWeight
        }
      }
      this.options.series[0].label = lable;
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
    // tooltip 设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        position: "top",
        show: true,
        textStyle: {
          color: optionsSetup.lineColor,
          fontSize: optionsSetup.tipsLineColor
        }
      };
      this.options.tooltip = tooltip;
    },
    // 图设置
    setOptionsVisualMap() {
      const optionsSetup = this.optionsSetup;
      const visualMap = this.options.visualMap;
      visualMap.show = optionsSetup.isShowLegend;
      visualMap.min = optionsSetup.dataMin;
      visualMap.max = optionsSetup.dataMax;
      visualMap.textStyle = {
        fontSize : optionsSetup.lengedFontSize,
        color : optionsSetup.lengedColor
      };
      visualMap.inRange.color = optionsSetup.lengedColorList.map((x) => {
        return x.color;
      });
      visualMap.left = optionsSetup.lateralPosition;
      visualMap.top = optionsSetup.longitudinalPosition;
      visualMap.bottom = optionsSetup.longitudinalPosition;
      visualMap.orient = optionsSetup.layoutFront;
      visualMap.itemWidth = optionsSetup.lengedWidth;
    },
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    //去重
    setUnique(arr) {
      let newArr = [];
      arr.forEach(item => {
        return newArr.includes(item) ? '' : newArr.push(item);
      });
      return newArr;
    },
    staticDataFn(val) {
      const data = [];
      let xAxisList = [];
      let yAxisList = [];
      for (const i in val) {
        xAxisList[i] = val[i].axis;
        yAxisList[i] = val[i].yaxis;
        data[i] = [val[i].axis,val[i].yaxis,val[i].num]
      }
      xAxisList = this.setUnique(xAxisList);
      yAxisList = this.setUnique(yAxisList);
      this.options.xAxis.data = xAxisList;
      this.options.yAxis.data = yAxisList;
      this.options.series[0].data = data;
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
      this.options.xAxis.data = val.xAxis;
      this.options.yAxis.data = val.yAxis;
      this.options.series[0].data = val.series;
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
