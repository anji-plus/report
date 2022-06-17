<!--
 * @Descripttion: 大屏设计器
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-05-12 11:05:48
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-21 14:47:00
-->
<template>
  <div
    class="workbench-container"
    :style="{
      width: bigscreenWidthInWorkbench + 'px',
      height: bigscreenHeightInWorkbench + 'px'
    }"
    @mousedown="handleMouseDown"
  >
    <vue-ruler-tool
      v-model="dashboard.presetLine"
      class="vueRuler"
      :step-length="50"
      :parent="true"
      :position="'relative'"
      :is-scale-revise="true"
      :visible.sync="dashboard.presetLineVisible"
    >
      <div
        id="workbench"
        class="workbench"
        :style="{
          transform: workbenchTransform,
          width: bigscreenWidth + 'px',
          height: bigscreenHeight + 'px',
          'background-color': dashboard.backgroundColor,
          'background-image': 'url(' + dashboard.backgroundImage + ')',
          'background-position': '0% 0%',
          'background-size': '100% 100%',
          'background-repeat': 'initial',
          'background-attachment': 'initial',
          'background-origin': 'initial',
          'background-clip': 'initial'
        }"
        @click.self="setOptionsOnClickScreen"
      >
        <div v-if="grade" class="bg-grid"></div>
        <widget
          ref="widgets"
          v-for="(widget, index) in widgets"
          :key="index"
          v-model="widget.value"
          :index="index"
          :step="step"
          :type="widget.type"
          :bigscreen="{ bigscreenWidth, bigscreenHeight }"
          @onActivated="setOptionsOnClickWidget"
          @contextmenu.prevent.native="rightClick($event, index)"
          @mousedown.prevent.native="widgetsClick(index)"
          @mouseup.prevent.native="widgetsMouseup"
        />
      </div>
    </vue-ruler-tool>

    <!-- 右键 -->
    <content-menu
      :visible.sync="visibleContentMenu"
      :style-obj="styleObj"
      :widgets="widgets"
      :rightClickIndex="rightClickIndex"
    />
  </div>
</template>
<script>
import {
  swapArr,
  setDefaultValue,
  handleDefaultValue,
  getPXUnderScale,
  handleInitEchartsData,
  handleBigScreen,
  handlerLayerWidget
} from "../util/screen";
import { screenConfig } from "../config/texts/screenConfig.js";
import VueRulerTool from "vue-ruler-tool";
import widget from "../widget/index.vue";
import contentMenu from "../components/contentMenu";
export default {
  components: {
    VueRulerTool,
    widget,
    contentMenu
  },
  props: {
    dashboard: Object,
    middleWidth: Number,
    middleHeight: Number,
    widgets: Array
  },
  data() {
    return {
      grade: false,
      bigscreenWidth: 1920, // 大屏设计的大小
      bigscreenHeight: 1080,
      widgetOptions: {},
      styleObj: {
        left: 0,
        top: 0
      },
      rightClickIndex: -1,
      // 右键
      visibleContentMenu: false
    };
  },
  computed: {
    step() {
      return Number(100 / (this.bigscreenScaleInWorkbench * 100));
    },
    // 设计台按大屏的缩放比例
    bigscreenScaleInWorkbench() {
      let widthScale = this.middleWidth / this.bigscreenWidth;
      let heightScale = this.middleHeight / this.bigscreenHeight;
      return Math.min(widthScale, heightScale);
    },
    workbenchTransform() {
      return `scale(${this.bigscreenScaleInWorkbench}, ${
        this.bigscreenScaleInWorkbench
      })`;
    },
    // 大屏在设计模式的大小
    bigscreenWidthInWorkbench() {
      return getPXUnderScale(
        this.bigscreenScaleInWorkbench,
        this.bigscreenWidth
      );
    },
    bigscreenHeightInWorkbench() {
      return getPXUnderScale(
        this.bigscreenScaleInWorkbench,
        this.bigscreenHeight
      );
    }
  },
  mounted() {
    this.loadOption();
  },
  methods: {
    // 加载大屏配置
    loadOption() {
      this.widgetOptions = screenConfig["options"];
      this.$emit("change", this.widgetOptions);
    },
    handleMouseDown() {
      const draggableArr = this.$refs.widgets;
      for (let i = 0; i < draggableArr.length; i++) {
        this.$refs.widgets[i].$refs.draggable.setActive(false);
      }
    },
    rightClick(event, index) {
      this.rightClickIndex = index;
      const left = event.clientX;
      const top = event.clientY;
      if (left || top) {
        this.styleObj = {
          left: left + "px",
          top: top + "px",
          display: "block"
        };
      }
      this.visibleContentMenu = true;
      return false;
    },
    // 如果是点击大屏设计器中的底层，加载大屏底层属性
    setOptionsOnClickScreen() {
      this.screenCode = "screen";
      // 选中不同的组件 右侧都显示第一栏
      this.activeName = "first";
      this.widgetOptions = screenConfig["options"];
      this.$emit("change", this.widgetOptions);
    },
    // 如果是点击某个组件，获取该组件的配置项
    setOptionsOnClickWidget(obj) {
      console.log(obj);
      this.screenCode = "";
      if (typeof obj == "number") {
        this.widgetOptions = this.deepClone(this.widgets[obj]["options"]);
        return;
      }
      if (obj.index < 0 || obj.index >= this.widgets.length) {
        return;
      }
      this.widgetIndex = obj.index;
      this.widgets[obj.index].value.position = obj;
      this.widgets[obj.index].options.position.forEach(el => {
        for (const key in obj) {
          if (el.name == key) {
            el.value = obj[key];
          }
        }
      });
      this.widgetOptions = this.deepClone(this.widgets[obj.index]["options"]);
      this.$emit("change", this.widgetOptions);
    },
    widgetsClick(index) {
      const draggableArr = this.$refs.widgets;
      for (let i = 0; i < draggableArr.length; i++) {
        if (i == index) {
          this.$refs.widgets[i].$refs.draggable.setActive(true);
        } else {
          this.$refs.widgets[i].$refs.draggable.setActive(false);
        }
      }
      this.setOptionsOnClickWidget(index);
      this.grade = true;
    },
    widgetsMouseup(e) {
      this.grade = false;
    }
  }
};
</script>
<style lang="scss" scoped>
.workbench-container {
  position: relative;
  -webkit-transform-origin: 0 0;
  transform-origin: 0 0;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;

  .vueRuler {
    width: 100%;
    padding: 18px 0px 0px 18px;
  }

  .workbench {
    background-color: #1e1e1e;
    position: relative;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
    margin: 0;
    padding: 0;
  }

  .bg-grid {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: 30px 30px, 30px 30px;
    background-image: linear-gradient(hsla(0, 0%, 100%, 0.1) 1px, transparent 0),
      linear-gradient(90deg, hsla(0, 0%, 100%, 0.1) 1px, transparent 0);
    // z-index: 2;
  }
}
</style>
