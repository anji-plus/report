<template>
  <div>
    <component
      :is="type"
      :value="value"
      :ispreview="true"
      :widget-index="index"
    />
  </div>
</template>

<script>
import widgetHref from "./texts/widgetHref.vue";
import widgetText from "./texts/widgetText.vue";
import widgetButton from "./form/widgetButton.vue";
import WidgetMarquee from "./texts/widgetMarquee.vue";
import widgetTime from "./texts/widgetTime.vue";
import widgetImage from "./texts/widgetImage.vue";
import widgetSlider from "./texts/widgetSlider.vue";
import widgetVideo from "./texts/widgetVideo.vue";
import widgetVideoMonitor from "./texts/widgetVideoMonitor.vue";
import WidgetIframe from "./texts/widgetIframe.vue";
import widgetCalendar from "./texts/widgetCalendar.vue";
import widgetBarchart from "./bar/widgetBarchart.vue";
import widgetLinechart from "./line/widgetLinechart.vue";
import widgetBarlinechart from "./barline/widgetBarlinechart";
import widgetGradientColorBarchart from "./bar/widgetGradientColorBarchart.vue";
import WidgetPiechart from "./pie/widgetPiechart.vue";
import WidgetFunnel from "./funnel/widgetFunnel.vue";
import WidgetGauge from "./percent/widgetGauge.vue";
import WidgetPieNightingaleRoseArea from "./pie/widgetPieNightingaleRose";
import widgetTable from "./texts/widgetTable.vue";
import widgetLineMap from "./map/widgetLineMap.vue";
import widgetPiePercentageChart from "./percent/widgetPiePercentageChart";
import widgetAirBubbleMap from "./map/widgetAirBubbleMap";
import widgetBarStackChart from "./bar/widgetBarStackChart";
import widgetLineStackChart from "./line/widgetLineStackChart";
import widgetBarCompareChart from "./bar/widgetBarCompareChart";
import widgetLineCompareChart from "./line/widgetLineCompareChart";
import widgetDecoratePieChart from "./styleWidget/widgetDecoratePieChart.vue";
import widgetMoreBarLineChart from "./barline/widgetMoreBarLineChart";
import widgetWordCloud from "./wordcloud/widgetWordCloud";
import widgetHeatmap from "./heatmap/widgetHeatmap";
import widgetRadar from "./radar/widgetRadar";
import widgetBarLineStackChart from "./barline/widgetBarLineStackChart";
import widgetSelect from "./form/widgetSelect";
import widgetInput from "./form/widgetInput.vue";
import widgetFormTime from "./form/widgetFormTime.vue";
import widgetScaleVertical from "./scale/widgetScaleVertical.vue";
import widgetScaleHorizontal from "./scale/widgetScaleHorizontal.vue";
import widgetScatter from "./scatter/widgetScatter.vue";
import widgetBarDoubleYaxisChart from "./bar/widgetBarDoubleYaxisChart.vue";
import widgetDecorateFlowLine from "./styleWidget/widgetDecorateFlowLine.vue";
import widgetBorder from "./styleWidget/widgetBorder.vue";
import widgetDecoration from "./styleWidget/widgetDecoration.vue";
import widgetBarMap from "./map/widgetBarMap.vue";
import widgetChinaMap from "./map/widgetChinaMap.vue";
import widgetGlobalMap from "./map/widgetGlobalMap.vue";
import widgetBarStackMoreShowChart from "./bar/widgetBarStackMoreShowChart.vue";
import widgetBarLineSingleChart from "./barline/widgetBarLineSingleChart.vue";

export default {
  name: "WidgetTemp",
  components: {
    widgetHref,
    widgetText,
    widgetButton,
    widgetBorder,
    widgetDecorateFlowLine,
    widgetDecoration,
    WidgetMarquee,
    widgetTime,
    widgetImage,
    widgetSlider,
    widgetVideo,
    widgetVideoMonitor,
    WidgetIframe,
    widgetCalendar,
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
    widgetBarLineStackChart,
    widgetScaleVertical,
    widgetScaleHorizontal,
    widgetSelect,
    //widgetInput,
    widgetFormTime,
    widgetBarDoubleYaxisChart,
    widgetBarMap,
    widgetChinaMap,
    widgetGlobalMap,
    widgetScatter,
    widgetBarStackMoreShowChart,
    widgetBarLineSingleChart
  },
  model: {
    prop: "value",
    event: "input",
  },
  props: {
    type: String,
    value: {
      type: [Object],
      default: () => {
      },
    },
    index: {
      type: Number,
      default: 0,
    }, // 当前组件，在工作区变量widgetInWorkbench中的索引
  },
  data() {
    return {};
  },
  mounted() {
  },
  methods: {},
};
</script>

<style scoped lang="scss"></style>
