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
    title="报表管理--复制"
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
      <el-form-item label="报表名称" prop="reportName">
        <el-input v-model="form.reportName" />
      </el-form-item>
      <el-form-item label="报表编码" prop="reportCode">
        <el-input v-model="form.reportCode" />
      </el-form-item>
    </el-form>
    <div slot="footer" style="text-align: center">
      <el-button type="danger" plain @click="close">取消</el-button>
      <el-button type="primary" plain @click="save">保存</el-button>
    </div>
  </el-dialog>
</template>
<script>
import { reportCopy } from "@/api/reportmanage";
export default {
  props: {
    visib: Boolean,
    rowData: Object
  },
  data() {
    return {
      form: {},
      rules: {
        reportName: [
          { required: true, message: "请输入报表名称", trigger: "blur" }
        ],
        reportCode: [
          { required: true, message: "请输入报表编码", trigger: "blur" }
        ]
      }
    };
  },
  watch: {
    visib(val) {
      this.form = this.deepClone(this.rowData);
      this.form.reportCode = this.form.reportCode + "_" + Date.now();
    }
  },
  methods: {
    save() {
      this.$refs.ruleForm.validate(async valid => {
        if (valid) {
          console.log(this.form);
          const { code } = await reportCopy(this.form);
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
