<template>
  <div class="layout">
    <div
      v-if="toolIsShow"
      class="layout-left"
      :style="{ width: widthLeftForTools + 'px' }"
    >
      <el-tabs class="layout-left" type="border-card" :stretch="true">
        <!-- 左侧组件栏-->
        <el-tab-pane label="工具栏">
          <span slot="label"><i class="el-icon-date icon"></i>工具栏</span>
          <div class="chart-type">
            <el-tabs class="type-left" tab-position="left">
              <el-tab-pane
                v-for="(item, index) in widgetTools"
                :key="index"
                :label="item.name"
              >
                <li
                  v-for="(it, idx) in item.list"
                  :key="idx"
                  draggable="true"
                  @dragstart="dragStart(it.code)"
                  @dragend="dragEnd()"
                >
                  <div class="tools-item">
                    <span class="tools-item-icon">
                      <i class="iconfont" :class="it.icon"></i>
                    </span>
                    <span class="tools-item-text">{{ it.label }}</span>
                  </div>
                </li>
              </el-tab-pane>
            </el-tabs>
          </div>
        </el-tab-pane>
        <!-- 左侧图层-->
        <el-tab-pane label="图层">
          <draggable
            v-model="layerWidget"
            @update="datadragEnd"
            :options="{ animation: 300 }"
          >
            <transition-group>
              <div
                v-for="(item, index) in layerWidget"
                :key="'item' + index"
                class="tools-item"
                :class="widgetIndex == index ? 'is-active' : ''"
                @click="layerClick(index)"
              >
                <span class="tools-item-icon">
                  <i class="iconfont" :class="item.icon"></i>
                </span>
                <span class="tools-item-text">{{ item.label }}</span>
              </div>
            </transition-group>
          </draggable>
        </el-tab-pane>
      </el-tabs>
    </div>

    <div
      class="layout-left-fold"
      :style="{ width: widthLeftForToolsHideButton + 'px' }"
      @click="toolIsShow = !toolIsShow"
    >
      <i class="el-icon-arrow-right" />
    </div>

    <div
      class="layout-middle"
      :style="{ width: middleWidth + 'px', height: middleHeight + 'px' }"
    >
      <div class="top-button">
        <span class="btn" @click="saveData">
          <el-tooltip
            class="item"
            effect="dark"
            content="保存"
            placement="bottom"
          >
            <i class="iconfont iconsave"></i>
          </el-tooltip>
        </span>
        <span class="btn" @click="viewScreen">
          <el-tooltip
            class="item"
            effect="dark"
            content="预览"
            placement="bottom"
          >
            <i class="iconfont iconyulan"></i>
          </el-tooltip>
        </span>

        <span class="btn" @click="handleUndo">
          <el-tooltip
            class="item"
            effect="dark"
            content="撤销"
            placement="bottom"
          >
            <i class="iconfont iconundo"></i>
          </el-tooltip>
        </span>

        <span class="btn" @click="handleRedo">
          <el-tooltip
            class="item"
            effect="dark"
            content="恢复"
            placement="bottom"
          >
            <i class="iconfont iconhuifubeifen"></i>
          </el-tooltip>
        </span>

        <span
          :class="{
            btn: true,
            'btn-disable': currentSizeRangeIndex === 0,
          }"
          @click="setSize(0)"
        >
          <el-tooltip
            class="item"
            :disabled="currentSizeRangeIndex === 0"
            effect="dark"
            content="缩小"
            placement="bottom"
          >
            <!-- <svg-icon style="font-size:16px;" icon-class="jianhao" class-name="icon" /> -->
            <i class="el-icon-minus" style="font-size: 16px" />
          </el-tooltip>
        </span>
        <!--
          class="btn scale-num"
          :style="currentSizeRangeIndex === defaultSize.index ? 'cursor: no-drop;' : ''" -->
        <span
          :class="{
            btn: true,
            'scale-num': true,
            'btn-disable': currentSizeRangeIndex === defaultSize.index,
          }"
          @click="setSize(2)"
        >
          <el-tooltip
            class="item"
            :disabled="currentSizeRangeIndex === defaultSize.index"
            effect="dark"
            content="默认比例"
            placement="bottom"
          >
            <span> {{ parseInt(scaleNum) }}% </span>
          </el-tooltip>
        </span>
        <span
          :class="{
            btn: true,
            'btn-disable': currentSizeRangeIndex === 8,
          }"
          @click="setSize(1)"
        >
          <el-tooltip
            class="item"
            :disabled="currentSizeRangeIndex === 8"
            effect="dark"
            content="放大"
            placement="bottom"
          >
            <!-- <svg-icon style="font-size:16px;" icon-class="jiahao" class-name="icon" /> -->
            <i class="el-icon-plus" style="font-size: 16px" />
          </el-tooltip>
        </span>

        <span class="btn" v-permission="'bigScreenManage:export'">
          <el-tooltip
            class="item"
            effect="dark"
            content="导入"
            placement="bottom"
          >
            <el-upload
              class="el-upload"
              ref="upload"
              :action="uploadUrl"
              :headers="headers"
              accept=".zip"
              :on-success="handleUpload"
              :on-error="handleError"
              :show-file-list="false"
              :limit="1"
            >
              <i class="iconfont icondaoru"></i>
            </el-upload>
          </el-tooltip>
        </span>
        <span class="btn border-left" v-permission="'bigScreenManage:import'">
          <ul class="nav">
            <li>
              <i class="iconfont icondaochu"></i
              ><i class="el-icon-arrow-down"></i>
              <ul>
                <li>
                  <el-tooltip
                    class="item"
                    effect="dark"
                    content="适合当前系统"
                    placement="right"
                  >
                    <div @click="exportDashboard(1)">导出(包含数据集)</div>
                  </el-tooltip>
                </li>
                <li>
                  <el-tooltip
                    class="item"
                    effect="dark"
                    content="适合跨系统"
                    placement="right"
                  >
                    <div @click="exportDashboard(0)">导出(不包含数据集)</div>
                  </el-tooltip>
                </li>
              </ul>
            </li>
          </ul>
        </span>
      </div>
      <!-- 中间操作内容  主体 -->
      <!-- :style="{
          width: bigscreenWidthInWorkbench + 'px',
          height: bigscreenHeightInWorkbench + 'px',
        }" -->
      <div class="workbench-container" @mousedown="handleMouseDown">
        <div
          :style="{
            width: (+bigscreenWidth + 18) * bigscreenScaleInWorkbench + 'px',
            height: (+bigscreenHeight + 18) * bigscreenScaleInWorkbench + 'px',
          }"
          class="vue-ruler-tool-wrap"
        >
          <!-- 大屏设计页面的标尺插件 -->
          <vue-ruler-tool
            ref="vue-ruler-tool"
            v-model="dashboard.presetLine"
            class="vueRuler"
            :step-length="50"
            :parent="true"
            :position="'relative'"
            :is-scale-revise="true"
            :visible.sync="dashboard.presetLineVisible"
            :style="{
              width: +bigscreenWidth + 18 + 'px',
              height: +bigscreenHeight + 18 + 'px',
              transform:
                currentSizeRangeIndex === defaultSize.index
                  ? workbenchTransform
                  : `scale(${sizeRange[currentSizeRangeIndex] / 100})`,
              transformOrigin: '0 0',
            }"
          >
            <div
              id="workbench"
              class="workbench"
              :style="{
                width: bigscreenWidth + 'px',
                height: bigscreenHeight + 'px',
                'background-color': dashboard.backgroundColor,
                'background-image': 'url(' + dashboard.backgroundImage + ')',
                'background-position': '0% 0%',
                'background-size': '100% 100%',
                'background-repeat': 'initial',
                'background-attachment': 'initial',
                'background-origin': 'initial',
                'background-clip': 'initial',
              }"
              @click.self="setOptionsOnClickScreen"
              @drop="widgetOnDragged($event)"
              @dragover="dragOver($event)"
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
        </div>
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
            :layer-widget="layerWidget"
            :widget-index="widgetIndex"
            :widget-params-config="widgetParamsConfig"
            @onChanged="(val) => widgetValueChanged('setup', val)"
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
            @onChanged="(val) => widgetValueChanged('data', val)"
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
            @onChanged="(val) => widgetValueChanged('position', val)"
          />
        </el-tab-pane>
      </el-tabs>
    </div>

    <content-menu
      :visible.sync="visibleContentMenu"
      :style-obj="styleObj"
      @deletelayer="deletelayer"
      @lockLayer="lockLayer"
      @noLockLayer="noLockLayer"
      @copylayer="copylayer"
      @istopLayer="istopLayer"
      @setlowLayer="setlowLayer"
      @moveupLayer="moveupLayer"
      @movedownLayer="movedownLayer"
    />
  </div>
</template>

<script>
import {
  insertDashboard,
  detailDashboard,
  importDashboard,
  exportDashboard,
} from "@/api/bigscreen";
import { widgetTools, getToolByCode } from "./tools/index";
import widget from "./widget/widget.vue";
import dynamicForm from "./components/dynamicForm.vue";
import draggable from "vuedraggable";
import VueRulerTool from "vue-ruler-tool"; // 大屏设计页面的标尺插件
import contentMenu from "./components/contentMenu";
import { getToken } from "@/utils/auth";
import { Revoke } from "@/utils/revoke"; //处理历史记录 2022-02-22

export default {
  name: "Login",
  components: {
    draggable,
    VueRulerTool,
    widget,
    dynamicForm,
    contentMenu,
  },
  data() {
    return {
      uploadUrl:
        process.env.BASE_API +
        "/reportDashboard/import/" +
        this.$route.query.reportCode,
      grade: false,
      layerWidget: [],
      widgetTools: widgetTools, // 左侧工具栏的组件图标，将js变量加入到当前作用域
      widthLeftForTools: 200, // 左侧工具栏宽度
      widthLeftForToolsHideButton: 15, // 左侧工具栏折叠按钮宽度
      widthLeftForOptions: 300, // 右侧属性配置区
      widthPaddingTools: 18,
      toolIsShow: true, // 左侧工具栏是否显示

      bigscreenWidth: 1920, // 大屏设计的大小
      bigscreenHeight: 1080,
      revoke: null, //处理历史记录 2022-02-22

      // 工作台大屏画布，保存到表gaea_report_dashboard中
      dashboard: {
        id: null,
        title: "", // 大屏页面标题
        width: 1920, // 大屏设计宽度
        height: 1080, // 大屏设计高度
        backgroundColor: "#1E1E1E", // 大屏背景色
        backgroundImage: "", // 大屏背景图片
        refreshSeconds: null, // 大屏刷新时间间隔
        presetLine: [], // 辅助线
        presetLineVisible: true, // 辅助线是否显示
      },
      // 大屏的标记
      screenCode: "",
      dragWidgetCode: "", //从工具栏拖拽的组件code
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
              zIndex: 0,
            },
          },
          // options属性是从工具栏中拿到的tools中拿到
          options: [],
        },
      ], // 工作区中拖放的组件

      // 当前激活组件
      widgetIndex: 0,
      // 当前激活组件右侧配置属性
      widgetOptions: {
        setup: [], // 配置
        data: [], // 数据
        position: [], // 坐标
      },
      flagWidgetClickStopPropagation: false, // 点击组件时阻止事件冒泡传递到画布click事件上
      styleObj: {
        left: 0,
        top: 0,
      },
      visibleContentMenu: false,
      rightClickIndex: -1,
      activeName: "first",
      scaleNum: 0, // 当前缩放百分比的值
      sizeRange: [20, 40, 60, 80, 100, 150, 200, 300, 400], // 缩放百分比
      currentSizeRangeIndex: -1, // 当前是哪个缩放比分比,
      currentWidgetTotal: 0,
      widgetParamsConfig: [], // 各组件动态数据集的参数配置情况
    };
  },
  computed: {
    step() {
      return Number(100 / (this.bigscreenScaleInWorkbench * 100));
    },
    headers() {
      return {
        Authorization: getToken(), // 直接从本地获取token就行
      };
    },
    // 左侧折叠切换时，动态计算中间区的宽度
    middleWidth() {
      let widthLeftAndRight = 0;
      if (this.toolIsShow) {
        widthLeftAndRight += this.widthLeftForTools; // 左侧工具栏宽度
      }
      widthLeftAndRight += this.widthLeftForToolsHideButton; // 左侧工具栏折叠按钮宽度
      widthLeftAndRight += this.widthLeftForOptions; // 右侧配置栏宽度

      let middleWidth = this.bodyWidth - widthLeftAndRight;
      return middleWidth;
    },
    middleHeight() {
      return this.bodyHeight;
    },
    // 设计台按大屏的缩放比例
    bigscreenScaleInWorkbench() {
      let widthScale =
        (this.middleWidth - this.widthPaddingTools) / this.bigscreenWidth;
      let heightScale =
        (this.middleHeight - this.widthPaddingTools) / this.bigscreenHeight;
      return Math.min(widthScale, heightScale);
    },
    workbenchTransform() {
      return `scale(${this.bigscreenScaleInWorkbench}, ${this.bigscreenScaleInWorkbench})`;
    },
    // 初始的缩放百分比 和 下标
    defaultSize() {
      const obj = {
        index: -1,
        size: "50",
      };
      this.sizeRange.some((item, index) => {
        if (item <= 100 * this.bigscreenScaleInWorkbench) {
          obj.index = index;
          obj.size = 100 * this.bigscreenScaleInWorkbench; // item
        }
      });
      if (obj.index === -1) {
        obj.index = 0;
        obj.size = this.sizeRange[0];
      }
      return obj;
    },
    // 大屏在设计模式的大小
    bigscreenWidthInWorkbench() {
      return this.getPXUnderScale(this.bigscreenWidth) + this.widthPaddingTools;
    },
    bigscreenHeightInWorkbench() {
      return (
        this.getPXUnderScale(this.bigscreenHeight) + this.widthPaddingTools
      );
    },
  },
  watch: {
    widgets: {
      handler(val) {
        this.handlerLayerWidget(val);
        this.handlerdynamicDataParamsConfig(val);
        //以下部分是记录历史
        this.$nextTick(() => {
          this.revoke.push(this.widgets);
        });
      },
      deep: true,
    },
    defaultSize: {
      handler(val) {
        if (val !== -1) {
          this.currentSizeRangeIndex = val.index;
          this.scaleNum = val.size;
        }
      },
      immediate: true,
    },
    bigscreenWidth() {
      this.initVueRulerTool();
    },
    bigscreenHeight() {
      this.initVueRulerTool();
    },
  },
  created() {
    /* 以下是记录历史的 */
    this.revoke = new Revoke();
  },
  mounted() {
    // 如果是新的设计工作台
    this.initEchartData();
    this.widgets = [];
    window.addEventListener("mouseup", () => {
      this.grade = false;
    });
    this.$nextTick(() => {
      this.initVueRulerTool(); // 初始化 修正插件样式
    });
  },
  methods: {
    /**
     * @param num: 0缩小 1放大 2默认比例
     * sizeRange: [20, 40, 60, 72, 100, 150, 200, 300, 400]
     */
    setSize(num) {
      if (num === 0) {
        // 缩小
        if (this.currentSizeRangeIndex === 0) return;
        this.currentSizeRangeIndex -= 1;
      } else if (num === 1) {
        // 放大
        if (this.currentSizeRangeIndex === 8) return;
        this.currentSizeRangeIndex += 1;
      } else if (num === 2) {
        // 正常比例
        this.currentSizeRangeIndex = this.defaultSize.index;
      }
      this.scaleNum =
        this.currentSizeRangeIndex === this.defaultSize.index
          ? this.defaultSize.size
          : this.sizeRange[this.currentSizeRangeIndex];
    },
    // 初始化 修正插件样式
    initVueRulerTool() {
      const vueRulerToolDom = this.$refs["vue-ruler-tool"].$el; // 操作面板 第三方插件工具
      const contentDom = vueRulerToolDom.querySelector(".vue-ruler-content");
      const vueRulerX = vueRulerToolDom.querySelector(".vue-ruler-h"); // 横向标尺
      const vueRulerY = vueRulerToolDom.querySelector(".vue-ruler-v"); // 纵向标尺
      // vueRulerToolDom.style.cssText += ';width:' + (this.bigscreenWidth + 18) + 'px !important;height:' + (this.bigscreenHeight + 18) + 'px !important;'
      contentDom.style.width = "100%";
      contentDom.style.height = "100%";

      let xHtmlContent = ""; // '<span class="n" style="left: 2px;">0</span>'
      let yHtmlContent = ""; // '<span class="n" style="top: 2px;">0</span>'
      let currentNum = 0;
      while (currentNum < +this.bigscreenWidth) {
        xHtmlContent += `<span class="n" style="left: ${
          currentNum + 2
        }px;">${currentNum}</span>`;
        currentNum += 50;
      }
      currentNum = 0;
      while (currentNum < +this.bigscreenHeight) {
        yHtmlContent += `<span class="n" style="top: ${
          currentNum + 2
        }px;">${currentNum}</span>`;
        currentNum += 50;
      }
      vueRulerX.innerHTML = xHtmlContent;
      vueRulerY.innerHTML = yHtmlContent;
    },
    /**
     * @description: 恢复
     * @param {*}
     * @return {*}
     */
    handleUndo() {
      const record = this.revoke.undo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    /**
     * @description: 重做
     * @param {*}
     * @return {*}
     */
    handleRedo() {
      const record = this.revoke.redo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    handlerLayerWidget(val) {
      const layerWidgetArr = [];
      for (let i = 0; i < val.length; i++) {
        const obj = {};
        const myItem = getToolByCode(val[i].type);
        obj.icon = myItem.icon;
        obj.code = myItem.code; // 组件类型code
        obj.widgetId = val[i].value.widgetId || ""; // 唯一id
        if (val[i].value.paramsKeys) {
          obj.paramsKeys = val[i].value.paramsKeys;
        }
        const options = val[i].options["setup"];
        options.forEach((el) => {
          if (el.name == "layerName") {
            obj.label = el.value;
          }
        });
        layerWidgetArr.push(obj);
      }
      this.layerWidget = layerWidgetArr;
    },
    // 返回每个组件的动态数据集参数配置情况
    handlerdynamicDataParamsConfig(val) {
      this.widgetParamsConfig = val.map((item) => {
        return item.value.data;
      });
    },
    async initEchartData() {
      const reportCode = this.$route.query.reportCode;
      const { code, data } = await detailDashboard(reportCode);
      if (code != 200) return;
      const processData = this.handleInitEchartsData(data);
      const screenData = this.handleBigScreen(data.dashboard);
      this.widgets = processData;
      this.dashboard = screenData;
      this.bigscreenWidth = this.dashboard.width;
      this.bigscreenHeight = this.dashboard.height;
    },
    handleBigScreen(data) {
      const optionScreen = getToolByCode("screen").options;
      const setup = optionScreen.setup;
      for (const key in data) {
        for (let i = 0; i < setup.length; i++) {
          if (key == setup[i].name) {
            setup[i].value = data[key];
          }
        }
      }
      this.setOptionsOnClickScreen();
      return {
        backgroundColor:
          (data && data.backgroundColor) || (!data ? "#1e1e1e" : ""),
        backgroundImage: (data && data.backgroundImage) || "",
        height: (data && data.height) || "1080",
        title: (data && data.title) || "",
        width: (data && data.width) || "1920",
      };
    },
    handleInitEchartsData(data) {
      const widgets = data.dashboard ? data.dashboard.widgets : [];
      const widgetsData = [];
      for (let i = 0; i < widgets.length; i++) {
        let obj = {};
        obj.type = widgets[i].type;
        obj.value = {
          setup: widgets[i].value.setup,
          data: widgets[i].value.data,
          position: widgets[i].value.position,
        };
        const tool = this.deepClone(getToolByCode(widgets[i].type));
        if (!tool) {
          const message =
            "暂未提供该组件或该组件下线了，组件code: " + widgets[i].type;
          console.error(message);
          if (process.env.NODE_ENV === "development") {
            // 40@remarks 看生产要不要提示
            this.$message.error(message);
          }
          continue; // 找不到就跳过，避免整个报表都加载不出来
        }
        const option = tool.options;
        const options = this.handleOptionsData(widgets[i].value, option);
        obj.options = options;
        obj.value.widgetId = obj.value.setup.widgetId;
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
              list.forEach((el) => {
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
          backgroundImage: this.dashboard.backgroundImage,
        },
        widgets: this.widgets,
      };
      screenData.widgets.forEach((widget) => {
        widget.value.setup.widgetId = widget.value.widgetId;
      });
      const { code, data } = await insertDashboard(screenData);
      if (code == "200") {
        this.$message.success("保存成功！");
      }
    },
    // 预览
    viewScreen() {
      let routeUrl = this.$router.resolve({
        path: "/bigscreen/viewer",
        query: { reportCode: this.$route.query.reportCode },
      });
      window.open(routeUrl.href, "_blank");
    },
    //  导出
    async exportDashboard(val) {
      const fileName = this.$route.query.reportCode + ".zip";

      const param = {
        reportCode: this.$route.query.reportCode,
        showDataSet: val,
      };
      exportDashboard(param).then((res) => {
        const that = this;
        const type = res.type;
        if (type == "application/json") {
          let reader = new FileReader();
          reader.readAsText(res, "utf-8");
          reader.onload = function () {
            const data = JSON.parse(reader.result);
            that.$message.error(data.message);
          };
          return;
        }

        const blob = new Blob([res], { type: "application/octet-stream" });
        if (window.navigator.msSaveOrOpenBlob) {
          //msSaveOrOpenBlob方法返回bool值
          navigator.msSaveBlob(blob, fileName); //本地保存
        } else {
          const link = document.createElement("a"); //a标签下载
          link.href = window.URL.createObjectURL(blob);
          link.download = fileName;
          link.click();
          window.URL.revokeObjectURL(link.href);
        }
      });
    },
    // 上传成功的回调
    handleUpload(response, file, fileList) {
      //清除el-upload组件中的文件
      this.$refs.upload.clearFiles();
      //刷新大屏页面
      this.initEchartData();
      if (response.code == "200") {
        this.$message({
          message: "导入成功！",
          type: "success",
        });
      } else {
        this.$message({
          message: response.message,
          type: "error",
        });
      }
    },
    handleError(err) {
      this.$message({
        message: "上传失败！",
        type: "error",
      });
    },

    // 在缩放模式下的大小
    getPXUnderScale(px) {
      return this.bigscreenScaleInWorkbench * px;
    },
    dragStart(widgetCode) {
      this.dragWidgetCode = widgetCode;
      this.currentWidgetTotal = this.widgets.length; // 当前操作面板上有多少各组件
    },
    dragEnd() {
      this.dragWidgetCode = "";
      /**
       * 40@remarks 新增组件到操作面板后，右边的配置有更新，但是当前选中的组件没更新，导致配置错乱的bug;
       * 由于拖动组件拖到非操作面板上是不会添加组件，还需判断是否添加组件到操作面板上;
       */
      this.$nextTick(() => {
        if (this.widgets.length === this.currentWidgetTotal + 1) {
          // 确实新增了一个组件到操作面板上
          console.log(
            `新添加 '${
              this.widgets[this.currentWidgetTotal].value.setup.layerName
            }' 组件到操作面板`
          );
          const uuid = Number(Math.random().toString().substr(2)).toString(36);
          this.widgets[this.currentWidgetTotal].value.widgetId = uuid;
          this.layerWidget[this.currentWidgetTotal].widgetId = uuid;
          const index = this.widgets.length - 1;
          this.layerClick(index); // 选中当前新增的组件
          this.grade = false; // 去除网格线
        }
      });
    },
    dragOver(evt) {
      evt.preventDefault();
      evt.stopPropagation();
      evt.dataTransfer.dropEffect = "copy";
    },
    // 拖动一个组件放到工作区中去，在拖动结束时，放到工作区对应的坐标点上去
    widgetOnDragged(evt) {
      let widgetType = this.dragWidgetCode;

      // 获取结束坐标和列名
      let eventX = evt.clientX; // 结束在屏幕的x坐标
      let eventY = evt.clientY; // 结束在屏幕的y坐标

      let workbenchPosition = this.getDomTopLeftById("workbench");
      let widgetTopInWorkbench = eventY - workbenchPosition.top;
      let widgetLeftInWorkbench = eventX - workbenchPosition.left;

      const targetScale =
        this.currentSizeRangeIndex === this.defaultSize.index
          ? this.bigscreenScaleInWorkbench
          : this.sizeRange[this.currentSizeRangeIndex] / 100;
      // 计算在缩放模式下的x y
      // const x = widgetLeftInWorkbench / this.bigscreenScaleInWorkbench
      // const y = widgetTopInWorkbench / this.bigscreenScaleInWorkbench
      const x = widgetLeftInWorkbench / targetScale;
      const y = widgetTopInWorkbench / targetScale;

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
            zIndex: 0,
          },
        },
        options: tool.options,
      };
      // 处理默认值
      const widgetJsonValue = this.handleDefaultValue(widgetJson);

      //2022年02月22日 修复：可以拖拽放到鼠标的位置
      widgetJsonValue.value.position.left =
        x - widgetJsonValue.value.position.width / 2;
      widgetJsonValue.value.position.top =
        y - widgetJsonValue.value.position.height / 2;

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
                list.forEach((el) => {
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
    layerClick(index) {
      this.widgetIndex = index;
      this.widgetsClick(index);
    },
    // 如果是点击大屏设计器中的底层，加载大屏底层属性
    setOptionsOnClickScreen() {
      this.screenCode = "screen";
      // 选中不同的组件 右侧都显示第一栏
      this.activeName = "first";
      this.widgetOptions = getToolByCode("screen")["options"];
    },

    // 如果是点击某个组件，获取该组件的配置项
    setOptionsOnClickWidget(obj) {
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
      this.widgets[obj.index].options.position.forEach((el) => {
        for (const key in obj) {
          if (el.name == key) {
            el.value = obj[key];
          }
        }
      });
      this.widgetOptions = this.deepClone(this.widgets[obj.index]["options"]);
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
    },
    handleMouseDown() {
      const draggableArr = this.$refs.widgets;
      for (let i = 0; i < draggableArr.length; i++) {
        this.$refs.widgets[i].$refs.draggable.setActive(false);
      }
    },
    // 将当前选中的组件，右侧属性值更新
    widgetValueChanged(key, val) {
      console.log("key", key);
      console.log("val", val);
      console.log(this.widgetOptions);
      if (this.screenCode == "screen") {
        let newSetup = new Array();
        this.dashboard = this.deepClone(val);
        console.log("asd", this.dashboard);
        console.log(this.widgetOptions);
        if (this.bigscreenWidth != this.dashboard.width) {
          this.bigscreenWidth = this.dashboard.width;
        }
        if (this.bigscreenHeight != this.dashboard.height) {
          this.bigscreenHeight = this.dashboard.height;
        }
        this.widgetOptions.setup.forEach((el) => {
          if (el.name == "width") {
            el.value = this.bigscreenWidth;
          } else if (el.name == "height") {
            el.value = this.bigscreenHeight;
          } else if (this.dashboard.hasOwnProperty(el.name)) {
            el["value"] = this.dashboard[el.name];
          }
          newSetup.push(el);
        });
        console.log(newSetup);
        this.widgetOptions.setup = newSetup;
      } else {
        for (let i = 0; i < this.widgets.length; i++) {
          if (this.widgetIndex == i) {
            this.widgets[i].value[key] = this.deepClone(val);
            this.setDefaultValue(this.widgets[i].options[key], val);
          }
        }
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
          display: "block",
        };
      }
      this.visibleContentMenu = true;
      return false;
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
    },
    datadragEnd(evt) {
      evt.preventDefault();
      this.widgets = this.swapArr(this.widgets, evt.oldIndex, evt.newIndex);
    },
    // 数组 元素互换位置
    swapArr(arr, oldIndex, newIndex) {
      arr[oldIndex] = arr.splice(newIndex, 1, arr[oldIndex])[0];
      return arr;
    },
    // 删除
    deletelayer() {
      this.widgets.splice(this.rightClickIndex, 1);
    },
    // 锁定
    lockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", true);
    },
    //  解除锁定
    noLockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", false);
    },
    // 复制
    copylayer() {
      const obj = this.deepClone(this.widgets[this.rightClickIndex]);
      obj.value.position.top += 40; // 复制的元素向右下角偏移一点
      obj.value.position.left += 40;
      obj.value.widgetId = Number(Math.random().toString().substr(2)).toString(
        36
      );
      this.widgets.splice(this.widgets.length, 0, obj);
      this.$nextTick(() => {
        this.layerClick(this.widgets.length - 1); // 复制后定位到最新的组件
      });
    },
    // 置顶
    istopLayer() {
      if (this.rightClickIndex + 1 < this.widgets.length) {
        const temp = this.widgets.splice(this.rightClickIndex, 1)[0];
        this.widgets.push(temp);
      }
    },
    // 置底
    setlowLayer() {
      if (this.rightClickIndex != 0) {
        this.widgets.unshift(this.widgets.splice(this.rightClickIndex, 1)[0]);
      }
    },
    // 上移一层
    moveupLayer() {
      if (this.rightClickIndex != 0) {
        this.widgets[this.rightClickIndex] = this.widgets.splice(
          this.rightClickIndex - 1,
          1,
          this.widgets[this.rightClickIndex]
        )[0];
      } else {
        this.widgets.push(this.widgets.shift());
      }
    },
    // 下移一层
    movedownLayer() {
      if (this.rightClickIndex != this.widgets.length - 1) {
        this.widgets[this.rightClickIndex] = this.widgets.splice(
          this.rightClickIndex + 1,
          1,
          this.widgets[this.rightClickIndex]
        )[0];
      } else {
        this.widgets.unshift(this.widgets.splice(this.rightClickIndex, 1)[0]);
      }
    },
  },
};
</script>

<style scoped lang="scss">
.mr10 {
  margin-right: 10px;
}

.ml20 {
  margin-left: 20px;
}

.border-right {
  border-right: 1px solid #273b4d;
}

.border-left {
  border-left: 1px solid #273b4d;
}

.el-icon-arrow-down {
  font-size: 10px;
}

.is-active {
  background: #31455d !important;
  color: #bfcbd9 !important;
}

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

    font-size: 12px;
    overflow: hidden;
    background-color: #242a30;
    cursor: pointer;
    padding-top: 26%;

    i {
      font-size: 18px;
      width: 18px;
      height: 23px;
      margin-left: 0px;
      color: #bfcbd9;
    }
  }

  .layout-middle {
    // display: flex;
    position: relative;
    //width: calc(100% - 445px);
    height: 100%;
    background-color: rgb(36, 42, 48);
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    border: 1px solid rgb(36, 42, 48);
    align-items: center;
    vertical-align: middle;
    text-align: center;

    .top-button {
      display: flex;
      flex-direction: row;
      height: 40px;
      line-height: 40px;
      margin-left: 9px;

      .btn {
        color: #788994;
        width: 55px;
        text-align: center;
        display: block;
        cursor: pointer;

        .el-icon-arrow-down {
          transform: rotate(0deg);
          -ms-transform: rotate(0deg); /* IE 9 */
          -moz-transform: rotate(0deg); /* Firefox */
          -webkit-transform: rotate(0deg); /* Safari 和 Chrome */
          -o-transform: rotate(0deg); /* Opera */
          transition: all 0.4s ease-in-out;
        }

        &:hover {
          background: rgb(25, 29, 34);

          .el-icon-arrow-down {
            transform: rotate(180deg);
            -ms-transform: rotate(180deg); /* IE 9 */
            -moz-transform: rotate(180deg); /* Firefox */
            -webkit-transform: rotate(180deg); /* Safari 和 Chrome */
            -o-transform: rotate(180deg); /* Opera */
            transition: all 0.4s ease-in-out;
          }
        }
      }
      .btn-disable {
        opacity: 0.3;
        cursor: no-drop;
      }
      .scale-num {
        color: #788994;
        opacity: 1;
        cursor: pointer;
        &.btn-disable {
          cursor: no-drop;
          &:hover {
            background: #20262c;
          }
        }
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
      overflow: auto;

      .vueRuler {
        // width: 100%;
        // padding: 18px 0px 0px 18px;
        padding: 0;
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
        background-image: linear-gradient(
            hsla(0, 0%, 100%, 0.1) 1px,
            transparent 0
          ),
          linear-gradient(90deg, hsla(0, 0%, 100%, 0.1) 1px, transparent 0);
        // z-index: 2;
      }
    }

    .bottom-text {
      width: 100%;
      color: #a0a0a0;
      font-size: 16px;
      position: absolute;
      bottom: 20px;
    }
  }

  .layout-right {
    display: inline-block;
    height: 100%;
  }

  /deep/ .el-tabs--border-card {
    border: 0;

    .el-tabs__header {
      .el-tabs__nav {
        .el-tabs__item {
          background-color: #242f3b;
          border: 0px;
        }

        .el-tabs__item.is-active {
          background-color: #31455d;
        }
      }
    }

    .el-tabs__content {
      background-color: #242a30;
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
        // -webkit-border-radius: 7px;
      }

      /*修改水平滚动条的样式*/
      &::-webkit-scrollbar-thumb:horizontal {
        background-color: #00113a;
        // -webkit-border-radius: 7px;
      }
    }
  }
}

ul,
li {
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav {
  width: 40px;
  padding: 0;
  list-style: none;
  /* overflow: hidden; */
}

.nav {
  zoom: 1;
}

.nav:before,
.nav:after {
  content: "";
  display: table;
}

.nav:after {
  clear: both;
}

.nav > li {
  width: 55px;
  text-align: left;
  position: relative;
}

.nav > li a {
  float: left;
  padding: 12px 30px;
  color: #999;
  font: bold 12px;
  text-decoration: none;
}

.nav > li:hover {
  color: #788994;
}

.nav > li ul {
  visibility: hidden;
  position: absolute;
  z-index: 1000;
  list-style: none;
  left: 0;
  padding: 0;
  background-color: rgb(36, 42, 48);
  opacity: 0;
  _margin: 0;
  width: 120px;
  transition: all 0.2s ease-in-out;
}

.nav > li:hover > ul {
  opacity: 1;
  visibility: visible;
  margin: 0;

  li:hover {
    background-color: rgb(25, 29, 34);
  }
}

.nav ul li {
  float: left;
  display: block;
  border: 0;
  width: 100%;
  font-size: 12px;
}

.nav ul a {
  padding: 10px;
  width: 100%;
  display: block;
  float: none;
  height: 120px;
  border: 1px solid #30445c;
  background-color: rgb(25, 29, 34);
  transition: all 0.2s ease-in-out;
}

.nav ul a:hover {
  border: 1px solid #3c5e88;
}

.nav ul li:first-child > a:hover:before {
  border-bottom-color: #04acec;
}

.nav ul ul {
  top: 0;
  left: 120px;
  width: 400px;
  height: 300px;
  overflow: auto;
  padding: 10px;
  _margin: 0;
}

.nav ul ul li {
  width: 120px;
  height: 120px;
  margin-right: 3px;
  display: block;
  float: left;
}

.nav .item {
  padding: 5px;
}

/deep/ .vue-ruler-h {
  opacity: 0.3;
}

/deep/ .vue-ruler-v {
  opacity: 0.3;
}
.layout-left {
  width: 200px;
  background: #242a30;
  overflow-x: hidden;
  overflow-y: auto;
  .chart-type {
    display: flex;
    flex-direction: row;
    overflow: hidden;
    .type-left {
      width: 100%;
      height: calc(100vh - 80px);
      text-align: center;
      /deep/.el-tabs__header {
        width: 30%;
        margin-right: 0;
        .el-tabs__nav-wrap {
          &::after {
            background: transparent;
          }
          .el-tabs__item {
            text-align: center;
            width: 100% !important;
            color: #fff;
            padding: 0;
            font-size: 12px !important;
          }
        }
      }
      /deep/.el-tabs__content {
        width: 70%;
      }
    }
  }
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
      font-size: 12px !important;
    }
  }
  /deep/.el-tabs__content {
    padding: 0;
  }
}
/* 设置滚动条的样式 */

::-webkit-scrollbar {
  width: 0;
  height: 10px;
}
</style>
