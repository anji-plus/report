<template>
  <div class="layout">
    <div class="layout-container">
      <!-- 图表 -->
      <el-tabs class="layout-left" type="border-card">
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date icon"></i>工具栏</span>
          <div class="chart-type">
            <el-tabs class="type-left" tab-position="left">
              <el-tab-pane
                v-for="(item, index) in widgetTools"
                :key="index"
                :label="item.name"
              >
                <draggable
                  v-for="(it, idx) in item.list"
                  :key="idx"
                  @end="evt => widgetOnDragged(evt, it.code)"
                >
                  <div class="tools-item">
                    <span class="tools-item-icon">
                      <i class="iconfont" :class="it.icon"></i>
                    </span>
                    <span class="tools-item-text">{{ it.label }}</span>
                  </div>
                </draggable>
              </el-tab-pane>
            </el-tabs>
          </div>
        </el-tab-pane>
        <el-tab-pane>
          <span slot="label" class="icon"
            ><i class="el-icon-date icon"></i>图层</span
          >
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
        </el-tab-pane>
      </el-tabs>

      <div
        class="layout-middle"
        :style="{
          width: middleWidth + 'px',
          height: middleHeight + 'px'
        }"
      >
        <!-- 操作栏 -->
        <div class="layout-bar">
          <div class="bar-item" @click="saveData">
            <i class="iconfont iconsave"></i>保存
          </div>
          <div class="bar-item" @click="viewScreen">
            <i class="iconfont iconyulan"></i>预览
          </div>
          <div class="bar-item" @click="handleUndo">
            <i class="iconfont iconundo"></i>撤销
          </div>
          <div class="bar-item" @click="handleRedo">
            <i class="iconfont iconhuifubeifen"></i>恢复
          </div>
          <div class="bar-item">
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
            导入
          </div>
          <div class="bar-item">
            <i class="iconfont icondaochu"></i>
            <el-dropdown @command="exportDashboard">
              <span class="el-dropdown-link">
                导出<i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="1"
                  >导出(包含数据集)</el-dropdown-item
                >
                <el-dropdown-item command="0"
                  >导出(不包含数据集)</el-dropdown-item
                >
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
        <!-- 设计器 -->
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
        </div>
      </div>

      <!-- 设置 -->
      <div class="layout-right">
        <el-tabs v-model="activeName" type="border-card" :stretch="true">
          <el-tab-pane
            v-if="
              isNotNull(widgetOptions.setup) ||
                isNotNull(widgetOptions.collapse)
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
    </div>

    <content-menu
      :visible.sync="visibleContentMenu"
      :style-obj="styleObj"
      @deletelayer="deletelayer"
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
  exportDashboard
} from "@/api/bigscreen";
import {
  swapArr,
  setDefaultValue,
  handleDefaultValue,
  getPXUnderScale,
  handleInitEchartsData,
  handleBigScreen,
  handlerLayerWidget
} from "./util/screen";
import { screenConfig } from "./config/texts/screenConfig.js";
import { widgetTools, getToolByCode } from "./config/index.js";
import VueRulerTool from "vue-ruler-tool"; // 大屏设计页面的标尺插件
import widget from "./widget/index.vue";
import dynamicForm from "./components/dynamicForm.vue";
import draggable from "vuedraggable";
import contentMenu from "./components/contentMenu";
import { getToken } from "@/utils/auth";
import { Revoke } from "@/utils/revoke"; //处理历史记录 2022-02-22
export default {
  components: {
    VueRulerTool,
    widget,
    dynamicForm,
    draggable,
    contentMenu
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
    step() {
      return Number(100 / (this.bigscreenScaleInWorkbench * 100));
    },
    headers() {
      return {
        Authorization: getToken() // 直接从本地获取token就行
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
      return `scale(${this.bigscreenScaleInWorkbench}, ${
        this.bigscreenScaleInWorkbench
      })`;
    },
    // 大屏在设计模式的大小
    bigscreenWidthInWorkbench() {
      return (
        getPXUnderScale(this.bigscreenScaleInWorkbench, this.bigscreenWidth) +
        this.widthPaddingTools
      );
    },
    bigscreenHeightInWorkbench() {
      return (
        getPXUnderScale(this.bigscreenScaleInWorkbench, this.bigscreenHeight) +
        this.widthPaddingTools
      );
    }
  },
  watch: {
    widgets: {
      handler(val) {
        this.layerWidget = handlerLayerWidget(val, getToolByCode);
        //以下部分是记录历史
        this.$nextTick(() => {
          this.revoke.push(this.widgets);
        });
      },
      deep: true
    }
  },
  created() {
    /* 以下是记录历史的 */
    this.revoke = new Revoke();
  },
  mounted() {
    this.initScreen();
    // 如果是新的设计工作台
    // this.initEchartData();
    this.widgets = [];
    window.addEventListener("mouseup", () => {
      this.grade = false;
    });
  },
  methods: {
    // 初始化大屏
    initScreen() {
      this.widgetOptions = screenConfig["options"];
    },
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
    // 如果是点击大屏设计器中的底层，加载大屏底层属性
    setOptionsOnClickScreen() {
      this.screenCode = "screen";
      // 选中不同的组件 右侧都显示第一栏
      this.activeName = "first";
      this.widgetOptions = screenConfig["options"];
    },
    layerClick(index) {
      this.widgetIndex = index;
      this.widgetsClick(index);
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
    datadragEnd(evt) {
      evt.preventDefault();
      this.widgets = swapArr(this.widgets, evt.oldIndex, evt.newIndex);
    },
    // 保存
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
      let routeUrl = this.$router.resolve({
        path: "/screen/preview",
        query: { reportCode: this.$route.query.reportCode }
      });
      window.open(routeUrl.href, "_blank");
    },
    // 撤销
    handleRedo() {
      const record = this.revoke.redo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    // 恢复
    handleUndo() {
      const record = this.revoke.undo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    // 导入  成功回调
    handleUpload(response, file, fileList) {
      //清除el-upload组件中的文件
      this.$refs.upload.clearFiles();
      //刷新大屏页面
      this.initEchartData();
      if (response.code == "200") {
        this.$message({
          message: "导入成功！",
          type: "success"
        });
      } else {
        this.$message({
          message: response.message,
          type: "error"
        });
      }
    },
    // 导入失败
    handleError(err) {
      this.$message({
        message: "上传失败！",
        type: "error"
      });
    },
    // 导出
    async exportDashboard(val) {
      console.log(val);
      const fileName = this.$route.query.reportCode + ".zip";

      const param = {
        reportCode: this.$route.query.reportCode,
        showDataSet: val
      };
      exportDashboard(param).then(res => {
        const that = this;
        const type = res.type;
        if (type == "application/json") {
          let reader = new FileReader();
          reader.readAsText(res, "utf-8");
          reader.onload = function() {
            const data = JSON.parse(reader.result);
            that.$message.error(data.message);
          };
          return;
        }

        const blob = new Blob([res], {
          type: "application/octet-stream"
        });
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
    // 删除
    deletelayer() {
      this.widgets.splice(this.rightClickIndex, 1);
    },
    // 复制
    copylayer() {
      const obj = this.deepClone(this.widgets[this.rightClickIndex]);
      this.widgets.splice(this.widgets.length, 0, obj);
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
    }
  }
};
</script>
<style scoped lang="scss">
@import "../../assets/styles/screenDesigner.scss";
</style>
