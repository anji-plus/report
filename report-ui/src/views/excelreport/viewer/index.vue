<!--
 * @Descripttion:
 * @Author: qianlishi
 * @Date: 2021-3-19 10:23:24
 * @Last Modified by:   Raod
 * @Last Modified time: 2022-1-26 11:04:24
 !-->
<template>
  <div class="layout" :class="{ 'collapsed': collapsed }">
    <div class="layout-toggle" @click="toggleSidebar">
      <i :class="collapsed ? 'el-icon-d-arrow-right' : 'el-icon-d-arrow-left'"></i>
    </div>
    <div class="layout-right">
      <div class="block">
        <div class="download">
          <a v-if="reportCode != null" download="xxx.xlsx">
            <el-button type="text" @click="download('gaea_template_excel')">
              <i class="iconfont iconexcel"></i>导出excel
            </el-button>
          </a>
          <a v-if="reportCode != null" download="xxx.pdf">
            <el-button type="text" @click="download('gaea_template_pdf')">
              <i class="iconfont iconpdf"></i>导出pdf
            </el-button>
          </a>
        </div>
        <el-form class="">
          <h2>表格查询</h2>
          <div v-for="(item, num) in tableData2" :key="num + 'excel'">
            <h4>{{ item.name }}</h4>
            <div
              v-for="(son, y) in item.children"
              :key="y + 'excel2'"
              class="search_input"
            >
              <label>{{ son.name }}：</label>
              <el-input v-model="son.value" />
            </div>
          </div>
          <el-button style="width: 100%" @click="searchPreview">查询</el-button>
        </el-form>
        <!--<el-pagination :current-page="currentPage4" :page-sizes="[100, 200, 300, 400]" :page-size="100" layout="total, sizes, prev, pager, next, jumper" :total="400" @size-change="handleSizeChange" @current-change="handleCurrentChange" />-->
      </div>
    </div>
    <div class="layout-middle">
      <div
        id="luckysheet"
        style="margin:0px;padding:0px;position:absolute;width:100%;height:95vh;left: 0px;top: 30px;bottom:0px;"
      />
    </div>
  </div>
</template>

<script>
import { preview, exportExcel } from "@/api/GaeaReport";

export default {
  name: "Login",
  components: {},
  data() {
    return {
      options: {},
      sheet: {},
      reportId: null,
      reportCode: null,
      reportName: null,
      dataSet: null,
      tableData2: [],
      excelData: {},
      collapsed: true, // 默认收起侧边栏
      params: {
        reportCode: "",
        setParam: ""
      }
    };
  },
  mounted() {
    this.preview();
  },
  created() {
    this.reportCode = this.$route.query.reportCode;
  },
  beforeDestroy() {
    // 移除事件监听器，避免内存泄漏
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler);
    }
  },
  methods: {
    // 切换侧边栏显示/隐藏
    toggleSidebar() {
      this.collapsed = !this.collapsed;
      // 在状态变化后重新调整表格大小
      setTimeout(() => {
        if (typeof luckysheet !== 'undefined' && luckysheet.resize) {
          luckysheet.resize();
        }
      }, 300);
    },
    async searchPreview() {
      const arr = this.toObject(this.tableData2);
      this.params.setParam = JSON.stringify(arr);
      //每次都重新加载需要改成刷新
      this.preview();
    },
    async preview() {
      this.excelData = {};
      this.params.reportCode = this.reportCode;
      const { code, data } = await preview(this.params);
      if (code != 200) return;
      this.reportName = JSON.parse(data.jsonStr).name;
      // 渲染查询表单
      this.params.setParam = JSON.parse(data.setParam);
      const extendArray = [];
      const extendObj = this.params.setParam;
      for (const i in extendObj) {
        const children = [];
        for (const y in extendObj[i]) {
          children.push({ name: y, value: extendObj[i][y] });
        }
        extendArray.push({ name: i, children: children });
      }
      this.tableData2 = extendArray;

      this.excelData = data.jsonStr;
      this.sheetData = data == null ? [{}] : JSON.parse(data.jsonStr);
      // console.log(this.excelData)
      // console.log(this.sheetData)
      this.createSheet();
    },
    async download(val) {
      // if (val == "gaea_template_pdf") {
      //   this.$message("暂不支持pdf");
      //   return;
      // }
      let extend = '.xlsx';
      const result = {};
      result["reportCode"] = this.reportCode;
      result["setParam"] = JSON.stringify(this.params.setParam);
      if (val != "") {
        result["exportType"] = val;
        if (val === "gaea_template_pdf") {
          extend = '.pdf';
        }
      }
      this.getCellStyleData(result);
      const fileName = this.reportCode + extend;
      exportExcel(result).then(res=>{
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
      })
    },
    // 表单封装json
    toObject(val) {
      const objfirst = {};
      const objSecond = {};
      val.forEach(el => {
        el.name ? (objfirst[el.name] = el.children) : "";
      });
      for (const key in objfirst) {
        const newObj = {};
        objfirst[key].map(ev => {
          Object.assign(newObj, { [ev.name]: ev.value });
        });
        objSecond[key] = newObj;
      }
      return objSecond;
    },
    //初始化表格
    createSheet() {
      const options = {
        container: "luckysheet", // 设定DOM容器的id
        title: "", // 设定表格名称
        lang: "zh", // 设定表格语言
        plugins: ["chart"],
        data: [
          {
            name: "report", //工作表名称
            color: "", //工作表颜色
            index: 0, //工作表索引
            status: 1, //激活状态
            order: 0, //工作表的下标
            hide: 0, //是否隐藏
            row: 36, //行数
            column: 18, //列数
            defaultRowHeight: 19, //自定义行高
            defaultColWidth: 73, //自定义列宽
            celldata: [], //初始化使用的单元格数据
            config: {
              merge: {}, //合并单元格
              rowlen: {}, //表格行高
              columnlen: {}, //表格列宽
              rowhidden: {}, //隐藏行
              colhidden: {}, //隐藏列
              borderInfo: {}, //边框
              authority: {} //工作表保护
            },
            scrollLeft: 0, //左右滚动条位置
            scrollTop: 315, //上下滚动条位置
            luckysheet_select_save: [], //选中的区域
            calcChain: [], //公式链
            isPivotTable: false, //是否数据透视表
            pivotTable: {}, //数据透视表设置
            filter_select: {}, //筛选范围
            filter: null, //筛选配置
            luckysheet_alternateformat_save: [], //交替颜色
            luckysheet_alternateformat_save_modelCustom: [], //自定义交替颜色
            luckysheet_conditionformat_save: {}, //条件格式
            frozen: {}, //冻结行列配置
            chart: [], //图表配置
            zoomRatio: 1, // 缩放比例
            image: [], //图片
            showGridLines: 1, //是否显示网格线
            dataVerification: {} //数据验证配置
          }
        ]
      };
      options.data = this.sheetData;
      // console.log(this.sheetData)
      $(function() {
        luckysheet.create(options);
      });

      // 添加窗口大小变化监听器，以便在窗口大小变化时重新调整表格大小
      this.resizeHandler = () => {
        if (typeof luckysheet !== 'undefined' && luckysheet.resize) {
          luckysheet.resize();
        }
      };
      window.addEventListener('resize', this.resizeHandler);
    },
    getCellStyleData(result) {
      const sheetData = luckysheet.getluckysheetfile(); // 获取整个表格的数据
      const rowDatas = {};

      for (let sheetIndex in sheetData) {
        const sheet = sheetData[sheetIndex];
        if (sheet && sheet.data) {
          for (let rowIndex in sheet.data) {
            const row = sheet.data[rowIndex];
            rowDatas[rowIndex]=row;
          }
        }
      }
      result["rowDatas"] = JSON.stringify(rowDatas);;
    },
  }
};
</script>

<style src="../../../../static/luckysheet/assets/iconfont/iconfont.css" />
<style scoped lang="scss">
.download {
  width: 100%;
  float: left;
  button {
    color: #444;
    width: 90px;
    text-align: left;
    .svg-icon {
      font-size: 16px;
      margin-right: 10px;
    }
  }
}
.block {
  position: relative;
  z-index: 10000;
  top: 0;
  background: #fff;
  width: 100%;
  h2 {
    font-size: 14px;
    line-height: 30px;
  }
  h4 {
    font-size: 12px;
  }
  .search_input {
    font-size: 12px;
    margin-bottom: 10px;
    label {
      line-height: 20px;
    }
  }
}
.layout {
  display: block;
  position: relative;
  margin: 0;
  padding: 0;
}

.layout-toggle {
  position: absolute;
  left: 200px;
  top: 20px;
  transform: translateY(-50%);
  width: 20px;
  height: 60px;
  background-color: #fff;
  border: 1px solid #e8eaec;
  border-left: none;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 10001;
  transition: all 0.2s ease-in-out;

  i {
    color: #909399;
  }

  &:hover {
    background-color: #f5f7fa;
    i {
      color: #409EFF;
    }
  }
}

.layout.collapsed {
  .layout-toggle {
    left: 0;
  }

  .layout-right {
    left: -200px; /* 收起时将面板移出可视区域 */
  }

  .layout-middle {
    left: 0;
    width: 100%;
  }
}

.layout-middle {
  display: block;
  position: absolute;
  left: 200px;
  right: 0;
  width: calc(100% - 200px);
  margin: 0;
  padding: 0;
  transition: all 0.2s ease-in-out;

  .excel-designer {
    display: block;
    position: relative;
    margin: 0;
    padding: 0;
  }
}
.layout-right {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  padding: 20px;
  width: 200px;
  min-height: 99.98vh;
  border-left: 1px solid #dcdee2;
  border-color: #e8eaec;
  background: #fff;
  border-radius: 4px;
  font-size: 14px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  box-shadow: 2px 0 8px rgba(0,0,0,0.1);
  z-index: 10000;
}
</style>
