<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>

<script>
export default {
  name: "WidgetBarCompareChart",
  //参考 https://www.makeapie.com/editor.html?c=xOjLyozu2W
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
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
          x: 'center',
          textStyle: {
            color: '#ffffff',
          },
        },
        tooltip: {
          show: true,
          trigger: 'axis',
          axisPointer: {
            type: 'line',
            lineStyle: {
              color: 'ffffff',
              type: 'dashed',
            },
          },
          /*axisPointer: {
              type: 'cross',
              lineStyle: {
                  color: 'ffffff',
                  type: 'dashed',
              },
              crossStyle: {
                  color: 'ffffff',
              }
          },*/
        },
        //边距
        grid: [
          {// 上
            left: 30,
            right: 20,
            top: '60px',
            containLabel: true,
            bottom: '50%',
          },
          { // 下
            left: 30,
            containLabel: true,
            right: 20,
            top: '51%',
          },
        ],
        //图例
        legend: {
          textStyle: {
            color: '#fff',
            textAlign: 'center'
          },
          //itemGap:80,
          //itemWidth: 0
        },
        xAxis: [
          {//
            gridIndex: 0,
            show: true,
            type: 'category',
            boundaryGap: true, // 居中
            axisLine: { //x轴线
              show: true,
              lineStyle: {
                color: '#ffffff',
              }
            },
            axisTick: { // 刻度
              show: true,
            },
            axisLabel: { // X轴数据
              show: true,
              textStyle: {
                interval: 0,
                color: '#ffffff',
                fontSize: 14
              }
            },
            data: [],
          },
          {//
            gridIndex: 1,
            show: true,
            type: 'category',
            position: 'top',
            boundaryGap: true, // 居中
            axisLine: { // x轴线
              show: true,
              lineStyle: {
                color: '#ffffff',
              }
            },
            axisTick: { // 刻度
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
                color: '#ffffff',
                fontSize: 14,
              },
            },
            axisLine: { // 轴线
              show: true,
              lineStyle: {
                color: '#ffffff',
              },
            },
            splitLine: {
              show: false,
              lineStyle: {
                color: '#ffffff',
              },
            },
            axisPointer: {
              snap: true
            },
          },
          {
            gridIndex: 1,
            scale: false, // 是否从0开始
            inverse: true, // 翻转
            axisLabel: {
              show: true,
              textStyle: {
                color: '#ffffff',
                fontSize: 14,
              },
            },
            axisLine: { // 轴线
              show: true,
              lineStyle: {
                color: '#ffffff',
              },
            },
            splitLine: {
              show: false,
              lineStyle: {
                color: '#ffffff',
              },
            },
            axisPointer: {
              snap: true
            },
          },
        ],
        series: [
          {
            name: '',
            type: 'line',
            xAxisIndex: 0,
            yAxisIndex: 0,
            smooth: true, // 曲线，折线
            itemStyle: {
              color: '#36c5e7',
            },
            lineStyle: {
              color: '#36c5e7',
              width: 2,
            },
            label: {
              position: 'top',
              distance: 10,
              show: true,
              color: '#36c5e7',
              fontSize: 14,
            },
            data: [],
          },
          {
            name: '',
            type: 'line',
            xAxisIndex: 1,
            yAxisIndex: 1,
            smooth: true, // 曲线，折线
            itemStyle: {
              color: '#e68b55',
            },
            lineStyle: {
              color: '#e68b55',
              width: 2,
            },
            label: {
              position: 'bottom',
              distance: 10,
              show: true,
              color: '#e68b55',
              fontSize: 16,
            },
            data: [],
          },
        ]
      },
      optionsStyle: {},
      optionsData: {},
      optionsSetup: {},
      flagInter: null
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
        background: this.optionsSetup.background
      };
    }
  },
  watch: {
    value: {
      handler(val) {
        this.optionsStyle = val.position;
        this.optionsData = val.data;
        this.optionsSetup = val.setup;
        this.optionsSetup = val.setup;
        this.editorOptions();
      },
      deep: true
    }
  },
  mounted() {
    this.optionsStyle = this.value.position;
    this.optionsData = this.value.data;
    this.optionsCollapse = this.value.setup;
    this.optionsSetup = this.value.setup;
    this.editorOptions();
  },
  methods: {
    // 修改图标options属性
    editorOptions() {
      this.setOptionsTitle();
      this.setOptionsX();
      // this.setOptionsXRight();
      // this.setOptionsY();
      // this.setOptionsTop();
      // this.setOptionsTooltip();
      // this.setOptionsGrid();
      // this.setOptionsLegend();
      // this.setOptionsColor();
      this.setOptionsData();
    },
    // 标题修改
    setOptionsTitle() {
      const optionsCollapse = this.optionsSetup;
      const title = {};
      title.text = optionsCollapse.titleText;
      title.show = optionsCollapse.isNoTitle;
      title.left = optionsCollapse.textAlign;
      title.textStyle = {
        color: optionsCollapse.textColor,
        fontSize: optionsCollapse.textFontSize,
        fontWeight: optionsCollapse.textFontWeight
      };
      this.options.title = title;
    },
    // X轴设置
    setOptionsX() {
      const optionsSetup = this.optionsSetup;
      const xAxis0 = {
        gridIndex: 0,
        show: optionsSetup.isShowX,
        type: 'category',
        boundaryGap: optionsSetup.boundaryX, // 值居中
        axisLine: { //x轴线
          show: optionsSetup.lineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
          }
        },
        axisTick: { // 刻度
          show: optionsSetup.tickLineX,
        },
        axisLabel: { // X轴数据
          show: true,
          interval: optionsSetup.splitNumberX,
          textStyle: {
            color: optionsSetup.colorX,
            fontSize: optionsSetup.fontSizeX
          }
        },
      }
      const xAxis1 = {
        gridIndex: 1,
        show: optionsSetup.isShowX,
        type: 'category',
        position: 'top',
        boundaryGap: optionsSetup.boundaryX, // 值居中
        axisLine: { // x轴线
          show: optionsSetup.lineX,
          lineStyle: {
            color: optionsSetup.lineColorX,
          }
        },
        axisTick: { // 刻度
          show: optionsSetup.tickLineX,
        },
        axisLabel: {
          show: false,
          interval: optionsSetup.splitNumberX,
        },
      }
      this.options.xAxis[0] = xAxis0;
      this.options.xAxis[1] = xAxis1;
    },
    // 右X轴设置
    setOptionsXRight() {
      const optionsSetup = this.optionsSetup;
      const xAxisRight = {
        gridIndex: 2,
        splitNumber: optionsSetup.splitNumberRight,
        type: 'value',
        axisLine: {//X轴线
          show: optionsSetup.xLineRight,
          lineStyle: {
            color: optionsSetup.lineColorXRight,
          },
        },
        axisTick: {
          show: optionsSetup.tickLineRight,
        },
        position: 'bottom',
        axisLabel: { // x轴
          show: optionsSetup.hideXRight,
          textStyle: {
            color: optionsSetup.XcolorRight,
            fontSize: optionsSetup.fontSizeXRight
          }
        },
        splitLine: { // 分割线
          show: optionsSetup.SplitLineRight,
          lineStyle: {
            color: optionsSetup.SplitLineColorRight,
            width: optionsSetup.SplitLinefontSizeRight,
            type: 'solid'
          }
        }
      }
      this.options.xAxis[2] = xAxisRight;
    },
    // Y轴设置
    setOptionsY() {
      const optionsSetup = this.optionsSetup;
      const axisLine = {
        show: optionsSetup.lineY,
        lineStyle: {
          color: optionsSetup.lineColorY
        }
      };
      const axisTick = {
        show: optionsSetup.tickLineY
      };
      const axisLabel = {
        show: optionsSetup.hideY,
        textStyle: {
          align: optionsSetup.textAlign,
          color: optionsSetup.colorY,
          fontSize: optionsSetup.fontSizeY,
        }
      };
      this.options.yAxis[1]['axisLine'] = axisLine;
      this.options.yAxis[1]['axisTick'] = axisTick;
      this.options.yAxis[1]['axisLabel'] = axisLabel;
    },
    // 数值设定、柱体设置
    setOptionsTop() {
      const optionsSetup = this.optionsSetup;
      const series = this.options.series;
      for (const key in series) {
        if (series[key].type == "bar") {
          series[0].label = {
            normal: {
              show: optionsSetup.isShow,
              position: 'insideLeft',
              textStyle: {
                fontSize: optionsSetup.fontSize,
                color: optionsSetup.subTextColor,
                fontWeight: optionsSetup.fontWeight
              }
            },
            emphasis: {
              show: false,
            },
          },
            series[1].label = {
              normal: {
                show: optionsSetup.isShow,
                color: 'red',
                position: 'insideRight',
                textStyle: {
                  fontSize: optionsSetup.fontSize,
                  color: optionsSetup.subTextColor,
                  fontWeight: optionsSetup.fontWeight
                }
              },
              emphasis: {
                show: false,
              },
            },
            series[key].barWidth = optionsSetup.maxWidth;
        }
      }
      this.options.series = series;
    },
    // tooltip 提示语设置
    setOptionsTooltip() {
      const optionsSetup = this.optionsSetup;
      const tooltip = {
        trigger: "item",
        show: true,
        textStyle: {
          color: optionsSetup.lineColor,
          fontSize: optionsSetup.fontSize
        }
      };
      this.options.tooltip = tooltip;
    },
    // 边距设置
    getOptionsBottom() {
      const optionsSetup = this.optionsSetup;
      let bottom = optionsSetup.marginBottom;
      if (optionsSetup.hideXLeft) {
        bottom = optionsSetup.marginBottom + 15
      } else if (optionsSetup.hideXRight) {
        bottom = optionsSetup.marginBottom + 15
      }
      return bottom
    },
    setOptionsGrid() {
      const optionsSetup = this.optionsSetup;
      const grid = [
        {//左
          show: optionsSetup.frameLineLeft,
          left: optionsSetup.marginLeftRight,
          top: optionsSetup.marginTop,
          bottom: optionsSetup.marginBottom,
          containLabel: true,
          width: '40%'
        },
        {//中间字体位置
          show: false,
          left: "51%",
          top: optionsSetup.marginTop,
          bottom: this.getOptionsBottom(),
          width: '0%'
        },
        {//右
          show: optionsSetup.frameLineRight,
          right: optionsSetup.marginLeftRight,
          top: optionsSetup.marginTop,
          bottom: optionsSetup.marginBottom,
          containLabel: true,
          width: '40%'
        },
      ]
      this.options.grid = grid;
    },
    // 图例操作
    setOptionsLegend() {
      const optionsSetup = this.optionsSetup;
      const legend = this.options.legend;
      legend.show = optionsSetup.isShowLegend;
      legend.left = optionsSetup.lateralPosition;
      legend.top = optionsSetup.longitudinalPosition == "top" ? 0 : "auto";
      legend.bottom =
        optionsSetup.longitudinalPosition == "bottom" ? 0 : "auto";
      legend.orient = optionsSetup.layoutFront;
      legend.textStyle = {
        color: optionsSetup.lengedColor,
        fontSize: optionsSetup.lengedFontSize
      };
      legend.itemWidth = optionsSetup.lengedWidth;
    },
    // 颜色修改、圆角修改
    setOptionsColor() {
      const optionsSetup = this.optionsSetup;
      const customColor = optionsSetup.customColor;
      if (!customColor) return;
      const itemStyleLeft = {
        normal: {
          color: customColor[0].color,
          barBorderRadius: [optionsSetup.radius, 0, 0, optionsSetup.radius]
        },
        emphasis: {
          show: false,
        },
      }
      const itemStyleRight = {
        normal: {
          color: customColor[1].color,
          barBorderRadius: [0, optionsSetup.radius, optionsSetup.radius, 0]
        },
        emphasis: {
          show: false,
        },
      }
      this.options.series[0].itemStyle = itemStyleLeft;
      this.options.series[1].itemStyle = itemStyleRight;
    },
    // 数据解析
    setOptionsData() {
      const optionsSetup = this.optionsSetup;
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
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
      arr.forEach(item => {
        return newArr.includes(item) ? '' : newArr.push(item);
      });
      return newArr;
    },
    //静态数据
    staticDataFn(val) {
      //数据
      let xAxisList = [];
      let yAxisList = [];
      let arrayList = [];
      for (const i in val) {
        xAxisList[i] = val[i].axis
        yAxisList[i] = val[i].name
      }
      xAxisList = this.setUnique(xAxisList)
      yAxisList = this.setUnique(yAxisList)
      for (const i in yAxisList) {
        const data = new Array(yAxisList.length).fill(0)
        for (const j in xAxisList) {
          for (const k in val) {
            if (val[k].name == yAxisList[i]) {
              if (val[k].axis == xAxisList[j]) {
                data[j] = val[k].data
              }
            }
          }
        }
        arrayList.push({
          name: yAxisList[i],
          data: data
        })
      }
      this.options.series[0]['name'] = arrayList[0].name
      this.options.series[0]['data'] = arrayList[0].data
      this.options.series[1]['name'] = arrayList[1].name
      this.options.series[1]['data'] = arrayList[1].data
      this.options.xAxis[0]['data'] = xAxisList
      this.options.xAxis[1]['data'] = xAxisList
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
      data.then(res => {
        this.renderingFn(optionsSetup, res);
      });
    },
    renderingFn(optionsSetup, val) {
      this.options.yAxis[1]['data'] = val.xAxis
      if (val.series[0].type == "bar") {
        this.options.series[0]['name'] = val.series[0].name
        this.options.series[0]['data'] = val.series[0].data
        this.options.series[1]['name'] = val.series[1].name
        this.options.series[1]['data'] = val.series[1].data
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
