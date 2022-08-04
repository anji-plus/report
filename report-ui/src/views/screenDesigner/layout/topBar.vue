<!--
 * @Descripttion: 大屏顶部操操按钮
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-05-14 11:54:07
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-14 12:52:58
-->
<template>
  <!-- 操作栏 -->
  <div class="layout-bar">
    <div class="bar-item" @click="saveData">
      <i class="iconfont iconsave"></i>保存
    </div>
    <div class="bar-item" @click="viewScreen">
      <i class="iconfont iconyulan"></i>预览
    </div>
    <div class="bar-item" @click="handleUndo">
      <i class="iconfont iconundo"></i>撤销
    </div>
    <div class="bar-item" @click="handleRedo">
      <i class="iconfont iconhuifubeifen"></i>恢复
    </div>
    <div class="bar-item">
      <el-upload
        class="el-upload"
        ref="upload"
        :action="uploadUrl"
        :headers="headers"
        accept=".zip"
        :on-success="handleUpload"
        :on-error="handleError"
        :show-file-list="false"
        :limit="1"
      >
        <i class="iconfont icondaoru"></i>
      </el-upload>
      导入
    </div>
    <div class="bar-item">
      <i class="iconfont icondaochu"></i>
      <el-dropdown @command="exportDashboard">
        <span class="el-dropdown-link">
          导出<i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="1">导出(包含数据集)</el-dropdown-item>
          <el-dropdown-item command="0">导出(不包含数据集)</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>
<script>
import { insertDashboard, exportDashboard } from "@/api/bigscreen";
import { Revoke } from "../util/revoke";
import { getToken } from "@/utils/auth";
export default {
  props: {
    dashboard: Object,
    widgets: Array
  },
  data() {
    return {
      uploadUrl:
        process.env.BASE_API +
        "/reportDashboard/import/" +
        this.$route.query.reportCode,
      revoke: null
    };
  },
  computed: {
    headers() {
      return {
        Authorization: getToken()
      };
    }
  },
  watch: {
    widgets: {
      handler(val) {
        //以下部分是记录历史
        this.$nextTick(() => {
          this.revoke.push(this.widgets);
        });
      },
      deep: true
    }
  },
  created() {
    /* 以下是记录历史的 */
    this.revoke = new Revoke();
  },
  methods: {
    // 保存
    async saveData() {
      if (!this.widgets || this.widgets.length == 0) {
        return this.$message.error("请添加组件");
      }
      const screenData = {
        reportCode: this.$route.query.reportCode,
        dashboard: {
          title: this.dashboard.title,
          width: this.dashboard.width,
          height: this.dashboard.height,
          backgroundColor: this.dashboard.backgroundColor,
          backgroundImage: this.dashboard.backgroundImage
        },
        widgets: this.widgets
      };
      const { code, data } = await insertDashboard(screenData);
      if (code == "200") {
        this.$message.success("保存成功！");
      }
    },
    // 预览
    viewScreen() {
      let routeUrl = this.$router.resolve({
        path: "/screen/preview",
        query: { reportCode: this.$route.query.reportCode }
      });
      window.open(routeUrl.href, "_blank");
    },
    // 撤销
    handleUndo() {
      const record = this.revoke.undo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    // 恢复
    handleRedo() {
      const record = this.revoke.redo();
      if (!record) {
        return false;
      }
      this.widgets = record;
    },
    // 导入失败
    handleError(err) {
      this.$message({
        message: "上传失败！",
        type: "error"
      });
    },
    // 导入  成功回调
    handleUpload(response, file, fileList) {
      //清除el-upload组件中的文件
      this.$refs.upload.clearFiles();
      //刷新大屏页面
      this.irefresh();
      if (response.code == "200") {
        this.$message({
          message: "导入成功！",
          type: "success"
        });
      } else {
        this.$message({
          message: response.message,
          type: "error"
        });
      }
    },
    // 导出
    async exportDashboard(val) {
      const fileName = this.$route.query.reportCode + ".zip";

      const param = {
        reportCode: this.$route.query.reportCode,
        showDataSet: val
      };
      exportDashboard(param).then(res => {
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
      });
    },
    refresh() {
      this.$emit("refresh");
    }
  }
};
</script>
<style scoped lang="scss">
.layout-bar {
  height: 40px;
  line-height: 40px;
  font-size: 12px;
  padding: 0 10px;
  display: flex;
  flex-direction: row;
  overflow: hidden;
  .bar-item {
    margin-right: 20px;
    cursor: pointer;
    .iconfont {
      font-size: 12px;
      margin-right: 4px;
    }
    .el-dropdown-link {
      color: #fff;
      cursor: pointer;
    }
  }
}
</style>
