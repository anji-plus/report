import { Revoke } from "@/utils/revoke";
import { getToken } from "@/utils/auth";
import { getToolByCode } from "@/views/bigscreenDesigner/designer/tools/index";
import { insertDashboard, detailDashboard, exportDashboard, } from "@/api/bigscreen";
const mixin = {
  data() {
    return {
      reportCode: this.$route.query.reportCode,
      uploadUrl: process.env.BASE_API + "/reportDashboard/import/" + this.$route.query.reportCode,
      revoke: null, //处理历史记录
      rightClickIndex: -1,
      rightClickWidget: null,
    }
  },
  computed: {
    step() {
      return Number(100 / (this.bigscreenScaleInWorkbench * 100));
    },
    headers() {
      return {
        Authorization: getToken(),
      };
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
          obj.size = 100 * this.bigscreenScaleInWorkbench;
        }
      });
      if (obj.index === -1) {
        obj.index = 0;
        obj.size = this.sizeRange[0];
      }
      return obj;
    },
  },
  watch: {
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
    this.revoke = new Revoke();
    this.getData();
  },
  methods: {
    /**
  * @param num: 0缩小 1放大 2默认比例
  * sizeRange: [20, 40, 60, 72, 100, 150, 200, 300, 400]
  */
    setSize(num) {
      switch (num) {
        case 0: this.currentSizeRangeIndex === 0 ? '' : this.currentSizeRangeIndex -= 1;
          break;
        case 1: this.currentSizeRangeIndex === 8 ? '' : this.currentSizeRangeIndex += 1;
          break;
        case 2: this.currentSizeRangeIndex = this.defaultSize.index;
      }
      this.scaleNum = this.currentSizeRangeIndex === this.defaultSize.index ? this.defaultSize.size : this.sizeRange[this.currentSizeRangeIndex];
    },
    // 初始化 修正插件样式
    initVueRulerTool() {
      const vueRulerToolDom = this.$refs["vue-ruler-tool"].$el; // 操作面板 第三方插件工具
      const contentDom = vueRulerToolDom.querySelector(".vue-ruler-content");
      const vueRulerX = vueRulerToolDom.querySelector(".vue-ruler-h"); // 横向标尺
      const vueRulerY = vueRulerToolDom.querySelector(".vue-ruler-v"); // 纵向标尺
      contentDom.style.width = "100%";
      contentDom.style.height = "100%";

      let xHtmlContent = "";
      let yHtmlContent = "";
      let currentNum = 0;
      while (currentNum < +this.bigscreenWidth) {
        xHtmlContent += `<span class="n" style="left: ${currentNum + 2}px;">${currentNum}</span>`;
        currentNum += 50;
      }
      currentNum = 0;
      while (currentNum < +this.bigscreenHeight) {
        yHtmlContent += `<span class="n" style="top: ${currentNum + 2}px;">${currentNum}</span>`;
        currentNum += 50;
      }
      vueRulerX.innerHTML = xHtmlContent;
      vueRulerY.innerHTML = yHtmlContent;
    },
    // 初始化接口数据
    async getData() {
      const { code, data } = await detailDashboard(this.reportCode);
      if (code != 200) return;
      this.widgets = this.initWidgetsData(data);
      this.dashboard = this.initScreenData(data.dashboard);
      this.bigscreenWidth = this.dashboard.width;
      this.bigscreenHeight = this.dashboard.height;
    },
    // 组件数据
    initWidgetsData(data) {
      const widgets = data.dashboard ? data.dashboard.widgets : [];
      const widgetsData = [];
      for (let i = 0; i < widgets.length; i++) {
        const widget = widgets[i]
        const { setup, data, position } = { ...widget.value }
        const obj = {
          type: widget.type,
          value: { setup, data, position }
        };
        const tool = this.deepClone(getToolByCode(widget.type));
        if (!tool) {
          const message = "暂未提供该组件或该组件下线了，组件code: " + widget.type;
          if (process.env.NODE_ENV === "development") {
            this.$message.error(message);
          }
          continue; // 找不到就跳过，避免整个报表都加载不出来
        }
        obj.options = this.setDefaultWidgetConfigValue(widget.value, tool.options);
        obj.value.widgetId = obj.value.setup.widgetId;
        widgetsData.push(obj);
      }
      return widgetsData;
    },
    // 重写默认数据
    setDefaultWidgetConfigValue(data, option) {
      this.setConfigValue(data.setup, option.setup)
      this.setConfigValue(data.position, option.position)
      this.setConfigValue(data.data, option.data)
      return option;
    },
    setConfigValue(objValue, setup) {
      Object.keys(objValue).forEach(key => {
        setup.forEach(item => {
          if (this.isObjectFn(item) && key == item.name) {
            item.value = objValue[key]
          }
          if (this.isArrayFn(item)) {
            item.forEach(itemChild => {
              itemChild.list.forEach(el => {
                if (key == el.name) {
                  el.value = objValue[key]
                }
              })
            })
          }
        })
      })
    },
    // 大屏数据
    initScreenData(data) {
      const optionScreen = getToolByCode("screen").options;
      this.setConfigValue(data, optionScreen.setup)
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
    // 保存数据
    async saveData() {
      if (!this.widgets || this.widgets.length == 0) {
        return this.$message.error("请添加组件");
      }
      const { title, width, height, backgroundColor, backgroundImage, refreshSeconds } = { ...this.dashboard }
      const screenData = {
        reportCode: this.reportCode,
        dashboard: { title, width, height, backgroundColor, backgroundImage, refreshSeconds },
        widgets: this.widgets,
      };
      screenData.widgets.forEach((widget) => {
        widget.value.setup.widgetId = widget.value.widgetId;
        widget.value.setup.widgetCode = widget.type
      });
      const { code, data } = await insertDashboard(screenData);
      if (code == "200") return this.$message.success("保存成功！");
    },
    // 预览
    viewScreen() {
      let routeUrl = this.$router.resolve({
        path: "/bigscreen/viewer",
        query: { reportCode: this.reportCode },
      });
      window.open(routeUrl.href, "_blank");
    },
    async exportDashboard(val) {
      const fileName = this.reportCode + ".zip";

      const param = {
        reportCode: this.reportCode,
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
    handleUndo() {
      const record = this.revoke.undo();
      if (!record) return false;
      this.widgets = record;
    },
    handleRedo() {
      const record = this.revoke.redo();
      if (!record) return false;
      this.widgets = record;
    },
    handleUpload(response, file, fileList) {
      this.$refs.upload.clearFiles();
      this.getData();
      if (response.code == "200") return this.$message.success('导入成功！')
      this.$message.error(response.message)
    },
    // 右键
    rightClick(event, index) {
      this.rightClickIndex = index;
      this.rightClickWidget = this.widgets[index];
      const left = event.clientX;
      const top = event.clientY;
      if (left || top) {
        this.styleObj = {
          left: left + "px",
          top: top + "px",
          display: "block",
        };
      }
      //设置多选和单选的菜单项展示
      document.getElementsByName("singleSelect").forEach(e=>{
        e.style.display= this.selectedWidgets.length >= 2 ?"none":"block";
      });
      document.getElementsByName("mulSelect").forEach(e=>{
        e.style.display= this.selectedWidgets.length >= 2 ?"block":"none";
      })
      this.visibleContentMenu = true;
      return false;
    },
    // 数组 元素互换位置
    swapArr(arr, oldIndex, newIndex) {
      arr[oldIndex] = arr.splice(newIndex, 1, arr[oldIndex])[0];
      return arr;
    },
    // 删除
    deletelayer() {
      let _this = this;
      this.widgets.splice(this.rightClickIndex, 1);
      this.selectedWidgets.forEach(sw=>{
        _this.widgets = _this.widgets.filter(w=>w.value.widgetId !== sw.value.widgetId);
      })
    },
    // 锁定
    lockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", true);
    },
    // 解除锁定
    noLockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", false);
    },
    // 复制
    copylayer() {
      if (this.selectedWidgets.length === 1) {
        // 单选复制
        const obj = this.deepClone(this.widgets[this.rightClickIndex]);
        obj.value.position.top += 40; // 复制的元素向右下角偏移一点
        obj.value.position.left += 40;
        obj.value.widgetId = Number(
          Math.random()
            .toString()
            .substr(2)
        ).toString(36);
        this.widgets.splice(this.widgets.length, 0, obj);
        this.$nextTick(() => {
          this.layerClick(this.widgets.length - 1); // 复制后定位到最新的组件
        });
      } else {
        // 多选复制
        this.handleMouseDown();
        const selectedWidgets = [];
        const selectedWidgetsDom = [];
        this.widgets.filter(c => {
          this.selectedWidgets.filter(d => {
            if (c.value.widgetId === d.value.widgetId) {
              selectedWidgets.push(c)
              selectedWidgetsDom.push(d)
            }
          })
        })
        this.selectedWidgets = [];
        selectedWidgets.map((sw, index) => {
          const newSw = this.deepClone(sw)
          newSw.value.position.left += 100;
          newSw.value.widgetId = Number(
            Math.random()
              .toString()
              .substr(2)
          ).toString(36);
          this.widgets.push(newSw);
          this.$nextTick(() => {
            this.$refs.widgets.map(select => {
              if (select.value.widgetId === newSw.value.widgetId) {
                this.$nextTick(() => {
                  select.$refs.draggable.setActive(true);
                  this.selectedWidgets.push(select);
                });
              }
            })
          })
        })
      }
    },
    // 置顶
    istopLayer() {
      if (this.rightClickIndex + 1 < this.widgets.length) {
        const temp = this.widgets.splice(this.rightClickIndex, 1)[0];
        this.widgets.push(temp);
      }
      this.widgetIndex = this.widgets.indexOf(this.rightClickWidget);
      this.widgetsClickFocus(this.widgetIndex);
    },
    // 置底
    setlowLayer() {
      if (this.rightClickIndex != 0) {
        this.widgets.unshift(this.widgets.splice(this.rightClickIndex, 1)[0]);
      }
      this.widgetIndex = this.widgets.indexOf(this.rightClickWidget);
      this.widgetsClickFocus(this.widgetIndex);
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
      this.widgetIndex = this.widgets.indexOf(this.rightClickWidget);
      this.widgetsClickFocus(this.widgetIndex);
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
      this.widgetIndex = this.widgets.indexOf(this.rightClickWidget);
      this.widgetsClickFocus(this.widgetIndex);
    },
    //对齐
    alignment(align) {
      if(this.selectedWidgets.length <= 1) {
        this.$message.error("请至少选择两个组件对齐");
        return;
      }
      console.log("对齐方式：" + align);
      let topWidget = this.selectedWidgets[0]; //最上组件(左右对齐使用)
      let leftWidget = this.selectedWidgets[0]; //最左组件(上下对齐使用)
      let minTop = this.selectedWidgets[0].value.position.top;
      let minLeft = this.selectedWidgets[0].value.position.left;
      //如果是框选的话，以【最上组件】【最左组件】为标准对齐;如果是Ctrl多选方式，则以第一个选中的组件为标准对齐，组合多选以框选逻辑为准
      if(this.kuangSelectFlag){
        for(let i = 0; i< this.selectedWidgets.length; i++){
          let widget = this.selectedWidgets[i];
          if( minTop > widget.value.position.top){
            minTop = widget.value.position.top;
            topWidget = widget;
          }
          if( minLeft > widget.value.position.left){
            minLeft = widget.value.position.left;
            leftWidget = widget;
          }
        }
      }
      for(let i = 0; i< this.selectedWidgets.length; i++){
        let widget = this.selectedWidgets[i];
        this.$refs.widgets.forEach(w=>{
          if(w.value.widgetId === widget.value.widgetId){
            w.$refs.draggable.setActive(false);
          }
        });
        this.widgets.forEach(w=>{
          if(w.value.widgetId === widget.value.widgetId){
            switch (align){
              case "left":  //左对齐
                w.value.position.left = topWidget.value.position.left;
                break;
              case "right":  //右对齐
                w.value.position.left = topWidget.value.position.left + topWidget.value.position.width - w.value.position.width;
                break;
              case "horizontal_center":  //左右居中对齐
                w.value.position.left = topWidget.value.position.left + topWidget.value.position.width/2 - w.value.position.width /2;
                break;
              case "top":  //上对齐
                w.value.position.top = leftWidget.value.position.top;
                break;
              case "bottom":  //下对齐
                w.value.position.top = leftWidget.value.position.top + leftWidget.value.position.height - w.value.position.height;
                break;
              case "vertical_center":  //上下居中对齐
                w.value.position.top = leftWidget.value.position.top + leftWidget.value.position.height/2 - w.value.position.height /2;
                break;
            }
          }
        });
      }
      this.selectedWidgets = [];
      if(this.rect){
        document.getElementById("workbench").removeChild(this.rect);
      }
      this.kuangSelectFlag = false;
    }
  }
}

export default mixin
