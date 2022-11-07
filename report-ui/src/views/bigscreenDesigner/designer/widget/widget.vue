<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <avue-draggable
    :step="step"
    :width="widgetsWidth"
    :height="widgetsHeight"
    :left="widgetsLeft"
    :top="widgetsTop"
    ref="draggable"
    :index="index"
    :z-index="-1"
    @focus="handleFocus"
    @blur="handleBlur"
  >
    <component :is="type" :value="value" />
  </avue-draggable>
</template>

<script>
import widgetHref from "./widgetHref.vue";
import widgetText from "./widgetText.vue";
import WidgetMarquee from "./widgetMarquee.vue";
import widgetTime from "./widgetTime.vue";
import widgetImage from "./widgetImage.vue";
import widgetSlider from "./widgetSlider.vue";
import widgetVideo from "./widgetVideo.vue";
import WidgetIframe from "./widgetIframe.vue";
import widgetBarchart from "./bar/widgetBarchart.vue";
import widgetGradientColorBarchart from "./bar/widgetGradientColorBarchart.vue";
import widgetLinechart from "./line/widgetLinechart.vue";
import widgetBarlinechart from "./barline/widgetBarlinechart";
import WidgetPiechart from "./pie/widgetPiechart.vue";
import WidgetFunnel from "./funnel/widgetFunnel.vue";
import WidgetGauge from "./percent/widgetGauge.vue";
import WidgetPieNightingaleRoseArea from "./pie/widgetPieNightingaleRose";
import widgetTable from "./widgetTable.vue";
import widgetLineMap from "./map/widgetLineMap.vue";
import widgetPiePercentageChart from "./percent/widgetPiePercentageChart";
import widgetAirBubbleMap from "./map/widgetAirBubbleMap";
import widgetBarStackChart from "./bar/widgetBarStackChart";
import widgetLineStackChart from "./line/widgetLineStackChart";
import widgetBarCompareChart from "./bar/widgetBarCompareChart";
import widgetLineCompareChart from "./line/widgetLineCompareChart";
import widgetDecoratePieChart from "./decorate/widgetDecoratePieChart";
import widgetMoreBarLineChart from "./barline/widgetMoreBarLineChart";
import widgetWordCloud from "./wordcloud/widgetWordCloud";
import widgetHeatmap from "./heatmap/widgetHeatmap";
import widgetRadar from "./radar/widgetRadar";
import widgetBarLineStackChart from "./barline/widgetBarLineStackChart";

export default {
  name: "Widget",
  components: {
    widgetHref,
    widgetText,
    WidgetMarquee,
    widgetTime,
    widgetImage,
    widgetSlider,
    widgetVideo,
    WidgetIframe,
    widgetBarchart,
    widgetGradientColorBarchart,
    widgetLinechart,
    widgetBarlinechart,
    WidgetPiechart,
    WidgetFunnel,
    WidgetGauge,
    WidgetPieNightingaleRoseArea,
    widgetTable,
    widgetLineMap,
    widgetPiePercentageChart,
    widgetAirBubbleMap,
    widgetBarStackChart,
    widgetLineStackChart,
    widgetBarCompareChart,
    widgetLineCompareChart,
    widgetDecoratePieChart,
    widgetMoreBarLineChart,
    widgetWordCloud,
    widgetHeatmap,
    widgetRadar,
    widgetBarLineStackChart
  },
  model: {
    prop: "value",
    event: "input"
  },
  props: {
    /*
    widget-text widget-marquee widget-href widget-time widget-image widget-slider widget-video widget-table widget-iframe widget-universal
    widget-linechart widget-barlinechart widget-piechart widget-hollow-piechart widget-funnel widget-gauge widget-china-map
    */
    index: Number, // 当前组件，在工作区变量widgetInWorkbench中的索引
    type: String,
    bigscreen: Object,
    value: {
      type: [Object],
      default: () => {}
    },
    step: Number
  },
  data() {
    return {
      data: {
        setup: {},
        data: {},
        position: {},
/*        leftMargin: null,
        topMargin: null*/
      }
    };
  },
  computed: {
    widgetsWidth() {
      return this.value.position.width;
    },
    widgetsHeight() {
      return this.value.position.height;
    },
    widgetsLeft() {
      return this.value.position.left// >= this.leftMargin ? this.leftMargin : this.value.position.left;
    },
    widgetsTop() {
      return this.value.position.top// >= this.topMargin ? this.topMargin : this.value.position.top;
    },
    widgetsZIndex() {
      return this.value.position.zIndex || 1;
    }
  },
  mounted() {},
  methods: {
    handleFocus({ index, left, top, width, height }) {},
    handleBlur({ index, left, top, width, height }) {
      this.$emit("onActivated", { index, left, top, width, height });
      this.$refs.draggable.setActive(true);
      // 处理widget超出workbench的问题
      //this.handleBoundary({ index, left, top, width, height })
    },
    handleBoundary({ index, left, top, width, height }) {
      // 计算workbench的X轴边界值
      // 组件距离左侧宽度 + 组件宽度 > 大屏总宽度时，右侧边界值 = (大屏宽度 - 组件宽度)；左侧边界值 = 0
      const { bigscreenWidth, bigscreenHeight } = this.bigscreen;
      const xBoundaryValue = (left + width) > bigscreenWidth ? bigscreenWidth - width : left < 0 ? 0 : left;
      // 初始化X轴边界值
      this.leftMargin = left;
      // 计算Y轴边界值
      const yBoundaryValue = (top + height) > bigscreenHeight ? bigscreenHeight - height : top < 0 ? 0 : top;
      // 初始化Y轴边界值
      this.topMargin = top;
      // 若位置超出边界值则重新设置位置
      if (this.leftMargin != xBoundaryValue || this.topMargin != yBoundaryValue) {
        this.$nextTick(() => {
          this.leftMargin = xBoundaryValue;
          this.topMargin = yBoundaryValue;
          this.$emit("onActivated", { index, left: xBoundaryValue, top: yBoundaryValue, width, height });
        })
      }
    }
  }
};
</script>

<style scoped lang="scss">
.vue-draggalbe {
  position: absolute;
}

.widget-active {
  cursor: move;
  border: 1px dashed #09f;
  background-color: rgba(115, 170, 229, 0.5);
}

.avue-draggable {
  padding: 0 !important;
}
</style>
