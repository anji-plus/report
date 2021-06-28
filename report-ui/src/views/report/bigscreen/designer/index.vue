<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="layout">
    <div
      v-if="toolIsShow"
      class="layout-left"
      :style="{ width: widthLeftForTools + 'px' }"
    >
      <el-tabs type="border-card" :stretch="true">
        <!-- 左侧组件栏-->
        <el-tab-pane label="工具栏">
          <!-- <el-divider content-position="center">html</el-divider>-->
          <draggable
            v-for="widget in widgetTools"
            :key="widget.code"
            @end="evt => widgetOnDragged(evt, widget.code)"
          >
            <div class="tools-item">
              <span class="tools-item-icon">
                <i class="iconfont" :class="widget.icon"></i>
              </span>
              <span class="tools-item-text">{{ widget.label }}</span>
            </div>
          </draggable>
        </el-tab-pane>
        <!-- 左侧图层-->
        <el-tab-pane label="图层">
          <div
            v-for="(item, index) in layerWidget"
            :key="index"
            class="tools-item"
          >
            <span class="tools-item-icon">
              <i class="iconfont" :class="item.icon"></i>
            </span>
            <span class="tools-item-text">{{ item.label }}</span>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>

    <div
      class="layout-left-fold"
      :style="{ width: widthLeftForToolsHideButton + 'px' }"
      @click="toolIsShow = !toolIsShow"
    >
      <i class="iconfont iconzhankai" />
    </div>

    <div
      class="layout-middle"
      :style="{ width: middleWidth + 'px', height: middleHeight + 'px' }"
    >
      <div class="top-button">
        <span class="btn">
          <el-tooltip
            class="item"
            effect="dark"
            content="保存"
            placement="bottom"
          >
            <i class="iconfont iconsave" @click="saveData"></i>
          </el-tooltip>
        </span>
        <span class="btn">
          <el-tooltip
            class="item"
            effect="dark"
            content="预览"
            placement="bottom"
          >
            <i class="iconfont iconyulan" @click="viewScreen"></i>
          </el-tooltip>
        </span>
      </div>
      <div
        class="workbench-container"
        :style="{
          width: bigscreenWidthInWorkbench + 'px',
          height: bigscreenHeightInWorkbench + 'px'
        }"
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
            @click="setOptionsOnClickScreen"
          >
            <widget
              v-for="(widget, index) in widgets"
              :key="index"
              v-model="widget.value"
              :index="index"
              :type="widget.type"
              :bigscreen="{ bigscreenWidth, bigscreenHeight }"
              @onActivated="setOptionsOnClickWidget"
              @contextmenu.prevent.native="rightClick($event, index)"
            />
          </div>
        </vue-ruler-tool>
      </div>
    </div>

    <div class="layout-right" :style="{ width: widthLeftForOptions + 'px' }">
      <el-tabs v-model="activeName" type="border-card" :stretch="true">
        <el-tab-pane
          v-if="
            isNotNull(widgetOptions.setup) || isNotNull(widgetOptions.collapse)
          "
          name="first"
          label="配置"
        >
          <dynamicForm
            ref="formData"
            :options="widgetOptions.setup"
            @onChanged="val => widgetValueChanged('setup', val)"
          />
        </el-tab-pane>
        <el-tab-pane
          v-if="isNotNull(widgetOptions.data)"
          name="second"
          label="数据"
        >
          <dynamicForm
            ref="formData"
            :options="widgetOptions.data"
            @onChanged="val => widgetValueChanged('data', val)"
          />
        </el-tab-pane>
        <el-tab-pane
          v-if="isNotNull(widgetOptions.position)"
          name="third"
          label="坐标"
        >
          <dynamicForm
            ref="formData"
            :options="widgetOptions.position"
            @onChanged="val => widgetValueChanged('position', val)"
          />
        </el-tab-pane>
      </el-tabs>
    </div>

    <content-menu
      :visible.sync="visibleContentMenu"
      :style-obj="styleObj"
      @deletelayer="deletelayer"
    />
  </div>
</template>

<script>
import { insertDashboard, detailDashboard } from "@/api/bigscreen";
import { widgetTools, getToolByCode } from "./tools";
import widget from "./widget/widget.vue";
import dynamicForm from "./form/dynamicForm.vue";
import draggable from "vuedraggable";
import VueRulerTool from "vue-ruler-tool"; // 大屏设计页面的标尺插件
import contentMenu from "./form/contentMenu";
export default {
  name: "Login",
  components: {
    draggable,
    VueRulerTool,
    widget,
    dynamicForm,
    contentMenu
  },
  data() {
    return {
      widgetTools: widgetTools, // 左侧工具栏的组件图标，将js变量加入到当前作用域
      widthLeftForTools: 200, // 左侧工具栏宽度
      widthLeftForToolsHideButton: 15, // 左侧工具栏折叠按钮宽度
      widthLeftForOptions: 300, // 右侧属性配置区
      toolIsShow: true, // 左侧工具栏是否显示

      bigscreenWidth: 1920, // 大屏设计的大小
      bigscreenHeight: 1080,

      // 工作台大屏画布，保存到表gaea_report_dashboard中
      dashboard: {
        id: null,
        title: "", // 大屏页面标题
        width: 1920, // 大屏设计宽度
        height: 1080, // 大屏设计高度
        backgroundColor: "", // 大屏背景色
        backgroundImage: "", // 大屏背景图片
        refreshSeconds: null, // 大屏刷新时间间隔
        presetLine: [], // 辅助线
        presetLineVisible: true // 辅助线是否显示
      },
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

      // 当前激活组件
      widgetIndex: 0,
      // 当前激活组件右侧配置属性
      widgetOptions: {
        setup: [], // 配置
        data: [], // 数据
        position: [] // 坐标
      },
      flagWidgetClickStopPropagation: false, // 点击组件时阻止事件冒泡传递到画布click事件上
      styleObj: {
        left: 0,
        top: 0
      },
      visibleContentMenu: false,
      rightClickIndex: -1,
      activeName: "first"
    };
  },
  computed: {
    // 左侧折叠切换时，动态计算中间区的宽度
    middleWidth() {
      var widthLeftAndRight = 0;
      if (this.toolIsShow) {
        widthLeftAndRight += this.widthLeftForTools; // 左侧工具栏宽度
      }
      widthLeftAndRight += this.widthLeftForToolsHideButton; // 左侧工具栏折叠按钮宽度
      widthLeftAndRight += this.widthLeftForOptions; // 右侧配置栏宽度

      var middleWidth = this.bodyWidth - widthLeftAndRight;
      return middleWidth;
    },
    middleHeight() {
      return this.bodyHeight;
    },
    // 设计台按大屏的缩放比例
    bigscreenScaleInWorkbench() {
      var widthScale = this.middleWidth / this.bigscreenWidth;
      var heightScale = this.middleHeight / this.bigscreenHeight;
      return Math.min(widthScale, heightScale);
    },
    workbenchTransform() {
      return `scale(${this.bigscreenScaleInWorkbench}, ${
        this.bigscreenScaleInWorkbench
      })`;
    },
    // 大屏在设计模式的大小
    bigscreenWidthInWorkbench() {
      return this.getPXUnderScale(this.bigscreenWidth);
    },
    bigscreenHeightInWorkbench() {
      return this.getPXUnderScale(this.bigscreenHeight);
    },
    layerWidget() {
      const layerWidgetArr = [];
      for (let i = 0; i < this.widgets.length; i++) {
        layerWidgetArr.push(getToolByCode(this.widgets[i].type));
      }
      return layerWidgetArr;
    }
  },
  mounted() {
    // 一进入时，加载屏幕配置属性
    this.setOptionsOnClickScreen();

    // 如果是新的设计工作台
    this.initEchartData();
    this.widgets = [];
  },
  methods: {
    async initEchartData() {
      const reportCode = this.$route.query.reportCode;
      const { code, data } = await detailDashboard(reportCode);
      if (code != 200) return;
      const processData = this.handleInitEchartsData(data);
      const screenData = this.handleBigScreen(data.dashboard);
      this.widgets = processData;
      this.dashboard = screenData;
    },
    handleBigScreen(data) {
      const optionScreen = this.deepClone(getToolByCode("screen").options);
      const setup = optionScreen.setup;
      for (const key in data) {
        for (let i = 0; i < setup.length; i++) {
          if (key == setup[i].name) {
            setup[i].value = data[key];
          }
        }
      }
      return {
        backgroundColor: data.backgroundColor,
        backgroundImage: data.backgroundImage,
        height: data.height,
        title: data.title,
        width: data.width
      };
    },
    handleInitEchartsData(data) {
      const widgets = data.dashboard.widgets;
      const widgetsData = [];
      for (let i = 0; i < widgets.length; i++) {
        var obj = {};
        obj.type = widgets[i].type;
        obj.value = {
          setup: widgets[i].value.setup,
          data: widgets[i].value.data,
          collapse: widgets[i].value.collapse,
          position: widgets[i].value.position
        };
        const tool = this.deepClone(getToolByCode(widgets[i].type));
        const option = tool.options;
        const options = this.handleOptionsData(widgets[i].value, option);
        obj.options = options;
        widgetsData.push(obj);
      }
      return widgetsData;
    },
    handleOptionsData(data, option) {
      for (const key in data.setup) {
        for (let i = 0; i < option.setup.length; i++) {
          let item = option.setup[i];
          if (Object.prototype.toString.call(item) == "[object Object]") {
            if (key == option.setup[i].name) {
              option.setup[i].value = data.setup[key];
            }
          } else if (Object.prototype.toString.call(item) == "[object Array]") {
            for (let j = 0; j < item.length; j++) {
              const list = item[j].list;
              list.forEach(el => {
                if (key == el.name) {
                  el.value = data.setup[key];
                }
              });
            }
          }
        }
      }
      // position
      for (const key in data.position) {
        for (let i = 0; i < option.position.length; i++) {
          if (key == option.position[i].name) {
            option.position[i].value = data.position[key];
          }
        }
      }
      // data
      for (const key in data.data) {
        for (let i = 0; i < option.data.length; i++) {
          if (key == option.data[i].name) {
            option.data[i].value = data.data[key];
          }
        }
      }
      return option;
    },
    // 保存数据
    async saveData() {
      if (!this.widgets || this.widgets.length == 0) {
        this.$message.error("请添加组件");
        return;
      }
      const screenData = {
        reportCode: this.$route.query.reportCode,
        dashboard: {
          title: this.dashboard.title,
          width: this.dashboard.width,
          height: this.dashboard.height,
          backgroundColor: this.dashboard.backgroundColor,
          backgroundImage: this.dashboard.backgroundImage
        },
        widgets: this.widgets
      };
      const { code, data } = await insertDashboard(screenData);
      if (code == "200") {
        this.$message.success("保存成功！");
      }
    },
    // 预览
    viewScreen() {
      var routeUrl = this.$router.resolve({
        path: "/bigscreen/viewer",
        query: { reportCode: this.$route.query.reportCode }
      });
      window.open(routeUrl.href, "_blank");
    },
    // 在缩放模式下的大小
    getPXUnderScale(px) {
      return this.bigscreenScaleInWorkbench * px;
    },

    // 拖动一个组件放到工作区中去，在拖动结束时，放到工作区对应的坐标点上去
    widgetOnDragged(evt, widgetCode) {
      var widgetType = widgetCode;

      // 获取结束坐标和列名
      var eventX = evt.originalEvent.clientX; // 结束在屏幕的x坐标
      var eventY = evt.originalEvent.clientY; // 结束在屏幕的y坐标

      var workbenchPosition = this.getDomTopLeftById("workbench");
      var widgetTopInWorkbench = eventY - workbenchPosition.top;
      var widgetLeftInWorkbench = eventX - workbenchPosition.left;

      // 计算在缩放模式下的x y
      var x = widgetLeftInWorkbench / this.bigscreenScaleInWorkbench;
      var y = widgetTopInWorkbench / this.bigscreenScaleInWorkbench;

      // 复制一个组件
      var tool = getToolByCode(widgetType);
      var widgetJson = {
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
      const widgetJsonValue = this.handleDefaultValue(widgetJson);
      // 将选中的复制组件，放到工作区中去
      this.widgets.push(this.deepClone(widgetJsonValue));
      // 激活新组件的配置属性
      this.setOptionsOnClickWidget(this.widgets.length - 1);
    },

    // 对组件默认值处理
    handleDefaultValue(widgetJson) {
      for (const key in widgetJson) {
        if (key == "options") {
          // collapse、data、position、setup
          // setup 处理
          for (let i = 0; i < widgetJson.options.setup.length; i++) {
            const item = widgetJson.options.setup[i];
            if (Object.prototype.toString.call(item) == "[object Object]") {
              widgetJson.value.setup[item.name] = item.value;
            } else if (
              Object.prototype.toString.call(item) == "[object Array]"
            ) {
              for (let j = 0; j < item.length; j++) {
                const list = item[j].list;
                list.forEach(el => {
                  widgetJson.value.setup[el.name] = el.value;
                });
              }
            }
          }
          // position
          for (let i = 0; i < widgetJson.options.position.length; i++) {
            const item = widgetJson.options.position[i];
            if (item.value) {
              widgetJson.value.position[item.name] = item.value;
            }
          }
          // data 处理
          if (widgetJson.options.data && widgetJson.options.data.length > 0) {
            for (let i = 0; i < widgetJson.options.data.length; i++) {
              const item = widgetJson.options.data[i];
              if (item.value) {
                widgetJson.value.data[item.name] = item.value;
              }
            }
          }
        }
      }
      return widgetJson;
    },

    // 如果是点击大屏设计器中的底层，加载大屏底层属性
    setOptionsOnClickScreen() {
      this.screenCode = "screen";
      // 选中不同的组件 右侧都显示第一栏
      this.activeName = "first";
      this.widgetOptions = getToolByCode("screen")["options"];
    },

    // 如果是点击某个组件，获取该组件的配置项
    setOptionsOnClickWidget(index) {
      // 选中不同的组件 右侧都显示第一栏
      this.activeName = "first";
      this.screenCode = "";
      if (typeof index == "number") {
        if (index < 0 || index >= this.widgets.length) {
          return;
        }
        this.widgetIndex = index;
        this.widgetOptions = this.deepClone(this.widgets[index]["options"]);
        return;
      } else {
        // 执行传递过来的值
        this.widgets[index.index].value.position = index.obj;
      }
    },

    // 将当前选中的组件，右侧属性值更新
    widgetValueChanged(key, val) {
      console.log(key);
      console.log(val);
      /* 更新指定 this.widgets 中第 this.widgetIndex 个组件的value
      widgets: [{
        type: 'widget-text',
        value: {
          setup:{},
          data: {},
          position: {}
        }
      }]*/
      if (this.screenCode == "screen") {
        this.dashboard = this.deepClone(val);
      }

      for (let i = 0; i < this.widgets.length; i++) {
        if (this.widgetIndex == i) {
          this.widgets[i].value[key] = this.deepClone(val);
          this.setDefaultValue(this.widgets[i].options[key], val);
        }
      }
      console.log(this.widgets);
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
    deletelayer() {
      this.widgets.splice(this.rightClickIndex, 1);
      // console.log(this.widgets);
    },
    setDefaultValue(options, val) {
      for (let i = 0; i < options.length; i++) {
        if (Object.prototype.toString.call(options[i]) == "[object Object]") {
          for (const k in val) {
            if (options[i].name == k) {
              options[i].value = val[k];
            }
          }
        } else if (
          Object.prototype.toString.call(options[i]) == "[object Array]"
        ) {
          for (let j = 0; j < options[i].length; j++) {
            const list = options[i][j].list;
            for (let z = 0; z < list.length; z++) {
              for (const k in val) {
                if (list[z].name == k) {
                  list[z].value = val[k];
                }
              }
            }
          }
        }
      }
    }
  }
};
</script>

<style scoped lang="scss">
.layout {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  width: 100%;
  height: 100%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  overflow: hidden;
  .layout-left {
    display: inline-block;
    height: 100%;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    border: 0px;
    background-color: #263445;

    //工具栏一个元素
    .tools-item {
      display: flex;
      position: relative;
      width: 100%;
      height: 48px;
      align-items: center;
      -webkit-box-align: center;
      padding: 0 6px;
      cursor: pointer;
      font-size: 12px;
      margin-bottom: 1px;

      .tools-item-icon {
        color: #409eff;
        margin-right: 10px;
        width: 53px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        display: block;
        border: 1px solid #3a4659;
        background: #282a30;
      }
      .tools-item-text {
      }
    }
  }

  .layout-left-fold {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    height: 100%;
    -webkit-box-align: bottom;
    -ms-flex-align: bottom;
    align-items: bottom;
    font-size: 12px;
    overflow: hidden;
    background-color: #455766;
    cursor: pointer;
    i {
      font-size: 22px;
      width: 18px;
      height: 23px;
      margin-left: 0px;
      color: #5a83bb;
      transform: rotate(180deg);
      -ms-transform: rotate(180deg); /* IE 9 */
      -moz-transform: rotate(180deg); /* Firefox */
      -webkit-transform: rotate(180deg); /* Safari 和 Chrome */
      -o-transform: rotate(180deg); /* Opera */
    }
  }

  .layout-middle {
    // display: flex;
    position: relative;
    //width: calc(100% - 445px);
    height: 100%;
    background-color: #455766;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    border: 1px solid #455766;
    align-items: center;
    vertical-align: middle;
    .top-button {
      display: flex;
      flex-direction: row;
      height: 40px;
      line-height: 40px;
      margin-left: 9px;
      .btn {
        color: #cde8ff;
        width: 36px;
        text-align: center;
        display: block;
        cursor: pointer;
      }
    }
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
    }
  }

  .layout-right {
    display: inline-block;
    height: 100%;
  }

  /deep/.el-tabs--border-card {
    border: 0;
    .el-tabs__header {
      .el-tabs__nav {
        .el-tabs__item {
          background-color: #304156;
          border: 0px;
        }
        .el-tabs__item.is-active {
          background-color: #263445;
        }
      }
    }
    .el-tabs__content {
      background-color: #263445;
      height: calc(100vh - 39px);
      overflow-x: hidden;
      overflow-y: auto;
      .el-tab-pane {
        color: #bfcbd9;
      }
      &::-webkit-scrollbar {
        width: 5px;
        height: 14px;
      }
      &::-webkit-scrollbar-track,
      &::-webkit-scrollbar-thumb {
        border-radius: 1px;
        border: 0 solid transparent;
      }
      &::-webkit-scrollbar-track-piece {
        /*修改滚动条的背景和圆角*/
        background: #29405c;
        -webkit-border-radius: 7px;
      }

      &::-webkit-scrollbar-track {
        box-shadow: 1px 1px 5px rgba(116, 148, 170, 0.5) inset;
      }
      &::-webkit-scrollbar-thumb {
        min-height: 20px;
        background-clip: content-box;
        box-shadow: 0 0 0 5px rgba(116, 148, 170, 0.5) inset;
      }
      &::-webkit-scrollbar-corner {
        background: transparent;
      }
      /*修改垂直滚动条的样式*/
      &::-webkit-scrollbar-thumb:vertical {
        background-color: #00113a;
        -webkit-border-radius: 7px;
      }

      /*修改水平滚动条的样式*/
      &::-webkit-scrollbar-thumb:horizontal {
        background-color: #00113a;
        -webkit-border-radius: 7px;
      }
    }
  }
}
</style>
