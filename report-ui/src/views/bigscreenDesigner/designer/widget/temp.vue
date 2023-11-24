<!--
 * @Descripttion: 大屏报表设计器-组件注册
 * @Author: Devli
 * @Date: 2021-3-19 10:23:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2023-2-7 17:38:44
-->
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
import WidgetMarquee from "./texts/widgetMarquee.vue";
import widgetTime from "./texts/widgetTime.vue";
import widgetImage from "./texts/widgetImage.vue";
import widgetSlider from "./texts/widgetSlider.vue";
import widgetVideo from "./texts/widgetVideo.vue";
import WidgetIframe from "./texts/widgetIframe.vue";
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
import widgetBarDoubleYaxisChart from "./bar/widgetBarDoubleYaxisChart.vue";
import widgetDecorateFlowLine from "./styleWidget/widgetDecorateFlowLine.vue";
import widgetBorder from "./styleWidget/widgetBorder.vue";
import widgetDecoration from "./styleWidget/widgetDecoration.vue";
import widgetBarMap from "./map/widgetBarMap.vue";
import widgetBarStackMoreShowChart from "./bar/widgetBarStackMoreShowChart.vue";

export default {
  name: "WidgetTemp",
  components: {
    widgetHref,
    widgetText,
    widgetBorder,
    widgetDecorateFlowLine,
    widgetDecoration,
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
    widgetBarLineStackChart,
    widgetScaleVertical,
    widgetScaleHorizontal,
    widgetSelect,
    //widgetInput,
    widgetFormTime,
    widgetBarDoubleYaxisChart,
    widgetBarMap,
    widgetBarStackMoreShowChart
  },
  model: {
    prop: "value",
    event: "input",
  },
  props: {
    type: String,
    value: {
      type: [Object],
      default: () => {},
    },
    index: {
      type: Number,
      default: 0,
    }, // 当前组件，在工作区变量widgetInWorkbench中的索引
  },
  data() {
    return {};
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped lang="scss"></style>
