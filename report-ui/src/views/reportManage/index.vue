<!--
 * @Descripttion: 报表设计--报表管理
 * @version:
 * @Author: yanzili
 * @Date: 2021-6-24 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-17 17:38:44
-->
<template>
  <anji-crud ref="listPage" :option="crudOption">
    <template v-slot:pageSection>
      <Share
        :visib="visibleForShareDialog"
        :reportCode="reportCodeForShareDialog"
        :reportName="reportNameForShareDialog"
        :reportType="reportTypeForShareDialog"
        @handleClose="visibleForShareDialog = false"
      />
      <copyDialog :visib.sync="copyVisible" :rowData="rowData" @close="close" />
    </template>
  </anji-crud>
</template>
<script>
import {
  reportList,
  reportAdd,
  reportDeleteBatch,
  reportUpdate,
  reportDetail,
  reportCopy
} from "@/api/reportmanage";
import Share from "./components/share";
import copyDialog from "./components/copyDialog.vue";
import { validateEngOrNum } from "@/utils/validate";
import { verificationSet } from "@/api/report";
export default {
  name: "Report",
  components: {
    anjiCrud: require("@/components/AnjiPlus/anji-crud/anji-crud").default,
    Share,
    copyDialog
  },
  data() {
    return {
      // 分享
      visibleForShareDialog: false,
      reportCodeForShareDialog: "",
      reportNameForShareDialog: "",
      reportTypeForShareDialog: "",
      crudOption: {
        // 使用菜单做为页面标题
        title: "报表管理",
        // 详情页中输入框左边文字宽度
        labelWidth: "120px",
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "anji-select", //form表单类型 input|input-number|anji-select(传递url或者dictCode)|anji-tree(左侧树)|date|datetime|datetimerange
            anjiSelectOption: {
              dictCode: "REPORT_TYPE"
            },
            label: "报表类型",
            field: "reportType"
          },
          {
            inputType: "input",
            label: "报表名称",
            field: "reportName"
          },
          {
            inputType: "input",
            label: "报表编码",
            field: "reportCode"
          },
          {
            inputType: "input",
            label: "制作人",
            field: "reportAuthor"
          }
        ],
        // 表头按钮
        tableButtons: [
          {
            label: "新增",
            type: "", // primary、success、info、warning、danger
            permission: "reportManage:insert", // 按钮权限码
            icon: "el-icon-plus",
            plain: true,
            click: () => {
              return this.$refs.listPage.handleOpenEditView("add");
            }
          },
          {
            label: "删除",
            type: "danger",
            permission: "reportManage:delete",
            icon: "el-icon-delete",
            plain: false,
            click: () => {
              return this.$refs.listPage.handleDeleteBatch();
            }
          }
        ],
        // 表格行按钮
        rowButtons: [
          {
            label: "编辑",
            permission: "reportManage:update",
            click: row => {
              return this.$refs.listPage.handleOpenEditView("edit", row);
            }
          },
          {
            label: "预览",
            permission: "bigScreenManage:view",
            click: this.preview
          },
          {
            label: "设计",
            permission: "bigScreenManage:design",
            click: this.design
          },
          {
            label: "分享",
            permission: "bigScreenManage:share",
            isHide: (row) => {
              return row.reportType == 'report_screen'
            },
            click: this.shareReport
          },
          {
            label: "分享",
            permission: "excelManage:share",
            isHide: (row) => {
              return row.reportType == 'report_excel'
            },
            click: this.shareReport
          },
          {
            label: "复制",
            permission: "bigScreenManage:copy",
            click: this.copyReport
          },
          {
            label: "删除",
            permission: "reportManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          }
        ],
        // 操作按钮
        buttons: {
          query: {
            api: reportList,
            permission: "reportManage:query",
            sort: "update_time",
            order: "DESC"
          },
          queryByPrimarykey: {
            api: reportDetail,
            permission: "reportManage:detail"
          },
          add: {
            api: reportAdd,
            permission: "reportManage:insert"
          },
          delete: {
            api: reportDeleteBatch,
            permission: "reportManage:delete"
          },
          edit: {
            api: reportUpdate,
            permission: "reportManage:update"
          },
          rowButtonsWidth: 150 // row自定义按钮表格宽度
        },
        // 表格列
        columns: [
          {
            label: "",
            field: "id",
            primaryKey: true, // 根据主键查询详情或者根据主键删除时, 主键的
            tableHide: true, // 表格中不显示
            editHide: true // 编辑弹框中不显示
          },
          {
            label: "报表名称", //名称
            placeholder: "",
            field: "reportName",
            editField: "reportName",
            inputType: "input",
            rules: [
              { required: true, message: "请输入报表名称", trigger: "blur" },
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "报表编码", //报表编码
            placeholder: "唯一标识",
            field: "reportCode",
            editField: "reportCode",
            inputType: "input",

            rules: [
              { required: true, message: "请输入报表编码", trigger: "blur" },
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" },
              { validator: validateEngOrNum, trigger: "blur" }
            ],
            disabled: "disableOnEdit"
          },
          {
            label: "分组", //分组,暂时不展示出来
            placeholder: "",
            field: "reportGroup",
            tableHide: true,
            editHide: true,
            editField: "reportGroup",
            inputType: "input",
            rules: [
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
            ],
            disabled: false,
            defaultValue: "default"
          },
          {
            label: "报表类型", //报表类型-目前仅支持大屏报表，暂时不展示出来
            placeholder: "",
            field: "reportType",
            editField: "reportType",
            inputType: "anji-select",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("REPORT_TYPE", row["reportType"]);
            },
            anjiSelectOption: {
              dictCode: "REPORT_TYPE"
            },
            rules: [
              { required: true, message: "请输入报表类型", trigger: "blur" },
              { min: 1, max: 20, message: "不超过20个字符", trigger: "blur" }
            ],
            disabled: "disableOnEdit"
          },
          {
            label: "制作人", //名称
            placeholder: "",
            field: "reportAuthor",
            editField: "reportAuthor",
            inputType: "input",
            rules: [
              { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "描述", //报表描述
            placeholder: "",
            field: "reportDesc",
            editField: "reportDesc",
            inputType: "input",
            rules: [
              { min: 1, max: 255, message: "不超过255个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "状态", //0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG
            placeholder: "",
            field: "enableFlag",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("ENABLE_FLAG", row["enableFlag"]);
            },
            colorStyle: {
              0: "table-danger", //key为editField渲染的值（字典的提交值）'红色': 'danger','蓝色': 'primary','绿色': 'success','黄色': 'warning','灰色': 'info','白色'：''
              1: "table-success"
            },
            editField: "enableFlag",
            inputType: "anji-select",
            anjiSelectOption: {
              dictCode: "ENABLE_FLAG"
            },
            rules: [],
            disabled: false,
            defaultValue: 1
          },
          {
            label: "删除标记", //0--未删除 1--已删除 DIC_NAME=DELETE_FLAG
            placeholder: "",
            field: "deleteFlag",
            editHide: true,
            editField: "deleteFlag",
            tableHide: true,
            inputType: "input",
            rules: [],
            disabled: false
          },
          {
            label: "报表缩略图", //报表缩略图
            placeholder: "",
            field: "reportImage",
            editField: "reportImage",
            inputType: "anji-upload",
            tableHide: true,
            anjiUpload: {
              limit: 1 // 文件大小 Number 类型
            }
          }
        ],
        // 弹出框表单对应的值有改动时
        // formData 整个表单，通过编辑打开弹出框，根据主键查询数据时，fieldName, fieldVal, fieldExtend为空
        // fieldName 触发修改的input name
        // fieldVal input最新值
        // fieldExtend 对于select型的扩展值
        formChange: (formData, fieldName, fieldVal, fieldExtend) => {
          console.log(formData);
          if (fieldName == "reportImage") {
            if (fieldVal.length > 0) {
              formData["reportImage"] = fieldVal && fieldVal[0].url;
            } else {
              formData["reportImage"] = "";
            }
          }
        }
      },

      // 复制
      copyVisible: false,
      rowData: {}
    };
  },

  created() {},
  methods: {
    handleOpenDialog1() {
      alert("自定义按钮1点击事件");
    },
    // 预览
    preview(val) {
      let routePath = "";
      if (val.reportType === "report_excel") {
        routePath = "/excelreport/viewer";
      } else {
        routePath = "/bigscreen/viewer";
      }
      let routeUrl = this.$router.resolve({
        path: routePath,
        query: { reportCode: val.reportCode }
      });
      window.open(routeUrl.href, "_blank");
    },
    // 设计
    design(val) {
      let routePath = "";
      if (val.reportType === "report_excel") {
        routePath = "/excelreport/designer";
      } else {
        routePath = "/bigscreen/designer";
      }
      let routeUrl = this.$router.resolve({
        path: routePath,
        query: {
          reportCode: val.reportCode
        }
      });
      window.open(routeUrl.href, "_blank");
    },
    //分享
    shareReport(val) {
      this.reportCodeForShareDialog = val.reportCode;
      this.reportNameForShareDialog = val.reportName;
      this.reportTypeForShareDialog = val.reportType;
      this.visibleForShareDialog = true;
    },
    checkReport(val) {
      if ("report_screen" == val.reportType) {
        return true;
      }else {
        return false;
      }
    },
    checkExcel(val) {
      if ("report_excel" == val.reportType) {
        return true;
      }else {
        return false;
      }
    },
    //复制
    async copyReport(val) {
      this.copyVisible = true;
      this.rowData = val;
      // const { code } = await reportCopy(val);
      // if (code != "200") {
      //   return;
      // }
      // this.$message.success("复制成功");
      // this.$refs.listPage.handleQueryForm("query");
    },
    close() {
      this.copyVisible = false;
      this.$refs.listPage.handleQueryForm("query");
    }
  }
};
</script>
