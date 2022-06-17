<template>
  <div class="layout">
    <div class="layout-container">
      <!-- 左侧菜单 -->
      <left-menu
        :layerWidget="layerWidget"
        :widgetTools="widgetTools"
        :widgetIndex="widgetIndex"
        @widgetOnDragged="widgetOnDragged"
        @layerClick="layerClick"
      />
      <div
        class="layout-middle"
        :style="{
          width: middleWidth + 'px',
          height: middleHeight + 'px'
        }"
      >
        <!-- 顶部按钮 -->
        <top-bar
          :dashboard="dashboard"
          :widgets="widgets"
          @refresh="initEchartData"
        />

        <!-- 设计器 -->
        <middleScreen
          ref="middleScreen"
          :middleWidth="middleWidth"
          :middleHeight="middleHeight"
          :dashboard="dashboard"
          :widgets="widgets"
          @change="changeOptions"
        />
      </div>
      <!-- 右侧配置 -->
      <right-config
        :widgetOptions="widgetOptions"
        @widgetValueChanged="widgetValueChanged"
      />
    </div>
  </div>
</template>
<script>
import { detailDashboard, importDashboard } from "@/api/bigscreen";
import {
  swapArr,
  setDefaultValue,
  handleDefaultValue,
  getPXUnderScale,
  handleInitEchartsData,
  handleBigScreen,
  handlerLayerWidget
} from "./util/screen";
import { widgetTools, getToolByCode } from "./config/index.js";

import leftMenu from "./layout/leftMenu.vue";
import topBar from "./layout/topBar.vue";
import middleScreen from "./layout/middleScreen.vue";
import rightConfig from "./layout/rightConfig.vue";

export default {
  components: {
    leftMenu,
    topBar,
    middleScreen,
    rightConfig
  },
  data() {
    return {
      // 左侧菜单
      layerWidget: [],
      widgetTools: widgetTools,
      widgetIndex: 0,

      // 顶部按钮

      // 中间大屏
      grade: false,
      // 工作台大屏画布，保存到表gaea_report_dashboard中
      dashboard: {
        id: null,
        title: "", // 大屏页面标题
        width: 1920, // 大屏设计宽度
        height: 1080, // 大屏设计高度
        backgroundColor: "", // 大屏背景色
        backgroundImage: "", // 大屏背景图片
        refreshSeconds: null // 大屏刷新时间间隔
      },

      // 右侧配置
      widthLeftForTools: 200, // 左侧工具栏宽度
      widthRightForOptions: 300, // 右侧属性配置区

      // 大屏的标记
      screenCode: "",
      // 大屏画布中的组件
      widgets: [
        {
          // type和value最终存到数据库中去，保存到gaea_report_dashboard_widget中
          type: "widget-text",
          value: {
            setup: {},
            data: {},
            position: {
              width: 100,
              height: 100,
              left: 0,
              top: 0,
              zIndex: 0
            }
          },
          // options属性是从工具栏中拿到的tools中拿到
          options: []
        }
      ], // 工作区中拖放的组件

      // 当前激活组件右侧配置属性
      widgetOptions: {
        setup: [],
        data: [],
        position: []
      }
    };
  },
  watch: {
    widgets: {
      handler(val) {
        this.layerWidget = handlerLayerWidget(val, getToolByCode);
      },
      deep: true
    }
  },
  computed: {
    // 中间设计器的宽度
    middleWidth() {
      return (
        this.bodyWidth - this.widthLeftForTools - this.widthRightForOptions
      );
    },
    // 中间设计器的高度
    middleHeight() {
      return this.bodyHeight;
    }
  },
  mounted() {
    this.widgets = [];
    window.addEventListener("mouseup", () => {
      this.grade = false;
    });
    this.initEchartData();
  },
  methods: {
    // 初始化 echrats
    async initEchartData() {
      const reportCode = this.$route.query.reportCode;
      const { code, data } = await detailDashboard(reportCode);
      if (code != 200) return;
      const processData = handleInitEchartsData(data, getToolByCode);
      const screenData = handleBigScreen(
        data.dashboard,
        getToolByCode,
        this.setOptionsOnClickScreen
      );
      this.widgets = processData;
      this.dashboard = screenData;
      this.bigscreenWidth = this.dashboard.width;
      this.bigscreenHeight = this.dashboard.height;
    },

    // 拖动一个组件放到工作区中去，在拖动结束时，放到工作区对应的坐标点上去
    widgetOnDragged(evt, widgetCode) {
      let widgetType = widgetCode;

      // 获取结束坐标和列名
      let eventX = evt.originalEvent.clientX; // 结束在屏幕的x坐标
      let eventY = evt.originalEvent.clientY; // 结束在屏幕的y坐标

      let workbenchPosition = this.getDomTopLeftById("workbench");
      let widgetTopInWorkbench = eventY - workbenchPosition.top;
      let widgetLeftInWorkbench = eventX - workbenchPosition.left;

      // 计算在缩放模式下的x y
      let x = widgetLeftInWorkbench / this.bigscreenScaleInWorkbench;
      let y = widgetTopInWorkbench / this.bigscreenScaleInWorkbench;

      // 复制一个组件
      let tool = getToolByCode(widgetType);
      let widgetJson = {
        type: widgetType,
        value: {
          setup: {},
          data: {},
          position: {
            width: 0,
            height: 0,
            left: 0,
            top: 0,
            zIndex: 0
          }
        },
        options: tool.options
      };
      // 处理默认值
      const widgetJsonValue = handleDefaultValue(widgetJson);

      // 将选中的复制组件，放到工作区中去
      this.widgets.push(this.deepClone(widgetJsonValue));

      // 激活新组件的配置属性
      this.$refs.middleScreen.setOptionsOnClickWidget(this.widgets.length - 1);
    },
    layerClick(index) {
      this.widgetIndex = index;
      this.$refs.middleScreen.widgetsClick(index);
    },

    // 将当前选中的组件，右侧属性值更新
    widgetValueChanged(key, val) {
      if (this.screenCode == "screen") {
        let newSetup = new Array();
        this.dashboard = this.deepClone(val);
        if (this.bigscreenWidth != this.dashboard.width) {
          this.bigscreenWidth = this.dashboard.width;
        }
        if (this.bigscreenHeight != this.dashboard.height) {
          this.bigscreenHeight = this.dashboard.height;
        }
        this.widgetOptions.setup.forEach(el => {
          if (el.name == "width") {
            el.value = this.bigscreenWidth;
          } else if (el.name == "height") {
            el.value = this.bigscreenHeight;
          }
          newSetup.push(el);
        });
        this.widgetOptions.setup = newSetup;
      } else {
        for (let i = 0; i < this.widgets.length; i++) {
          if (this.widgetIndex == i) {
            this.widgets[i].value[key] = this.deepClone(val);
            setDefaultValue(this.widgets[i].options[key], val);
          }
        }
      }
    },
    changeOptions(widgetOptions) {
      this.widgetOptions = widgetOptions;
    },
    datadragEnd(evt) {
      evt.preventDefault();
      this.widgets = swapArr(this.widgets, evt.oldIndex, evt.newIndex);
    }
  }
};
</script>
<style scoped lang="scss">
@import "../../assets/styles/screenDesigner.scss";
</style>
