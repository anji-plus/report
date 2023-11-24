<!--
 * @Descripttion: 系统设置--字典项
 * @version: 
 * @Author: Raod
 * @Date: 2021-12-11 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-3-9 15:00:36
-->
<template>
  <anji-crud ref="listPage" :option="crudOption" />
</template>
<script>
import {
  dictItemDetail,
  dictItemPageList,
  dictItemAdd,
  dictItemEdit,
  dictsItemDelect
} from "@/api/dictItem";
export default {
  name: "DictItem",
  components: {
    anjiCrud: require("@/components/AnjiPlus/anji-crud/anji-crud").default
  },
  data() {
    return {
      searchForm: {
        project: this.$route.query.project,
        dictCode: this.$route.query.dictCode,
        itemCode: null,
        itemLabel: null,
        itemValue: null,
        remark: null,
        pageNumber: 1,
        pageSize: 10
      },
      crudOption: {
        // 使用菜单做为页面标题
        title: "字典项",
        // 详情页中输入框左边文字宽度
        labelWidth: "120px",
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "input",
            label: "字典编码",
            field: "dictCode",
            disabled: this.isBlank(this.$route.query["dictCode"]) == false,
            defaultValue: this.$route.query["dictCode"]
          },
          {
            inputType: "input",
            label: "显示文字",
            field: "itemLabel"
          },
          {
            inputType: "input",
            label: "提交值",
            field: "itemValue"
          },
          {
            inputType: "input",
            label: "备注",
            field: "remark"
          },
          {
            label: "语言标识",
            inputType: "anji-select",
            anjiSelectOption: {
              dictCode: "LOCALE"
            },
            field: "locale"
          }
        ],
        // 表头按钮
        tableButtons: [
          {
            label: "新增",
            type: "", // primary、success、info、warning、danger
            permission: "dictItemManage:insert", // 按钮权限码
            icon: "el-icon-plus",
            plain: true,
            click: () => {
              return this.$refs.listPage.handleOpenEditView("add");
            }
          },
          {
            label: "删除",
            type: "danger",
            permission: "dictItemManage:delete",
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
            permission: "dictItemManage:update",
            click: row => {
              return this.$refs.listPage.handleOpenEditView("edit", row);
            }
          },
          {
            label: "删除",
            permission: "dictItemManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          }
        ],
        // 操作按钮
        buttons: {
          query: {
            api: dictItemPageList,
            permission: "dictItemManage:query"
          },
          queryByPrimarykey: {
            api: dictItemDetail,
            permission: "dictItemManage:query"
          },
          add: {
            api: dictItemAdd,
            permission: "dictItemManage:insert"
          },
          delete: {
            api: dictsItemDelect,
            permission: "dictItemManage:delete"
          },
          edit: {
            api: dictItemEdit,
            permission: "dictItemManage:update"
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
            label: "字典编码", // 字典编码
            placeholder: "",
            field: "dictCode",
            editField: "dictCode",
            inputType: "input",
            rules: [
              { required: true, message: "字典编码不能为空", trigger: "blur" },
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: this.isBlank(this.$route.query["dictCode"]) == false,
            defaultValue: this.$route.query["dictCode"]
          },
          {
            label: "字典项名称", // 字典项名称
            placeholder: "",
            field: "itemName",
            editField: "itemName",
            inputType: "input",
            rules: [
              {
                required: true,
                message: "字典项名称不能为空",
                trigger: "blur"
              },
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: false
          },
          {
            label: "提交值", // 字典项提交值
            placeholder: "",
            field: "itemValue",
            editField: "itemValue",
            inputType: "input",
            rules: [
              { required: true, message: "提交值不能为空", trigger: "blur" },
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: "disableOnEdit"
          },
          {
            label: "语言标识", // 语言标识
            placeholder: "",
            field: "locale",
            editField: "locale",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("LOCALE", row["locale"]);
            },
            inputType: "anji-select",
            anjiSelectOption: {
              dictCode: "LOCALE"
            },
            rules: [
              { required: true, message: "语言标识不能为空", trigger: "blur" }
            ],
            disabled: false,
            defaultValue: "zh"
          },
          {
            label: "状态", //0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG
            placeholder: "",
            field: "enabled",
            fieldTableRowRenderer: row => {
              return this.getDictLabelByCode("ENABLE_FLAG", row["enabled"]);
            },
            colorStyle: {
              0: "table-danger", //key为editField渲染的值（字典的提交值）'红色': 'danger','蓝色': 'primary','绿色': 'success','黄色': 'warning','灰色': 'info','白色'：''
              1: "table-success"
            },
            editField: "enabled",
            inputType: "anji-select",
            anjiSelectOption: {
              dictCode: "ENABLE_FLAG" //指定数据字典
            },
            rules: [
              { required: true, message: "状态不能为空", trigger: "blur" }
            ],
            disabled: false,
            defaultValue: 1
          },
          {
            label: "排序", // 排序
            placeholder: "",
            field: "sort",
            editField: "sort",
            inputType: "input",
            rules: [],
            disabled: false
          },
          {
            label: "描述", // 描述
            placeholder: "",
            field: "remark",
            editField: "remark",
            inputType: "input",
            rules: [
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: false,
            tableHide: true // 表格中不显示
          },

          {
            label: "扩展项", // 字典扩展项
            placeholder: "",
            field: "itemExtend",
            editField: "itemExtend",
            inputType: "input",
            rules: [
              {
                min: 1,
                max: 2048,
                message: "不超过2048个字符",
                trigger: "blur"
              }
            ],
            disabled: false,
            tableHide: true // 表格中不显示
          },
          {
            label: "创建人",
            placeholder: "",
            field: "updateBy",
            editField: "updateBy",
            inputType: "input",
            disabled: false,
            editHide: true // 编辑弹框中不显示
          }
        ]
      }
    };
  }
};
</script>
