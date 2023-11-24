<!--
 * @Descripttion: 大屏报表设计器-主体页面
 * @Author: Devli
 * @Date: 2021-3-19 10:23:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2023-03-17 17:38:44
-->
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
      <i class="el-icon-arrow-right"/>
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
            <i class="el-icon-minus" style="font-size: 16px"/>
          </el-tooltip>
        </span>
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
            <i class="el-icon-plus" style="font-size: 16px"/>
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
                @mouseup.prevent.native="grade = false"
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
import {widgetTools, getToolByCode} from "./tools/index";
import mixin from "@/utils/screenMixins";
import widget from "./widget/widget.vue";
import dynamicForm from "./components/dynamicForm.vue";
import draggable from "vuedraggable";
import VueRulerTool from "vue-ruler-tool"; // 大屏设计页面的标尺插件
import contentMenu from "./components/contentMenu";

export default {
  name: "Login",
  components: {
    draggable,
    VueRulerTool,
    widget,
    dynamicForm,
    contentMenu,
  },
  mixins: [mixin],
  data() {
    return {
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

      dashboard: {},

      // 大屏的标记
      screenCode: "",
      dragWidgetCode: "", //从工具栏拖拽的组件code
      // 大屏画布中的组件
      widgets: [], // 工作区中拖放的组件
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

      activeName: "first",
      scaleNum: 0, // 当前缩放百分比的值
      sizeRange: [20, 40, 60, 80, 100, 150, 200, 300, 400], // 缩放百分比
      currentSizeRangeIndex: -1, // 当前是哪个缩放比分比,
      currentWidgetTotal: 0,
      widgetParamsConfig: [], // 各组件动态数据集的参数配置情况
    };
  },
  computed: {
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
        this.getLayerData(val);
        this.handlerdynamicDataParamsConfig(val);
        //以下部分是记录历史
        this.$nextTick(() => {
          this.revoke.push(this.widgets);
        });
      },
      deep: true,
    },
  },
  mounted() {
    this.widgets = [];
    window.addEventListener("mouseup", () => {
      this.grade = false;
    });
    this.$nextTick(() => {
      this.initVueRulerTool(); // 初始化 修正插件样式
    });
  },
  methods: {
    // 获取图层数据
    getLayerData(val) {
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
    // 在缩放模式下的大小
    getPXUnderScale(px) {
      return this.bigscreenScaleInWorkbench * px;
    },
    dragStart(widgetCode) {
      this.dragWidgetCode = widgetCode;
      this.currentWidgetTotal = this.widgets.length; // 当前操作面板上有多少各组件
    },
    dragEnd() {
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
          this.widgets[this.currentWidgetTotal].value.widgetCode = this.dragWidgetCode;
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
      const widgetJsonValue = this.getWidgetConfigValue(widgetJson);

      widgetJsonValue.value.position.left =
        x - widgetJsonValue.value.position.width / 2;
      widgetJsonValue.value.position.top =
        y - widgetJsonValue.value.position.height / 2;

      // 将选中的复制组件，放到工作区中去
      this.widgets.push(this.deepClone(widgetJsonValue));
      // 激活新组件的配置属性
      this.setOptionsOnClickWidget(this.widgets.length - 1);
    },
    getWidgetConfigValue(widgetJson) {
      this.setWidgetConfigValue(
        widgetJson.options.setup,
        widgetJson.value.setup
      );
      this.setWidgetConfigValue(
        widgetJson.options.position,
        widgetJson.value.position
      );
      this.setWidgetConfigValue(widgetJson.options.data, widgetJson.value.data);

      return widgetJson;
    },
    setWidgetConfigValue(config, configValue) {
      // 循环遍历前非空判断
      if (config) {
        config.forEach((item) => {
          if (this.isObjectFn(item)) {
            configValue[item.name] = item.value;
          }
          if (this.isArrayFn(item)) {
            item.forEach((itemChild) => {
              itemChild.list.forEach((ev) => {
                configValue[ev.name] = ev.value;
              });
            });
          }
        });
      }
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
        let newSetup = [];
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
    setDefaultValue(options, val) {
      for (let i = 0; i < options.length; i++) {
        if (this.isObjectFn(options[i])) {
          for (const k in val) {
            if (options[i].name == k) {
              options[i].value = val[k];
            }
          }
        } else if (this.isArrayFn(options[i])) {
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
  },
};
</script>

<style scoped lang="scss">
@import "@/assets/styles/screen.scss";
</style>
