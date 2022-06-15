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
    @blur="handleBlur"
  >
    <component :is="type" :value="value" />
  </avue-draggable>
</template>

<script>
import widgetHref from "./texts/widgetHref.vue";
import WidgetIframe from "./texts/widgetIframe.vue";
import widgetImage from "./texts/widgetImage.vue";
import WidgetMarquee from "./texts/widgetMarquee.vue";
import widgetSlider from "./texts/widgetSlider.vue";
import widgetTable from "./texts/widgetTable.vue";
import widgetText from "./texts/widgetText.vue";
import widgetTime from "./texts/widgetTime.vue";
import widgetVideo from "./texts/widgetVideo.vue";
import widgetBarchart from "./barCharts/widgetBarchart.vue";
import widgetGradientColorBarchart from "./barCharts/widgetGradientColorBarchart.vue";
import widgetLinechart from "./lineCharts/widgetLinechart.vue";
import widgetBarlinechart from "./barlineCharts/widgetBarlinechart";
import WidgetPiechart from "./pieCharts/widgetPiechart.vue";
import WidgetFunnel from "./funnelCharts/widgetFunnel.vue";
import WidgetGauge from "./percentCharts/widgetGauge.vue";
import WidgetPieNightingaleRoseArea from "./pieCharts/widgetPieNightingaleRose";
import widgetLineMap from "./mapCharts/widgetLineMap.vue";
import widgetPiePercentageChart from "./percentCharts/widgetPiePercentageChart";
import widgetAirBubbleMap from "./mapCharts/widgetAirBubbleMap";
import widgetBarStackChart from "./barCharts/widgetBarStackChart";
import widgetLineStackChart from "./lineCharts/widgetLineStackChart";
import widgetBarCompareChart from "./barCharts/widgetBarCompareChart";
import widgetLineCompareChart from "./lineCharts/widgetLineCompareChart";
import widgetDecoratePieChart from "./decorateCharts/widgetDecoratePieChart";
import widgetMoreBarLineChart from "./barlineCharts/widgetMoreBarLineChart";
import widgetWordCloud from "./wordcloudCharts/widgetWordCloud";
import widgetHeatmap from "./heatmap/widgetHeatmap";

export default {
  name: "Widget",
  components: {
    widgetHref,
    WidgetIframe,
    widgetImage,
    WidgetMarquee,
    widgetSlider,
    widgetTable,
    widgetText,
    widgetTime,
    widgetVideo,
    widgetBarchart,
    widgetGradientColorBarchart,
    widgetLinechart,
    widgetBarlinechart,
    WidgetPiechart,
    WidgetFunnel,
    WidgetGauge,
    WidgetPieNightingaleRoseArea,
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
    widgetHeatmap
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
        position: {}
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
      return this.value.position.left;
    },
    widgetsTop() {
      return this.value.position.top;
    },
    widgetsZIndex() {
      return this.value.position.zIndex || 1;
    }
  },
  mounted() {},
  methods: {
    handleBlur({ index, left, top, width, height }) {
      this.$emit("onActivated", { index, left, top, width, height });
      this.$refs.draggable.setActive(true);
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
