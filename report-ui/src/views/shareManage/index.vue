<!--
 * @Descripttion: 报表分享
 * @Author: Raod
 * @Date: 2022-7-30 11:10:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-8-1 11:04:24
 !-->
<template>
  <anji-crud ref="listPage" :option="crudOption">
    <template v-slot:pageSection>

    </template>
  </anji-crud>
</template>
<script>
import {
  reportShareDeleteBatch,
  reportShareDetail,
  reportShareList,
  reportShareDelay, reportShareAdd
} from "@/api/reportShare";
export default {
  name: "Report",
  components: {
    anjiCrud: require("@/components/AnjiPlus/anji-crud/anji-crud").default,
  },
  data() {
    return {
      crudOption: {
        // 使用菜单做为页面标题
        title: '报表分享',
        // 详情页中输入框左边文字宽度
        labelWidth: '120px',
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "input",
            label: "分享编码",
            field: "shareCode"
          },
          {
            inputType: "input",
            label: "报表编码",
            field: "reportCode"
          },
          {
            inputType: "anji-select",
            anjiSelectOption: {
              dictCode: "SHARE_VAILD"
            },
            label: "分享类型",
            field: "shareValidType"
          },
        ],
        // 表头按钮
        tableButtons: [
          {
            label: "删除",
            type: "danger",
            permission: "reportShareManage:delete",
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
            label: "复制url",
            click: this.copyUrlPath
          },
          {
            label: "删除",
            permission: "reportShareManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          },
          {
            label: "延期1天",
            permission: "reportShareManage:shareDelay",
            click: this.shareDelay_1
          },
          {
            label: "延期1周",
            permission: "reportShareManage:shareDelay",
            click: this.shareDelay_7
          },
          {
            label: "延期1月",
            permission: "reportShareManage:shareDelay",
            click: this.shareDelay_30
          },
        ],
        // 操作按钮
        buttons: {
          query: {
            api: reportShareList,
            permission: 'ReportShare:query',
            sort: "create_time",
            order: "DESC"
          },
          queryByPrimarykey: {
            api: reportShareDetail,
            permission: 'ReportShare:detail'
          },
          delete: {
            api: reportShareDeleteBatch,
            permission: 'ReportShare:delete'
          },
          rowButtonsWidth: 150 // row自定义按钮表格宽度
        },
        // 表格列
        columns: [
          {
            label: '',
            field: 'id',
            primaryKey: true, // 根据主键查询详情或者根据主键删除时, 主键的
            tableHide: true, // 表格中不显示
            editHide: true, // 编辑弹框中不显示
          },
          {
            label: '报表编码',//报表编码
            placeholder: '',
            field: 'reportCode',
            editField: 'reportCode',
            inputType: 'input',
            rules: [
              { min: 1, max: 50, message: '不超过50个字符', trigger: 'blur' }
            ],
            disabled: false,
          },
          {
            label: '分享编码',//分享编码，系统生成，默认UUID
            placeholder: '',
            field: 'shareCode',
            editField: 'shareCode',
            inputType: 'input',
            rules: [
              { min: 1, max: 50, message: '不超过50个字符', trigger: 'blur' }
            ],
            disabled: false,
          },
          {
            label: '分享类型',//分享有效期类型，DIC_NAME=SHARE_VAILD
            placeholder: '',
            field: 'shareValidType',
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("SHARE_VAILD", row["shareValidType"]);
            },
            editField: 'shareValidType',
            inputType: 'input',
            rules: [
            ],
            disabled: false,
          },
          {
            label: '分享过期时间',//分享有效期
            placeholder: '',
            field: 'shareValidTime',
            editField: 'shareValidTime',
            inputType: 'input',
            rules: [
            ],
            disabled: false,
          },
          {
            label: '分享token',//分享token
            placeholder: '',
            field: 'shareToken',
            editField: 'shareToken',
            tableHide: true,
            inputType: 'input',
            rules: [
              { min: 1, max: 255, message: '不超过255个字符', trigger: 'blur' }
            ],
            disabled: false,
          },
          {
            label: '分享url',//分享url
            placeholder: '',
            field: 'shareUrl',
            editField: 'shareUrl',
            inputType: 'input',
            rules: [
              { min: 1, max: 100, message: '不超过100个字符', trigger: 'blur' }
            ],
            disabled: false,
          },
          {
            label: '分享码',
            placeholder: '',
            field: 'sharePassword',
            editField: 'sharePassword',
            inputType: 'input',
            rules: [
            ],
            disabled: false,
          },
        ],
        // 弹出框表单对应的值有改动时
        // formData 整个表单，通过编辑打开弹出框，根据主键查询数据时，fieldName, fieldVal, fieldExtend为空
        // fieldName 触发修改的input name
        // fieldVal input最新值
        // fieldExtend 对于select型的扩展值
        formChange: (formData, fieldName, fieldVal, fieldExtend) => {

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

    shareDelay_1(val) {
      this.shareDelay(val.id, 1)
    },
    shareDelay_7(val) {
      this.shareDelay(val.id, 7)
    },
    shareDelay_30(val) {
      this.shareDelay(val.id, 30)
    },

    async shareDelay(shareId, shareValidType) {
      const param = {}
      param['id'] = shareId
      param['shareValidType'] = shareValidType
      const {code} = await reportShareDelay(param);
      if (code != "200") return;
      this.$message({
        message: "延期成功！",
        type: "success"
      });
      this.$refs.listPage.handleQueryForm("query");
    },

    copyUrlPath(val) {
      this.copyToClip(val.shareUrl);
      this.$message({
        message: "已将url路径复制至剪切板！",
        type: "success"
      });
    },

    copyToClip(content, message) {
      let aux = document.createElement("input");
      aux.setAttribute("value", content);
      document.body.appendChild(aux);
      aux.select();
      document.execCommand("copy");
      document.body.removeChild(aux);
    }
  }
};
</script>
