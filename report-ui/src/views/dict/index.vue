<!--
 * @Descripttion: 系统设置--数字字典
 * @version: 
 * @Author: Raod
 * @Date: 2021-12-11 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-3-9 14:59:53
-->
<template>
  <anji-crud ref="listPage" :option="crudOption">
    <template v-slot:buttonLeftOnTable>
      <el-button
        type="primary"
        icon="el-icon-edit"
        @click="dictRefresh"
        v-permission="'dictManage:fresh'"
        >刷新字典项
      </el-button>
    </template>

    <template slot="rowButtonInMore" slot-scope="props">
      <el-button
        type="text"
        @click="editItem(props)"
        v-permission="'dictItemManage:query'"
        >编辑字典项</el-button
      >
      <el-button
        type="text"
        @click="itemRefresh(props)"
        v-permission="'dictManage:fresh'"
        >刷新字典项</el-button
      >
    </template>
  </anji-crud>
</template>
<script>
import {
  dictDetail,
  getDictList,
  dictAdd,
  dictEdit,
  dictsDelect,
  freshDict
} from "@/api/dict";

export default {
  name: "Dict",
  components: {
    anjiCrud: require("@/components/AnjiPlus/anji-crud/anji-crud").default
  },
  data() {
    const that = this;
    return {
      crudOption: {
        // 使用菜单做为页面标题
        title: "数据字典",
        // 详情页中输入框左边文字宽度
        labelWidth: "120px",
        // 查询表单条件
        queryFormFields: [
          {
            inputType: "input",
            label: "字典名称",
            field: "dictName"
          },
          {
            inputType: "input",
            label: "字典编码",
            field: "dictCode"
          }
        ],
        queryFormChange(queryForm, fileName, fileval) {
          if (queryForm["project"]) {
            that.$store.commit("user/SET_PROJECT", queryForm["project"]);
          }
        },
        // 表头按钮
        tableButtons: [
          {
            label: "刷新字典项",
            type: "primary", // primary、success、info、warning、danger
            permission: "dictManage:fresh", // 按钮权限码
            icon: "el-icon-edit",
            plain: true,
            click: this.dictRefresh
          },
          {
            label: "新增",
            type: "", // primary、success、info、warning、danger
            permission: "dictManage:insert", // 按钮权限码
            icon: "el-icon-plus",
            plain: true,
            click: () => {
              return this.$refs.listPage.handleOpenEditView("add");
            }
          },
          {
            label: "删除",
            type: "danger",
            permission: "dictManage:delete",
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
            permission: "dictManage:update",
            click: row => {
              return this.$refs.listPage.handleOpenEditView("edit", row);
            }
          },
          {
            label: "编辑字典项",
            permission: "dictItemManage:query",
            click: this.editItem
          },
          {
            label: "刷新字典项",
            permission: "dictManage:fresh",
            click: this.itemRefresh
          },
          {
            label: "删除",
            permission: "dictManage:delete",
            click: row => {
              return this.$refs.listPage.handleDeleteBatch(row);
            }
          }
        ],
        // 操作按钮
        buttons: {
          query: {
            api: getDictList,
            permission: "dictManage:query"
          },
          queryByPrimarykey: {
            api: dictDetail,
            permission: "dictManage:query"
          },
          add: {
            api: dictAdd,
            permission: "dictManage:insert"
          },
          delete: {
            api: dictsDelect,
            permission: "dictManage:delete"
          },
          edit: {
            api: dictEdit,
            permission: "dictManage:update"
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
            label: "字典名称", // 字典名称
            placeholder: "",
            field: "dictName",
            editField: "dictName",
            inputType: "input",
            rules: [
              { required: true, message: "字典名称不能为空", trigger: "blur" },
              { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
            ],
            disabled: false
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
            disabled: "disableOnEdit"
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
            disabled: false
          },
          {
            label: "创建时间",
            placeholder: "",
            field: "createTime",
            editField: "createTime",
            inputType: "input",
            disabled: false,
            editHide: true // 编辑弹框中不显示
          },
          {
            label: "创建人",
            placeholder: "",
            field: "createBy",
            editField: "createBy",
            inputType: "input",
            disabled: false,
            editHide: true // 编辑弹框中不显示
          },
          {
            label: "更新时间",
            placeholder: "",
            field: "updateTime",
            editField: "updateTime",
            inputType: "input",
            disabled: false,
            editHide: true // 编辑弹框中不显示
          },
          {
            label: "更新人",
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
  },
  methods: {
    // 刷新当前面字典
    async dictRefresh() {
      let checkRecords = this.$refs.listPage.checkRecords;
      let dictCodes = [];
      if (checkRecords.length > 0) {
        dictCodes = checkRecords.map(item => item.dictCode);
      }
      const { code } = await freshDict(dictCodes);
      if (code != "200") return;
      this.$message.success("刷新成功");
    },
    // 刷新某个字典
    async itemRefresh(val) {
      const selectedList = val;
      let dictCodes = [];
      if (selectedList.length > 0) {
        dictCodes = selectedList.map(item => item.dictCode);
      }
      const { code } = await freshDict(dictCodes);
      if (code != "200") return;
      this.$message.success("刷新成功");
    },
    // 编辑字典项
    editItem(val) {
      this.$router.push({
        path: "/system/dictItem",
        query: {
          dictCode: val.dictCode,
          project: this.$store.state.user.project
        }
      });
    }
  }
};
</script>
