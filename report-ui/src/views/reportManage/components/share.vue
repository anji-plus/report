<!--
 * @Descripttion: 
 * @version:
 * @Author: Devli
 * @Date: 2021-7-18 18:19:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-8-5 13:31:44
-->
<template>
  <el-dialog
    class="tree_dialog"
    :title="titleBuild()"
    width="30%"
    :close-on-click-modal="false"
    center
    :visible.sync="visib"
    :before-close="closeDialog"
  >
    <div v-if="shareLinkFlag1">
      <el-form
        ref="userForm"
        :model="dialogForm"
        :rules="rules"
        size="small"
        label-width="100px"
      >
        <el-form-item label="有效期" prop="shareValidType">
          <el-select
            v-model.trim="dialogForm.shareValidType"
            placeholder="请选择"
            clearable
            @change="selectChange"
          >
            <el-option
              v-for="item in shareValidTypeOptions"
              :key="item.id"
              :label="item.text"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="分享码" prop="sharePasswordFlag">
          <el-switch v-model="dialogForm.sharePasswordFlag"> </el-switch>
        </el-form-item>
      </el-form>
      <el-button
        type="primary"
        plain
        @click="createShare"
        style="margin-left:45px"
        >创建链接</el-button
      >
    </div>
    <div v-else>
      <el-form
        ref="userForm"
        :model="dialogForm"
        :rules="rules"
        size="small"
        label-width="100px"
      >
        <el-form-item label="链接" prop="reportShareUrl">
          <el-input v-model="reportShareUrl" :disabled="true" />
        </el-form-item>
        <el-form-item
          v-if="dialogForm.sharePasswordFlag"
          label="分享码"
          prop="sharePassword"
        >
          <el-input v-model="dialogForm.sharePassword" :disabled="true" />
        </el-form-item>

        <el-row :gutter="10">
          <el-button
            v-if="dialogForm.sharePassword == ''"
            type="primary"
            plain
            @click="copyShare"
            style="margin-left:45px"
            >复制链接</el-button
          >
          <el-button
            v-if="dialogForm.sharePassword != ''"
            type="primary"
            plain
            @click="copyShare"
            style="margin-left:45px"
            >复制链接和分享码</el-button
          >
        </el-row>
      </el-form>
    </div>

    <div slot="footer" style="text-align: center">
      <!--      <el-button type="primary" plain @click="saveReportShare">保存</el-button>-->
      <el-button type="danger" plain @click="closeDialog">取消</el-button>
    </div>
  </el-dialog>
</template>
<script>
import { reportShareAdd } from "@/api/reportShare";
import { excelShareAdd } from "@/api/reportShare";
import { getDictList } from "@/api/dict-data"; // 获取数据字典
import Dictionary from "@/components/Dictionary/index";
export default {
  components: { Dictionary },
  props: {
    visib: {
      required: true,
      type: Boolean,
      default: false
    },
    reportCode: {
      required: true,
      type: String,
      default: () => {
        return "";
      }
    },
    reportName: {
      required: true,
      type: String,
      default: () => {
        return "";
      }
    },
    reportType: {
      required: true,
      type: String,
      default:() =>{
        return "";
      }
    }
  },
  data() {
    return {
      title: "报表分享",
      reportShareUrl: "",
      shareValidTypeOptions: [], // 有效期类型
      dialogForm: {
        shareValidType: 0,
        reportCode: "",
        reportType: "",
        shareUrl: "",
        shareCode: "",
        sharePassword: "",
        sharePasswordFlag: false
      },
      shareLinkFlag1: true,
      rules: {
        shareValidType: [
          { required: true, message: "有效期必选", trigger: "change" }
        ]
      }
    };
  },
  watch: {
    visib(val) {
      if (val) {
        // 弹窗弹出时需要执行的逻辑
        this.getSystem();
      }
    }
  },
  created() {},
  methods: {
    titleBuild() {
      return "【" + this.reportName + "】" + "报表分享";
    },
    selectChange(val) {
      this.dialogForm.shareValidType = val;
    },
    // 获取数据字典
    async getSystem() {
      this.shareLinkFlag1 = true;
      const { code, data } = await getDictList("SHARE_VAILD");
      if (code != "200") return;
      this.shareValidTypeOptions = data;
      this.dialogForm.shareValidType = this.shareValidTypeOptions[0].id;
      this.dialogForm.sharePasswordFlag = false;
      this.dialogForm.sharePassword = "";
    },
    async createShare() {
      this.dialogForm.reportType = this.reportType;
      this.dialogForm.reportCode = this.reportCode;
      this.dialogForm.shareUrl = window.location.href;
      const urlType = this.reportType == 'report_screen' ? reportShareAdd(this.dialogForm) : excelShareAdd(this.dialogForm)
      const { code, data } = await urlType
      if (code != "200") return;
      this.shareLinkFlag1 = false;
      this.$message({
        message: "创建链接成功！",
        type: "success"
      });
      this.reportShareUrl = data.shareUrl;
      this.dialogForm.sharePassword = data.sharePassword;
    },

    copyShare() {
      let content = "";
      if (this.dialogForm.sharePassword == "") {
        content = "AJ-Report分享链接：" + this.reportShareUrl;
      } else {
        content =
          "AJ-Report分享链接：" +
          this.reportShareUrl +
          "  分享码：" +
          this.dialogForm.sharePassword;
      }
      this.copyToClip(content);
      this.$message({
        message: "复制链接成功！",
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
    },

    async saveReportShare() {
      let params = {};
      //const { code } = await saveAuthorityTree(params)
      //if (code != '200') return
      this.closeDialog();
    },

    // 弹窗关闭之前需要执行的逻辑
    closeDialog() {
      this.$emit("handleClose");
    }
  }
};
</script>
