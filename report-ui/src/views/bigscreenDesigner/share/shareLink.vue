<!--
 * @Descripttion: 大屏分享链接--解析识别入口
 * @Author: qianlishi
 * @Date: 2021-12-13 13:04:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2023-9-8 11:04:24
 !-->
<template>
  <div>
    <el-dialog
      title="请输入分享码"
      :visible.sync="dialogVisible"
      width="30%"
      :close-on-click-modal="false"
      :before-close="handleClose"
    >
      <el-input v-model="password" placeholder="请输入分享码"></el-input>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="checkPassword()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import { reportShareDetailByCode } from "@/api/reportShare";
import { setShareToken } from "@/utils/auth";
export default {
  name: "Report",
  components: {},
  data() {
    return {
      password: "",
      sharePassword: "",
      dialogVisible: false,
      reportCode: "",
      shareToken: ""
    };
  },

  created() {
    this.handleOpen();
  },
  methods: {
    async handleOpen() {
      const url = window.location.href;
      const shareCode = url.split('?')[0].substring(url.lastIndexOf("/") + 1);
      const { code, data } = await reportShareDetailByCode(shareCode);
      if (code != "200") return;
      this.reportCode = data.reportCode;
      this.sharePassword = data.sharePassword;
      this.shareToken = data.shareToken;
      if (this.sharePassword) {
        this.dialogVisible = true;
      } else {
        this.pushAj();
      }
    },
    checkPassword() {
      const md5 = require("js-md5");
      const inputPassword = md5(this.password);
      if (inputPassword == this.sharePassword) {
        this.pushAj();
      } else {
        this.$message.error("分享码输入不正确");
      }
    },
    pushAj() {
      setShareToken(this.shareToken);
      const url = window.location.href;
      const urlParamsObj = this.toUrlParamsMap(url.split('?')[1])
      const queryParams = { ...urlParamsObj, reportCode: this.reportCode }
      this.$router.push({
        path: "/bigscreen/viewer",
        query: queryParams
      });
    },
    toUrlParamsMap(params) {
      if(!params) return {}
      const urlObj = {}
      params.split("&").map(item => urlObj[item.split("=")[0]] = item.split("=")[1])
      return urlObj
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    }
  }
};
</script>
