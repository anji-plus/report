<!--
 * @Descripttion:
 * @version:
 * @Author: qianlishi
 * @Date: 2022-05-17 16:55:05
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-17 17:38:54
-->
<template>
  <el-dialog
    class="tree_dialog"
    title="数据集--复制"
    width="30%"
    :close-on-click-modal="false"
    center
    :visible.sync="visib"
    :before-close="close"
  >
    <el-form
      :model="form"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <el-form-item label="数据集名称" prop="setName">
        <el-input v-model="form.setName" />
      </el-form-item>
      <el-form-item label="数据集编码" prop="setCode">
        <el-input v-model="form.setCode" />
      </el-form-item>
    </el-form>
    <div slot="footer" style="text-align: center">
      <el-button type="danger" plain @click="close">取消</el-button>
      <el-button type="primary" plain @click="save">保存</el-button>
    </div>
  </el-dialog>
</template>
<script>
import {reportDataSetCopy} from "@/api/reportDataSet"
export default {
  props: {
    visib: Boolean,
    rowData: Object
  },
  data() {
    return {
      form: {},
      rules: {
        setName: [
          { required: true, message: "请输入数据集名称", trigger: "blur" }
        ],
        setCode: [
          { required: true, message: "请输入数据集编码", trigger: "blur" }
        ]
      }
    };
  },
  watch: {
    visib(val) {
      this.form = this.deepClone(this.rowData);
      this.form.setCode = this.form.setCode + "_" + Date.now();
    }
  },
  methods: {
    save() {
      this.$refs.ruleForm.validate(async valid => {
        if (valid) {
          const { code } = await reportDataSetCopy(this.form);
          if (code != "200") {
            return;
          }
          this.$message.success("复制成功");
          this.close();
        }
      });
    },
    close() {
      this.$emit("close");
    }
  }
};
</script>
