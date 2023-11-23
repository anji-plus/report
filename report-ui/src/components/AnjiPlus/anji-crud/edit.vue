<!--
 * @Descripttion: 增删改查列表查询页-编辑组件
 * @Author: Devli
 * @Date: 2021-7-17 10:42:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 11:20:24
 !-->
<template>
  <el-dialog
    :width="dialogWidth"
    :class="dialogFullScreen ? 'full-screen' : 'notfull-screen'"
    :close-on-click-modal="false"
    center
    :visible.sync="showDialog"
    :fullscreen="dialogFullScreen"
    @close="handleCloseDialog('close')"
  >
    <template v-slot:title>
      {{ option.title + "--" + modelType }}
      <button
        type="button"
        aria-label="Close"
        class="el-dialog__headerbtn"
        style="right: 50px"
        @click="dialogFullScreen = !dialogFullScreen"
      >
        <i class="el-dialog__close el-icon el-icon-full-screen" />
      </button>
    </template>

    <!--主表详情信息-->
    <component
      :is="'EditForm'"
      ref="mainForm"
      v-model="saveForm"
      :option="option"
      :model-type="modelType"
      :show-dialog="showDialog"
      @changeRowColNum="handleSetRowColNum"
    />

    <!--关联表相关-->
    <template v-for="(item, index) in joinEntitys">
      <component
        :is="getComponentByJoinType(item.joinType, item)"
        :ref="'joinForm' + index"
        :key="index"
        v-model="saveForm[item.fieldNameInMainEntityOnSave]"
        :value-new.sync="saveForm[item.fieldNameInMainEntityOnId]"
        :option="item"
        :model-type="modelType"
        :relate-data="saveForm"
      />

      <!--孙子的关联表-->
      <template v-for="(grandsonItem, grandsonIndex) in item.joinEntitys">
        <component
          :is="getComponentByJoinType(grandsonItem.joinType, grandsonItem)"
          ref="grandsonForm"
          :key="index + '.' + grandsonIndex"
          :option="grandsonItem"
          :model-type="modelType"
          :relate-data="saveForm"
        />
      </template>
    </template>

    <!--自定义的卡片插槽-->
    <slot name="customCard" />

    <div slot="footer" style="text-align: center">
      <slot v-if="modelType == 'edit'" name="editBtn" :rowData="rowData" />
      <el-button type="danger" plain @click="handleCloseDialog('close')"
        >关闭</el-button
      >
      <el-button
        v-if="modelType != 'view'"
        type="primary"
        plain
        @click="handleValidateAndSave"
        >保存</el-button
      >
    </div>
  </el-dialog>
</template>

<script>
import EditForm from "./edit-form";
import EditTable from "./edit-table";
export default {
  name: "EditDialog",
  components: { EditForm, EditTable },
  props: {
    visible: {
      type: [Boolean],
      default: () => {
        return false;
      }
    },
    rowData: {
      // 查询参数，对应表格那行数据
      type: [Object],
      default: () => {
        return {};
      }
    },
    // 预处理详情接口数据
    handleDetailData: {
      type: Function,
      default: data => {
        return data;
      }
    },
    // 预处理提交数据
    submitDetailData: {
      type: Function,
      default: (data, tpe) => {
        return data;
      }
    },
    modelType: String, // add view edit
    option: {
      require: true,
      type: Object,
      default: () => {
        return {
          title: "", // 页面标题
          labelWidth: "", // 表单输入框label宽度
          queryFormFields: [], // 查询表单条件
          buttons: {
            // 按钮
            query: {},
            edit: {},
            delete: {},
            add: {}
          },
          columns: [] // 表格列
        };
      }
    }
  },
  data() {
    return {
      showDialog: false, // 编辑详情弹框是否显示
      dialogFullScreen: false, // 弹出框全屏
      cardRowColNum: 2, // 主信息一行显示几列

      // 提交表单的数据
      saveForm: {},
      // 已成功校验的关联表单个数
      countForValidJoinForm: 0
    };
  },
  computed: {
    // 弹出框的宽度，根据一行显示几列动态调整
    dialogWidth() {
      if (this.cardRowColNum == 2) {
        return "60%";
      }
      if (this.cardRowColNum == 3) {
        return "70%";
      }
      if (this.cardRowColNum == 4) {
        return "80%";
      }
      return "60%";
    },
    // 关联属性表
    joinEntitys() {
      if (this.isBlank(this.option.joinEntitys)) {
        return [];
      } else {
        return this.option.joinEntitys;
      }
    },
    // 一对一关联表的个数
    countJoinEntityOneToOne() {
      let entitys = this.joinEntitys.filter(
        item => item["joinType"] == "OneToOne"
      );
      if (entitys == null) {
        return 0;
      }
      return entitys.length;
    }
  },
  watch: {
    // 监控dialog的显示隐藏变量
    visible(newValue, oldValue) {
      this.showDialog = newValue;
      // 为主表的编辑表单，渲染上默认值
      this.initDefaultSaveForm();
    },
    rowData(newValue, oldValue) {
      if (newValue != null) {
        this.queryByPrimarykey(newValue);
      }
    }
  },
  mounted() {
    // 为主表的编辑表单，渲染上默认值
    this.initDefaultSaveForm();
  },
  methods: {
    // 暴露给外部crud页面，回传saveForm的值
    getSaveForm() {
      return this.saveForm;
    },
    setSaveForm(saveForm) {
      this.saveForm = saveForm;
    },
    initDefaultSaveForm() {
      // saveForm的默认值
      let defaultSaveForm = {};
      this.option.columns.forEach(item => {
        let key = item.editField;
        if (this.isBlank(key)) {
          key = item.field;
        }
        let val = item.defaultValue;
        if (this.isNotBlank(val)) {
          defaultSaveForm[key] = val;
        }
      });
      // 为主表的编辑表单，渲染上默认值
      this.saveForm = this.deepClone(defaultSaveForm);
      console.log("编辑框默认值:" + JSON.stringify(this.saveForm));
    },
    handleCloseDialog(val) {
      // 为主表的编辑表单，渲染上默认值
      this.initDefaultSaveForm();
      this.showDialog = false; // 编辑详情弹框是否显示
      this.dialogFullScreen = false; // 弹出框全屏
      this.cardRowColNum = 2; // 主信息一行显示几列
      this.countForValidJoinForm = 0; // 已成功校验的关联表单个数
      this.$emit("closeEvent", val);
    },
    handleTopCloseDialog() {
      // 为主表的编辑表单，渲染上默认值
      this.initDefaultSaveForm();
      this.showDialog = false; // 编辑详情弹框是否显示
      this.dialogFullScreen = false; // 弹出框全屏
      this.cardRowColNum = 2; // 主信息一行显示几列
      this.countForValidJoinForm = 0; // 已成功校验的关联表单个数
    },
    // 设置一行显示几列
    handleSetRowColNum(num) {
      this.cardRowColNum = num;
    },
    // 根据关联类型计算组件
    getComponentByJoinType(type, item) {
      if (type == "OneToOne") {
        return "EditForm";
      } else if (type == "OneToMany") {
        return "EditTable";
      } else {
        return "";
      }
    },
    async queryByPrimarykey(rowData) {
      const { data, code } = await this.option.buttons.queryByPrimarykey.api(
        rowData
      );
      if (code != "200") return;
      this.showDialog = true;
      this.saveForm = this.handleDetailData(data);
    },
    // 保存前，先调用校验
    handleValidateAndSave() {
      this.countForValidJoinForm = 0;
      // 主表单校验
      this.$refs.mainForm.validate(mainValid => {
        if (mainValid == false) {
          console.warn("主表单校验失败");
          return;
        }
        console.log("主表单校验完成");
        if (this.joinEntitys == null || this.joinEntitys.length == 0) {
          // 如果子表没有信息，直接提交
          this.handleSave();
          return;
        }
        for (let i = 0; i < this.joinEntitys.length; i++) {
          console.log(`开始校验子表单-${i} 校验`);
          let item = this.joinEntitys[i];
          console.log(item);
          if (
            this.$refs["joinForm" + i] == null ||
            item.hide == true ||
            this.saveForm[item.fieldNameInMainEntityOnSave] == null ||
            this.saveForm[item.fieldNameInMainEntityOnSave].length == 0
          ) {
            console.warn("子表单校验失败");
          } else {
            const childrenChecked = this.checkedChildrenValidate(
              this.saveForm[item.fieldNameInMainEntityOnSave],
              item.columns
            );
            if (!childrenChecked) {
              return;
            }

            //  console.log('子表单没有数据，直接跳过')
            this.countForValidJoinForm++;
            console.log(
              "已经校验的子表单：" +
                this.countForValidJoinForm +
                " 共：" +
                this.joinEntitys.length
            );
            // 所有关联表单校验通过
            if (this.countForValidJoinForm == this.joinEntitys.length) {
              console.log("子表单校验完成，提交主表单");
              this.handleSave();
            }
            continue;
          }
          let joinForm = this.$refs["joinForm" + i];
          if (toString.call(joinForm) == "[object Array]") {
            joinForm = joinForm[0];
          }
          joinForm.validate(joinValid => {
            if (joinValid) {
              this.countForValidJoinForm++;
              console.log(
                "已经校验的子表单：" +
                  this.countForValidJoinForm +
                  " 共：" +
                  this.joinEntitys.length
              );
              // 所有关联表单校验通过
              if (this.countForValidJoinForm == this.joinEntitys.length) {
                console.log("子表单校验完成，提交主表单");
                this.handleSave();
              }
            } else {
              console.warn(`子表单${i}校验失败:`);
            }
          });
        }
      });
    },
    async handleSave() {
      const params = this.submitDetailData(this.saveForm, this.modelType);
      // 新增
      if (this.modelType == "add") {
        const { code, message } = await this.option.buttons.add.api(params);
        if (code == "200") {
          // 保存结束，关闭对话框
          this.handleCloseDialog();
          // 向外层发关闭事件
          // this.$emit('closeEvent')
          return;
        } else {
          // ;(this.countForValidJoinForm = 0), // 已成功校验的关联表单个数
          console.log(`提交表单调用新增接口失败：${message}`);
        }
      }
      // 修改
      if (this.modelType == "edit") {
        const { code, message } = await this.option.buttons.edit.api(params);
        if (code == "200") {
          // 保存结束，关闭对话框
          this.handleCloseDialog();
          // 向外层发关闭事件
          // this.$emit('closeEvent')
          return;
        } else {
          // ;(this.countForValidJoinForm = 0), // 已成功校验的关联表单个数
          console.log(`提交表单调用更新接口失败：${message}`);
        }
      }
    },
    // 子表单数据校验
    checkedChildrenValidate(list, confingList) {
      const configFileds = confingList.map(item => item.field);
      for (let i = 0; i < list.length; i++) {
        const item = list[i];
        for (let key = 0; key < configFileds.length; key++) {
          if (
            item.hasOwnProperty(configFileds[key]) &&
            !item[configFileds[key]]
          ) {
            return false;
          }
        }
      }
      return true;
    }
  }
};
</script>

<style scoped lang="scss">
.notfull-screen {
  /deep/.el-dialog__body {
    background-color: rgb(240, 242, 245);
    padding: 5px;
    max-height: 60vh;
    overflow: auto;
  }
}
.full-screen {
  /deep/.el-dialog__body {
    background-color: rgb(240, 242, 245);
    padding: 5px;
    height: calc(100vh - 110px);
    overflow: auto;
  }
}
</style>
