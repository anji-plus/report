<template>
  <div :style="styleObj">
    <v-chart :options="options" autoresize/>
  </div>
</template>
<script>
import wordCloud from "../../../../../static/wordCloud/echarts-wordcloud.min.js";

export default {
  name: "widgetWordCloud",
  components: {},
  props: {
    value: Object,
    ispreview: Boolean
  },
  data() {
    return {
      options: {
        tooltip: {
          show: true
        },
        series: [
          {
            type: 'wordCloud',
            size: ['9%', '99%'],
            sizeRange: [6, 30],
            textRotation: [0, 45, 90, -45],
            rotationRange: [-45, 90],
            shape: 'circle',
            textPadding: 0,
            autoSize: {
              enable: true,
              minSize: 6
            },
            textStyle: {
              normal: {
                color: function () {
                  return 'rgb(' + [
                    Math.round(Math.random() * 160),
                    Math.round(Math.random() * 160),
                    Math.round(Math.random() * 160)
                  ].join(',') + ')';
                }
              },
            },
            data: []
          }
        ]
      },
      optionsStyle: {}, // 样式
      optionsData: {}, // 数据
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
        this.optionsCollapse = val.setup;
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
      this.setOptionsSizeRange();
      this.setOptionsRotationRange();
      this.setOptionsTooltip();
      this.setOptionsData();
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
    // 词云字体范围
    setOptionsSizeRange() {
      const optionsSetup = this.optionsSetup;
      this.options.series[0].sizeRange = [optionsSetup.minRangeSize, optionsSetup.maxRangeSize];
    },
    // 文字角度
    setOptionsRotationRange() {
      const optionsSetup = this.optionsSetup;
      this.options.series[0].rotationRange = [optionsSetup.minRotationRange, optionsSetup.maxRotationRange];
    },
    // tooltip 设置
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
    // 数据解析
    setOptionsData() {
      const optionsData = this.optionsData; // 数据类型 静态 or 动态
      optionsData.dataType == "staticData"
        ? this.staticDataFn(optionsData.staticData)
        : this.dynamicDataFn(optionsData.dynamicData, optionsData.refreshTime);
    },
    staticDataFn(val) {
      const staticData = typeof val == "string" ? JSON.parse(val) : val;
      for (const key in this.options.series) {
        this.options.series[key].data = staticData;
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
      for (const key in this.options.series) {
        this.options.series[key].data = val;
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
