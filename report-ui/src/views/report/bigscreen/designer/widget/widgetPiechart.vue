<template>
  <div :style="styleObj">
    <v-chart :options="options"
             autoresize />
  </div>
</template>

<script>
export default {
  name: 'WidgetPiechart',
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data () {
    return {
      options: {
        title: {
          text: '某站点用户访问来源',
          left: 'center',
          textStyle: {
            color: '#fff',
          },
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          textStyle: {
            color: '#fff',
          },
        },
        series: [
          {
            type: 'pie',
            radius: '50%',
            data: [],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
              },
            },
          },
        ],
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
      optionsCollapse: {}, // 图标属性
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
      }
    },
  },
  watch: {
    value: {
      handler (val) {
        this.optionsStyle = val.position
        this.optionsData = val.data
        this.optionsCollapse = val.collapse
        this.editorOptions()
      },
      deep: true,
    },
  },
  created () {
    this.optionsStyle = this.value.position
    this.optionsData = this.value.data
    this.optionsCollapse = this.value.collapse
    this.editorOptions()
  },
  methods: {
    // 修改图标options属性
    editorOptions () {
      this.setOptionsTitle()
      this.setOptionsValue()
      this.setOptionsTooltip()
      this.setOptionsLegend()
      this.setOptionsColor()
      this.setOptionsData()
    },
    // 标题设置
    setOptionsTitle () {
      const optionsCollapse = this.optionsCollapse
      const title = {}
      title.show = optionsCollapse.isNoTitle
      title.text = optionsCollapse.titleText
      title.textAlign = optionsCollapse.textAlign
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
    // 数值设定
    setOptionsValue () {
      const optionsCollapse = this.optionsCollapse
      const series = this.options.series
      const numberValue = optionsCollapse.numberValue ? '{c}' : ''
      const percentage = optionsCollapse.percentage ? '({d})%' : ''
      const label = {
        show: optionsCollapse.isShow,
        formatter: `{a|{b}：${numberValue} ${percentage}}`,
        rich: {
          a: {
            padding: [-30, 15, -20, 15],
            color: optionsCollapse.subTextColor,
            fontSize: optionsCollapse.fontSize,
            fontWeight: optionsCollapse.fontWeight,
          },
        },
        fontSize: optionsCollapse.fontSize,

        fontWeight: optionsCollapse.optionsCollapse,
      }
      for (const key in series) {
        if (series[key].type == 'pie') {
          series[key].label = label
          series[key].labelLine = { show: optionsCollapse.isShow }
        }
      }
    },
    // 提示语设置 tooltip
    setOptionsTooltip () {
      const optionsCollapse = this.optionsCollapse
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
    // 图例操作 legend
    setOptionsLegend () {
      const optionsCollapse = this.optionsCollapse
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
    // 图例颜色修改
    setOptionsColor () {
      const optionsCollapse = this.optionsCollapse
      const customColor = optionsCollapse.customColor
      if (!customColor) return
      let arrColor = []
      for (let i = 0; i < customColor.length; i++) {
        arrColor.push(customColor[i].color)
      }
      this.options.color = arrColor
      this.options = Object.assign({}, this.options)
    },
    setOptionsData () {
      const optionsData = this.optionsData // 数据类型 静态 or 动态
      optionsData.dataType == 'staticData' ? this.staticDataFn(optionsData.staticData) : this.dynamicDataFn(optionsData.dynamicData)
    },
    staticDataFn (val) {
      const staticData = JSON.parse(val)
      for (let key in this.options.series) {
        if (this.options.series[key].type == 'pie') {
          this.options.series[key].data = staticData
        }
      }
    },
    dynamicDataFn (val) {
      if (!val) return
      for (let key in this.options.series) {
        if (this.options.series[key].type == 'pie') {
          this.options.series[key].data = val
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
  min-width: 200px;
  min-height: 200px;
  overflow: hidden;
}
</style>
