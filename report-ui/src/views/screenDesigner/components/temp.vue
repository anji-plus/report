<!--
 * @Descripttion:
 * @version:
 * @Author: qianlishi
 * @Date: 2022-04-28 12:20:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-04-28 12:31:14
-->
<template>
  <div>
    <component :is="type" :value="value" :ispreview="true"/>
  </div>
</template>

<script>
import widgetHref from "../widget/texts/widgetHref.vue";
import WidgetIframe from "../widget/texts/widgetIframe.vue";
import widgetImage from "../widget/texts/widgetImage.vue";
import WidgetMarquee from "../widget/texts/widgetMarquee.vue";
import widgetSlider from "../widget/texts/widgetSlider.vue";
import widgetTable from "../widget/texts/widgetTable.vue";
import widgetText from "../widget/texts/widgetText.vue";
import widgetTime from "../widget/texts/widgetTime.vue";
import widgetVideo from "../widget/texts/widgetVideo.vue";
import widgetBarchart from "../widget/barCharts/widgetBarchart.vue";
import widgetGradientColorBarchart from "../widget/barCharts/widgetGradientColorBarchart.vue";
import widgetLinechart from "../widget/lineCharts/widgetLinechart.vue";
import widgetBarlinechart from "../widget/barlineCharts/widgetBarlinechart";
import WidgetPiechart from "../widget/pieCharts/widgetPiechart.vue";
import WidgetFunnel from "../widget/funnelCharts/widgetFunnel.vue";
import WidgetGauge from "../widget/percentCharts/widgetGauge.vue";
import WidgetPieNightingaleRoseArea from "../widget/pieCharts/widgetPieNightingaleRose";
import widgetLineMap from "../widget/mapCharts/widgetLineMap.vue";
import widgetPiePercentageChart from "../widget/percentCharts/widgetPiePercentageChart";
import widgetAirBubbleMap from "../widget/mapCharts/widgetAirBubbleMap";
import widgetBarStackChart from "../widget/barCharts/widgetBarStackChart";
import widgetLineStackChart from "../widget/lineCharts/widgetLineStackChart";
import widgetBarCompareChart from "../widget/barCharts/widgetBarCompareChart";
import widgetLineCompareChart from "../widget/lineCharts/widgetLineCompareChart";
import widgetDecoratePieChart from "../widget/decorateCharts/widgetDecoratePieChart";
import widgetMoreBarLineChart from "../widget/barlineCharts/widgetMoreBarLineChart";
import widgetWordCloud from "../widget/wordcloudCharts/widgetWordCloud";
import widgetHeatmap from "../widget/heatmap/widgetHeatmap";

export default {
  name: "WidgetTemp",
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
    type: String,
    value: {
      type: [Object],
      default: () => {
      }
    }
  }
};
</script>
