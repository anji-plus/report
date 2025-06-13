<template>
  <div :style="styleObj">
    <superslide v-if="hackReset" :options="options" class="txtScroll-top" ref="superslide">
      <!--表头-->
      <div class="title">
        <div v-for="(item, index) in header" :key="index"
             :style="[headerTableStyle, tableFiledWidth(index), tableRowHeight()]">
          {{ item.name }}
        </div>
      </div>
      <!--数据-->
      <div class="bd">
        <ul class="infoList">
          <li v-for="(item, index) in list" :key="index" :style="tableRowHeight()">
            <div v-for="(itemChild, idx) in header"
                 :key="idx"
                 :style="[
                bodyTableStyle,
                bodyTable(index),
                tableFiledWidth(idx),
                tableRowHeight()
              ]"
            >
              {{ item[itemChild.key] }}
            </div>
          </li>
        </ul>
      </div>
    </superslide>

    <!-- 添加导出按钮，仅在预览模式显示 -->
    <div v-if="ispreview && optionsSetUp.showExportButton" class="export-button-container" :style="exportButtonContainerStyle">
      <div class="export-button" :style="exportButtonStyle" @click="openExportDialog">
        <span class="button-text">导出</span>
      </div>
    </div>
    
    <!-- 导出对话框 -->
    <el-dialog
      title="导出表格数据"
      :visible.sync="exportDialogVisible"
      :width="dialogWidth"
      :fullscreen="isMobile"
      :close-on-click-modal="false"
      center
      :modal-append-to-body="true"
      append-to-body
      :z-index="9999"
      class="export-dialog">
      <el-form :model="exportForm" label-width="100px" size="small">
        <el-form-item label="文件名称">
          <el-input v-model="exportForm.fileName" placeholder="请输入文件名称" clearable></el-input>
        </el-form-item>
        <el-form-item label="导出格式">
          <el-radio-group v-model="exportForm.format">
            <el-radio label="excel">Excel格式(.xlsx)</el-radio>
            <el-radio label="csv">CSV格式(.csv)</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <div class="export-info">
            <p><i class="el-icon-info"></i> 表格名称：数据表</p>
            <p><i class="el-icon-tickets"></i> 数据总量：{{list.length}}行 {{header.length}}列</p>
          </div>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" @click="exportDialogVisible = false">取 消</el-button>
        <el-button size="small" type="primary" @click="confirmExport" :loading="exporting">确定导出</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import vue from "vue";
import VueSuperSlide from "vue-superslide";
import { targetWidgetLinkageLogic } from "@/views/bigscreenDesigner/designer/linkageLogic";

vue.use(VueSuperSlide);
export default {
  name: 'widgetTable',
  components: {},
  props: {
    value: Object,
    ispreview: Boolean,
  },
  data() {
    return {
      hackReset: true,
      options: {
        titCell: ".hd ul",
        mainCell: ".bd ul",
        effect: "topLoop",
        autoPage: true,
        autoPlay: true,
        vis: 5,
        rowHeight: "50px"
      },
      header: [],
      list: [],
      optionsSetUp: {},
      optionsPosition: {},
      optionsData: {},
      flagInter: null,
      // 新增导出对话框相关数据
      exportDialogVisible: false,
      exporting: false,
      exportForm: {
        fileName: '',
        format: 'excel'
      },
      // 添加设备检测变量
      isMobile: false,
      screenWidth: window.innerWidth
    };
  },
  computed: {
    styleObj() {
      const allStyle = this.optionsPosition;
      return {
        position: this.ispreview ? "absolute" : "static",
        width: allStyle.width + "px",
        height: allStyle.height + "px",
        left: allStyle.left + "px",
        top: allStyle.top + "px",
        background: this.optionsSetUp.tableBgColor
      };
    },
    allComponentLinkage() {
      return this.$store.state.designer.allComponentLinkage;
    },
    headerTableStyle() {
      const headStyle = this.optionsSetUp;
      return {
        "text-align": headStyle.textAlignHeader,
        "font-size": headStyle.fontSizeHeader + "px",
        "font-weight": headStyle.headTextFontWeight,
        "font-style": headStyle.headTextFontStyle,
        "font-family": headStyle.headTextFontFamily,
        "border-style": headStyle.isLine ? "solid" : "none",
        "border-width": headStyle.borderWidth + "px",
        "border-color": headStyle.borderColor,
        "line-height": headStyle.rowHeight + 'px',
        display: headStyle.isHeader ? "block" : "none",
        color: headStyle.headColor,
        "background-color": headStyle.headBackColor
      };
    },
    bodyTableStyle() {
      const bodyStyle = this.optionsSetUp;
      return {
        "text-align": bodyStyle.textAlignBody,
        "font-size": bodyStyle.fontSizeBody + "px",
        "font-weight": bodyStyle.bodyTextFontWeight,
        "font-style": bodyStyle.bodyTextFontStyle,
        "font-family": bodyStyle.bodyTextFontFamily,
        "border-style": bodyStyle.isLine ? "solid" : "none",
        "border-width": bodyStyle.borderWidth + "px",
        "border-color": bodyStyle.borderColor,
        "color": bodyStyle.bodyColor,
      };
    },
    // 新增样式计算属性
    exportButtonStyle() {
      // 根据表头字体大小动态计算按钮大小
      const headerFontSize = parseInt(this.optionsSetUp.fontSizeHeader || 16);
      
      // 计算图标尺寸，基于表头字体大小
      const iconSize = Math.max(14, Math.min(24, headerFontSize * 1.1));
      
      // 计算按钮高度，略大于图标尺寸
      const buttonHeight = Math.round(iconSize * 1.8);
      
      return {
        height: `${buttonHeight}px`,
        padding: '0 12px',
        fontSize: `${iconSize}px`,
        backgroundColor: 'rgba(39, 174, 96, 0.9)',
        borderRadius: '4px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        boxShadow: '0 2px 12px 0 rgba(0, 0, 0, 0.1)',
        color: '#ffffff'
      };
    },
    exportButtonContainerStyle() {
      // 计算按钮容器的位置，使其恰好超出表头几个像素
      const headerHeight = this.optionsSetUp.rowHeight || 50;
      // 按钮高度
      const buttonHeight = parseInt(this.exportButtonStyle.height);
      // 设置按钮位置
      return {
        position: 'absolute',
        top: `-${buttonHeight + 5}px`, // 按钮高度 + 5px的间距
        right: '10px',
        zIndex: '100'
      };
    },
    // 添加对话框宽度计算属性
    dialogWidth() {
      if (this.isMobile) {
        return '100%';
      } else if (this.screenWidth < 768) {
        return '90%';
      } else if (this.screenWidth < 992) {
        return '80%';
      } else if (this.screenWidth < 1200) {
        return '60%';
      } else {
        return '420px';
      }
    }
  },
  watch: {
    value: {
      handler(val) {
        this.optionsSetUp = val.setup;
        this.optionsPosition = val.position;
        this.optionsData = val.data;
        this.initData();
      },
      deep: true
    }
  },
  mounted() {
    this.optionsSetUp = this.value.setup;
    this.optionsPosition = this.value.position;
    this.optionsData = this.value.data;
    this.initData();
    targetWidgetLinkageLogic(this); // 联动-目标组件逻辑
    // 添加窗口大小变化监听
    this.checkDeviceType();
    window.addEventListener('resize', this.handleResize);
  },
  beforeDestroy() {
    // 移除窗口大小变化监听
    window.removeEventListener('resize', this.handleResize);
  },
  methods: {
    initData() {
      this.handlerRollFn();
      this.handlerHead();
      this.setOptionsData();
      this.visConfig();
    },
    visConfig() {
      this.options.vis = this.optionsSetUp.vis;
    },
    handlerRollFn() {
      const options = this.options;
      const rollSet = this.optionsSetUp;
      options.autoPlay = rollSet.isRoll;
      options.effect = rollSet.effect;
      options.interTime = rollSet.interTime;
      options.delayTime = rollSet.delayTime;
      options.scroll = rollSet.scroll;
      this.options = options;
      this.hackResetFun();
    },
    handlerHead() {
      const head = this.optionsSetUp.dynamicAddTable;
      this.header = head;
    },
    setOptionsData(e, paramsConfig) {
      const tableData = this.optionsData;
      tableData.dynamicData = tableData.dynamicData || {}; // 兼容 dynamicData undefined

      const myDynamicData = tableData.dynamicData;
      clearInterval(this.flagInter); // 不管咋，先干掉上一次的定时任务，避免多跑
      if (
        e &&
        tableData.dataType !== "staticData" &&
        Object.keys(myDynamicData.contextData).length
      ) {
        const keyArr = Object.keys(myDynamicData.contextData);
        paramsConfig.forEach((conf) => {
          if (keyArr.includes(conf.targetKey)) {
            myDynamicData.contextData[conf.targetKey] = e[conf.originKey];
          }
        });
      }

      tableData.dataType == "staticData"
        ? this.handlerStaticData(tableData.staticData)
        : this.handlerDynamicData(tableData.dynamicData, tableData.refreshTime);
    },
    handlerStaticData(data) {
      this.list = data;
    },
    handlerDynamicData(data, refreshTime) {
      if (!data) return;
      if (this.ispreview) {
        this.getEchartData(data);
        this.flagInter = setInterval(() => {
          this.getEchartData(data);
        }, refreshTime);
      } else {
        this.getEchartData(data);
      }
    },
    getEchartData(val) {
      const data = this.queryEchartsData(val);
      data.then(res => {
        this.list = res;
        this.hackResetFun();
      });
    },
    // vue hack 之强制刷新组件
    hackResetFun() {
      this.hackReset = false;
      this.$nextTick(() => {
        this.hackReset = true;
      });
    },
    // 计算 奇偶背景色
    bodyTable(index) {
      let styleJson = {};
      if (index % 2) {
        styleJson["background-color"] = this.optionsSetUp.eventColor;
      } else {
        styleJson["background-color"] = this.optionsSetUp.oldColor;
      }
      return styleJson;
    },
    tableRowHeight() {
      let styleJson = {};
      if (this.optionsSetUp.rowHeight) {
        styleJson["height"] = this.optionsSetUp.rowHeight + "px";
        //styleJson["line-height"] = this.optionsSetUp.rowHeight + "px";
      } else {
        styleJson["height"] = this.options.rowHeight;
        //styleJson["line-height"] = this.optionsSetUp.rowHeight + "px";
      }
      return styleJson;
    },
    tableFiledWidth(index) {
      let styleJson = {};
      if (this.optionsSetUp.dynamicAddTable[index].width) {
        styleJson["width"] = this.optionsSetUp.dynamicAddTable[index].width;
      }
      return styleJson;
    },
    // 添加的方法 - 设备类型检测
    checkDeviceType() {
      this.screenWidth = window.innerWidth;
      this.isMobile = this.screenWidth <= 576;
    },
    
    // 处理窗口大小变化
    handleResize() {
      this.checkDeviceType();
    },
    
    // 打开导出对话框前检查设备类型
    openExportDialog() {
      if (!this.list || this.list.length === 0) {
        this.$message.warning('没有数据可导出');
        return;
      }
      
      // 重新检查设备类型
      this.checkDeviceType();

      // 设置默认文件名（表格名称+日期时间）
      const now = new Date();
      const dateStr = `${now.getFullYear()}${(now.getMonth()+1).toString().padStart(2,'0')}${now.getDate().toString().padStart(2,'0')}`;
      const timeStr = `${now.getHours().toString().padStart(2,'0')}${now.getMinutes().toString().padStart(2,'0')}`;
      
      // 准备对话框数据
      this.exportForm.fileName = `表格数据_${dateStr}_${timeStr}`;
      this.exportForm.format = 'excel'; // 默认选择Excel格式
      
      // 显示导出对话框
      this.exportDialogVisible = true;
    },
    
    // 确认导出方法
    confirmExport() {
      // 检查文件名是否为空
      if (!this.exportForm.fileName || this.exportForm.fileName.trim() === '') {
        this.$message.warning('请输入文件名');
        return;
      }
      
      // 设置导出中状态
      this.exporting = true;
      
      // 根据选择的格式执行不同的导出方法
      try {
        if (this.exportForm.format === 'excel') {
          this.doExportExcel();
        } else {
          this.doExportCSV();
          // 只有CSV导出直接在这里显示成功消息和关闭对话框
          this.$message.success('导出成功');
          this.exportDialogVisible = false;
          this.exporting = false;
        }
      } catch (error) {
        console.error('导出失败:', error);
        this.$message.error('导出失败，请重试');
        this.exporting = false;
      }
    },
    
    // 执行Excel导出
    doExportExcel() {
      // 引入xlsx库，使用动态导入以减少初始加载时间
      import('xlsx').then(XLSX => {
        // 准备数据：表头和内容
        const tableHeaders = this.header.map(header => header.name);
        const tableKeys = this.header.map(header => header.key);
        
        // 创建表格数据数组，从列表数据映射
        const tableData = this.list.map(row => {
          const rowData = {};
          tableKeys.forEach((key, index) => {
            rowData[tableHeaders[index]] = row[key];
          });
          return rowData;
        });
        
        // 创建工作簿和工作表
        const wb = XLSX.utils.book_new();
        const ws = XLSX.utils.json_to_sheet(tableData, { header: tableHeaders });
        
        // 计算列宽 - 动态计算合适的列宽
        ws['!cols'] = tableHeaders.map((header, index) => {
          // 尝试计算合适的列宽，考虑标题和内容
          const headerLength = header ? header.toString().length : 0;
          
          // 计算该列数据的最大长度
          let maxLength = headerLength;
          tableData.forEach(row => {
            const cellValue = row[header];
            const cellLength = cellValue ? cellValue.toString().length : 0;
            maxLength = Math.max(maxLength, cellLength);
          });
          
          // 为确保列宽适合内容，添加一些额外空间
          return { wch: Math.min(50, maxLength + 2) }; // 限制最大宽度为50个字符
        });
        
        // 添加工作表到工作簿
        XLSX.utils.book_append_sheet(wb, ws, '数据表');
        
        // 导出文件，使用用户指定的文件名
        XLSX.writeFile(wb, `${this.exportForm.fileName}.xlsx`);
        
        // 导出成功
        this.$message.success('导出成功');
        this.exportDialogVisible = false;
        this.exporting = false;
      }).catch(err => {
        console.error('导出Excel失败:', err);
        this.$message.error('导出Excel失败，请重试');
        this.exporting = false;
      });
    },
    
    // 执行CSV导出
    doExportCSV() {
      // 准备表头和数据
      const tableHeaders = this.header.map(header => header.name);
      const tableKeys = this.header.map(header => header.key);
      
      // 创建CSV内容
      let csvContent = '\uFEFF'; // 添加BOM标记以支持中文
      
      // 添加表头
      csvContent += tableHeaders.join(',') + '\r\n';
      
      // 添加数据行
      this.list.forEach(row => {
        const rowValues = tableKeys.map(key => {
          const value = row[key] !== undefined && row[key] !== null ? row[key] : '';
          // 如果值包含逗号、引号或换行符，需要用引号包裹并转义内部引号
          if (typeof value === 'string' && (value.includes(',') || value.includes('"') || value.includes('\n'))) {
            return `"${value.replace(/"/g, '""')}"`;
          }
          return value;
        });
        csvContent += rowValues.join(',') + '\r\n';
      });
      
      // 创建Blob对象
      const blob = new Blob([csvContent], {
        type: 'text/csv;charset=utf-8'
      });
      
      // 创建下载链接，使用用户指定的文件名
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.download = `${this.exportForm.fileName}.csv`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    },
  }
};
</script>
<style lang="scss" scoped>
/* 本例子css */
.txtScroll-top {
  overflow: hidden;
  position: relative;
}

.title {
  display: flex;
  flex-direction: row;
  width: 100%;
}

.title > div {
  height: 50px;
  line-height: 50px;
  width: 100%;
}

.txtScroll-top .bd {
  width: 100%;
}

.txtScroll-top .infoList li {
  height: 50px;
  //line-height: 50px;
  display: flex;
  flex-direction: row;
}

.txtScroll-top .infoList li > div {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}

/* 添加导出按钮样式 */
.export-button-container {
  position: absolute;
  right: 0px;
  z-index: 100;

  .export-button {
    transition: all 0.3s ease;
    cursor: pointer;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
    
    &:hover {
      transform: scale(1.05);
      background-color: rgba(39, 174, 96, 1) !important;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }
    
    i {
      margin-right: 5px;
    }
    
    .button-text {
      font-size: 14px;
      font-weight: 500;
    }
  }
}

/* 添加导出信息样式 */
.export-info {
  background-color: #f5f7fa;
  border-radius: 4px;
  padding: 10px 15px;
  margin-top: 5px;
  
  p {
    margin: 5px 0;
    font-size: 13px;
    color: #606266;
    display: flex;
    align-items: center;
    
    i {
      margin-right: 5px;
      color: #409EFF;
    }
  }
}

/* 确保对话框在大屏中显示正常 */
::v-deep .el-dialog {
  background-color: #fff;
  border-radius: 6px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
  position: relative;
  z-index: 9999 !important;
  
  .el-dialog__header {
    padding: 15px 20px;
    border-bottom: 1px solid #e4e7ed;
  }
  
  .el-dialog__body {
    padding: 20px;
  }
  
  .el-dialog__footer {
    padding: 10px 20px 15px;
    border-top: 1px solid #e4e7ed;
  }
  
  .el-form-item {
    margin-bottom: 15px;
  }
}

/* 为移动设备添加特定样式 */
::v-deep .export-dialog {
  @media screen and (max-width: 576px) {
    display: flex;
    flex-direction: column;
    margin: 0 !important;
    
    .el-dialog {
      width: 100% !important;
      margin: 0 !important;
      max-width: 100%;
      border-radius: 0;
      display: flex;
      flex-direction: column;
      height: 100%;
      
      .el-dialog__body {
        flex: 1;
        overflow-y: auto;
        padding: 15px;
      }
      
      .el-form-item__label {
        width: 80px !important;
      }
      
      .el-radio-group {
        display: flex;
        flex-direction: column;
        
        .el-radio {
          margin-left: 0;
          margin-bottom: 10px;
        }
      }
    }
  }
  
  @media screen and (max-width: 768px) {
    .el-form-item__label {
      width: 80px !important;
    }
    
    .el-form {
      .el-radio-group {
        flex-wrap: wrap;
      }
    }
  }
}

::v-deep .v-modal {
  z-index: 9998 !important;
}
</style>
