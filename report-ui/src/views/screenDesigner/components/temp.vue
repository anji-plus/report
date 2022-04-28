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
    <component :is="type" :value="value" :ispreview="true" />
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
    widgetBarchart
  },
  model: {
    prop: "value",
    event: "input"
  },
  props: {
    type: String,
    value: {
      type: [Object],
      default: () => {}
    }
  }
};
</script>
