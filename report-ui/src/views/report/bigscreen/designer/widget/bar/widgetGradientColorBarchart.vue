<template>
  <div :style="styleObj">
    <v-chart :options="options"
             autoresize />
  </div>
</template>

<script>
import echarts from 'echarts';
export default {
  name: 'WidgetGradientColorBarchart',  //渐变色，参考https://www.makeapie.com/editor.html?c=x0oZWoncE
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data () {
    return {
      options: {
        // backgroundColor: '#00265f',
        "title": {
          "text": "政策补贴额度",
          x: "center",
          y: "4%",
          textStyle: {
            color: '#fff',
            fontSize: '22'
          },
          subtextStyle: {
            color: '#90979c',
            fontSize: '16',

          },
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          top: '15%',
          right: '3%',
          left: '5%',
          bottom: '12%'
        },
        legend: {
          textStyle: {
            color: '#fff',
          },
        },
        xAxis: {
          type: 'category',
          data: ['制造业', '建筑业', '农林牧渔', '房地产', '金融业', '居民服务及其他'],
          axisLine: {
            lineStyle: {
              color: 'rgba(255,255,255,0.12)'
            }
          },
          axisLabel: {
            margin: 10,
            color: '#e2e9ff',
            textStyle: {
              fontSize: 14
            },
          },
        },
        yAxis: {
          name: '单位：万元',
          axisLabel: {
            formatter: '{value}',
            color: '#e2e9ff',
          },
          axisLine: {
            show: false,
            lineStyle: {
              color: 'rgba(255,255,255,0)'
            }
          },
          splitLine: {
            lineStyle: {
              color: 'rgba(255,255,255,0.12)'
            }
          }
        },
        series: [{
          type: 'bar',
          data: [5000, 2600, 1300, 1300, 1250, 1500],
          barWidth: '20px',
          itemStyle: {
            normal: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: 'rgba(0,244,255,1)' // 0% 处的颜色
              }, {
                offset: 1,
                color: 'rgba(0,77,167,1)' // 100% 处的颜色
              }], false),
              barBorderRadius: [30, 30, 30, 30],
              shadowColor: 'rgba(0,160,221,1)',
              shadowBlur: 4,
            }
          },
          label: {
            normal: {
              show: true,
              lineHeight: 30,
              width: 80,
              height: 30,
              backgroundColor: 'rgba(0,160,221,0.1)',
              borderRadius: 200,
              position: ['-8', '-60'],
              distance: 1,
              formatter: [
                '    {d|●}',
                ' {a|{c}}     \n',
                '    {b|}'
              ].join(','),
              rich: {
                d: {
                  color: '#3CDDCF',
                },
                a: {
                  color: '#fff',
                  align: 'center',
                },
                b: {
                  width: 1,
                  height: 30,
                  borderWidth: 1,
                  borderColor: '#234e6c',
                  align: 'left'
                },
              }
            }
          }
        }]
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsSetup: {},
    }
  },
  computed: {
    styleObj () {
      return {
        position: this.ispreview ? 'absolute' : 'static',
        width: this.optionsStyle.width + 'px',
        height: this.optionsStyle.height + 'px',
        left: this.optionsStyle.left + 'px',
        top: this.optionsStyle.top + 'px',
        background: this.optionsSetup.background,
      }
    },
  },
  watch: {
    value: {
      handler (val) {
        console.log(val)
        this.optionsStyle = val.position
        this.optionsData = val.data
        this.optionsCollapse = val.setup
        this.optionsSetup = val.setup
        this.editorOptions()
      },
      deep: true,
    },
  },
  mounted () {
    this.optionsStyle = this.value.position
    this.optionsData = this.value.data
    this.optionsCollapse = this.value.setup
    this.optionsSetup = this.value.setup
    this.editorOptions()
  },
  methods: {
    // 修改图标options属性
    editorOptions () {
      this.setOptionsTitle()
      this.setOptionsX()
      this.setOptionsY()
      // this.setOptionsTop()
      // this.setOptionsTooltip()
      this.setOptionsMargin()
      // this.setOptionsLegend()
      this.setOptionsColor()
      this.setOptionsData()
    },
    // 标题修改
    setOptionsTitle () {
      const optionsCollapse = this.optionsSetup
      const title = {}
      title.text = optionsCollapse.titleText
      title.show = optionsCollapse.isNoTitle
      title.left = optionsCollapse.textAlign
      title.textStyle = {
        color: optionsCollapse.textColor,
        fontSize: optionsCollapse.textFontSize,
        fontWeight: optionsCollapse.textFontWeight,
      }
      title.subtext = optionsCollapse.subText
      title.subtextStyle = {
        color: optionsCollapse.subTextColor,
        fontWeight: optionsCollapse.subTextFontWeight,
        fontSize: optionsCollapse.subTextFontSize,
      }

      this.options.title = title
    },
    // X轴设置
    setOptionsX () {
      const optionsCollapse = this.optionsSetup
      const xAxis = {
        type: 'category',
        show: optionsCollapse.hideX, // 坐标轴是否显示
        name: optionsCollapse.xName, // 坐标轴名称
        nameTextStyle: {
          color: optionsCollapse.xNameColor,
          fontSize: optionsCollapse.xNameFontSize,
        },
        nameRotate: optionsCollapse.textAngle, // 文字角度
        inverse: optionsCollapse.reversalX, // 轴反转
        axisLabel: {
          show: true,
          interval: optionsCollapse.textInterval, // 文字角度
          rotate: optionsCollapse.textAngle, // 文字角度
          textStyle: {
            color: optionsCollapse.Xcolor, // x轴 坐标文字颜色
            fontSize: optionsCollapse.fontSizeX,
          },
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsCollapse.lineColorX,
          },
        },
      }
      this.options.xAxis = xAxis
    },
    // Y轴设置
    setOptionsY () {
      const optionsCollapse = this.optionsSetup
      const yAxis = {
        type: 'value',
        show: optionsCollapse.isShowY, // 坐标轴是否显示
        name: optionsCollapse.textNameY, // 坐标轴名称
        nameTextStyle: {
          color: optionsCollapse.NameColorY,
          fontSize: optionsCollapse.NameFontSizeY,
        },
        inverse: optionsCollapse.reversalY, // 轴反转
        axisLabel: {
          show: true,
          textStyle: {
            color: optionsCollapse.colorY, // x轴 坐标文字颜色
            fontSize: optionsCollapse.fontSizeY,
          },
        },
        splitLine: {
          show: false,
        },
        axisLine: {
          show: true,
          lineStyle: {
            color: optionsCollapse.lineColorY,
          },
        },
      }

      this.options.yAxis = yAxis
    },
    // 数值设定 or 柱体设置
    setOptionsTop () {
      const optionsCollapse = this.optionsSetup
      const series = this.options.series

      for (const key in series) {
        if (series[key].type == 'bar') {
          series[key].label = {
            show: optionsCollapse.isShow,
            position: 'top',
            distance: 10,
            fontSize: optionsCollapse.fontSize,
            color: optionsCollapse.subTextColor,
            fontWeight: optionsCollapse.fontWeight,
          }
          series[key].barWidth = optionsCollapse.maxWidth
          series[key].barMinHeight = optionsCollapse.minHeight
        }
      }
      this.options.series = series
    },
    // tooltip 设置
    setOptionsTooltip () {
      const optionsCollapse = this.optionsSetup
      const tooltip = {
        trigger: 'item',
        show: true,
        textStyle: {
          color: optionsCollapse.lineColor,
          fontSize: optionsCollapse.fontSize,
        },
      }
      this.options.tooltip = tooltip
    },
    // 边距设置
    setOptionsMargin () {
      const optionsCollapse = this.optionsSetup
      const grid = {
        left: optionsCollapse.marginLeft,
        right: optionsCollapse.marginRight,
        bottom: optionsCollapse.marginBottom,
        top: optionsCollapse.marginTop,
        containLabel: true,
      }
      this.options.grid = grid
    },
    // 图例操作 legend
    setOptionsLegend () {
      const optionsCollapse = this.optionsSetup
      const legend = this.options.legend
      legend.show = optionsCollapse.isShowLegend
      legend.left = optionsCollapse.lateralPosition == 'left' ? 0 : 'auto'
      legend.right = optionsCollapse.lateralPosition == 'right' ? 0 : 'auto'
      legend.top = optionsCollapse.longitudinalPosition == 'top' ? 0 : 'auto'
      legend.bottom = optionsCollapse.longitudinalPosition == 'bottom' ? 0 : 'auto'
      legend.orient = optionsCollapse.layoutFront
      legend.textStyle = {
        color: optionsCollapse.lengedColor,
        fontSize: optionsCollapse.fontSize,
      }
      legend.itemWidth = optionsCollapse.lengedWidth
    },
    // 渐变色
    setOptionsColor () {
      const optionsCollapse = this.optionsSetup
      const barStart = {}
      barStart['offset'] = 0
      barStart['color'] = optionsCollapse.barStart
      const barEnd = {}
      barStart['offset'] = 1
      barStart['color'] = optionsCollapse.barEnd
      // this.options.series[0].itemStyle.normal.color = new echarts.graphic.LinearGradient(0, 0, 0, 1,[ barStart, barEnd], false)

    },
    // 数据解析
    setOptionsData () {
      const optionsSetup = this.optionsSetup
      console.log(optionsSetup)
      const optionsData = this.optionsData // 数据类型 静态 or 动态
      console.log(optionsData)
      optionsData.dataType == 'staticData' ? this.staticDataFn(optionsData.staticData, optionsSetup) : this.dynamicDataFn(optionsData.dynamicData, optionsSetup)
    },
    // 静态数据
    staticDataFn (val, optionsSetup) {
      const staticData = JSON.parse(val)
      // x轴
      if (optionsSetup.verticalShow) {
        this.options.xAxis.data = []
        this.options.yAxis.data = staticData.categories
        this.options.xAxis.type = 'value'
        this.options.yAxis.type = 'category'
      } else {
        this.options.xAxis.data = staticData.categories
        this.options.yAxis.data = []
        this.options.xAxis.type = 'category'
        this.options.yAxis.type = 'value'
      }
      // series
      const series = this.options.series
      for (const i in series) {
        if (series[i].type == 'bar') {
          series[i].data = staticData.series[0].data
        }
      }
    },
    // 动态数据
    dynamicDataFn (val, optionsSetup) {
      console.log(val)
      if (!val) return
      // x轴
      if (optionsSetup.verticalShow) {
        this.options.xAxis.data = []
        this.options.yAxis.data = val.xAxis
        this.options.xAxis.type = 'value'
        this.options.yAxis.type = 'category'
      } else {
        this.options.xAxis.data = val.xAxis
        this.options.yAxis.data = []
        this.options.xAxis.type = 'category'
        this.options.yAxis.type = 'value'
      }

      // series
      const series = this.options.series
      for (const i in series) {
        if (series[i].type == 'bar') {
          series[i].data = val.series[i].data
        }
      }
    },
  },
}
</script>

<style scoped lang="scss">
.echarts {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
