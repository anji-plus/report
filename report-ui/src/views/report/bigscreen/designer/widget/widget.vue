<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <!-- <vue-draggable-resizable class="vue-draggalbe" :w="data.position.width" :h="data.position.height" :x="data.position.left" :y="data.position.top" :z="data.position.zIndex" :parent="true" :is-conflict-check="true" :snap="true" :resizable="true" :draggable="true" :prevent-deactivation="false" :active="true" :snap-tolerance="20" :class-name="'widget-container'" :class-name-active="'widget-active'" @activated="onActivated(index)" @resizestop="onResizstop" @dragstop="onDragstop">
    <component :is="type" :value="value" />
  </vue-draggable-resizable> -->
  <div @click.stop>
    <vue-drag-resize
      :w="widgetsWidth"
      :h="widgetsHeight"
      :x="widgetsLeft"
      :y="widgetsTop"
      :z="widgetsZIndex"
      :minw="10"
      :minh="10"
      :parent-w="bigscreen.bigscreenWidth"
      :parent-h="bigscreen.bigscreenHeight"
      :snap-tolerance="20"
      :is-conflict-check="true"
      :class-name="'widget-container'"
      :class-name-active="'widget-active'"
      :prevent-deactivation="false"
      :is-active="true"
      :is-draggable="true"
      :is-resizable="true"
      :parent-limitation="true"
      :snap-to-grid="false"
      :aspect-ratio="false"
      @clicked="onActivated(index)"
      @activated="onActivated(index)"
      @dragstop="ev => onDragstop(ev, index)"
      @resizing="ev => onResizing(ev, index)"
    >
      <component :is="type" :value="value" />
    </vue-drag-resize>
  </div>
</template>

<script>
// 大屏设计页面的拖拽插件 https://gitee.com/charact/vue-draggable-resizable-gorkys#dragstop
// import VueDraggableResizable from 'vue-draggable-resizable-gorkys'
// import 'vue-draggable-resizable-gorkys/dist/VueDraggableResizable.css'
import VueDragResize from "vue-drag-resize";

import widgetHref from "./widgetHref.vue";
import widgetText from "./widgetText.vue";
import WidgetMarquee from "./widgetMarquee.vue";
import widgetTime from "./widgetTime.vue";
import widgetImage from "./widgetImage.vue";
import widgetSlider from "./widgetSlider.vue";
import widgetVideo from "./widgetVideo.vue";
import WidgetIframe from "./widgetIframe.vue";
import widgetBarchart from "./widgetBarchart.vue";
import widgetGradientColorBarchart from "./bar/widgetGradientColorBarchart.vue";
import widgetLinechart from "./widgetLinechart.vue";
import widgetBarlinechart from "./widgetBarlinechart";
import WidgetPiechart from "./widgetPiechart.vue";
import WidgetHollowPiechart from "./widgetHollowPiechart.vue";
import WidgetFunnel from "./widgetFunnel.vue";
import WidgetGauge from "./widgetGauge.vue";
export default {
  name: "Widget",
  components: {
    // VueDraggableResizable,
    VueDragResize,
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
    WidgetHollowPiechart,
    WidgetFunnel,
    WidgetGauge
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
    }
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
    onActivated(index) {
      this.$emit("onActivated", index);
    },
    onDragstop(obj, index) {
      this.$emit("onActivated", { index, obj });
    },
    onResizing(obj, index) {
      this.$emit("onActivated", { index, obj });
    }
  }
};
</script>

<style scoped lang="scss">
.vue-draggalbe {
  position: absolute;
}
.widget-container {
}
.widget-active {
  cursor: move;
  border: 1px dashed #09f;
  background-color: rgba(115, 170, 229, 0.5);
}
</style>
