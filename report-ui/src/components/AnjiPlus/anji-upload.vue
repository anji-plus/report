 <!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-8-4 10:17:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-5-14 11:20:24
 !-->
<template>
  <div class="uploadImage">
    <el-upload
      :headers="headers"
      :limit="limit"
      :action="requestUrl"
      list-type="picture-card"
      :file-list="fileList"
      :on-remove="handleRemove"
      :on-exceed="handleExceed"
      :on-success="handleSuccess"
      :show-file-list="true"
      :before-upload="handleBeforeUpload"
    >
      <i slot="default" class="el-icon-plus" />
      <div slot="file" slot-scope="{ file }" class="imgBox">
        <img class="el-upload-list__item-thumbnail" :src="file.url" alt="" />
        <span class="el-upload-list__item-actions">
          <span
            class="el-upload-list__item-delete"
            @click="handleDownload(file)"
          >
            <i class="el-icon-download" />
          </span>
          <span class="el-upload-list__item-delete" @click="handleRemove(file)">
            <i class="el-icon-delete" />
          </span>
        </span>
      </div>
    </el-upload>
  </div>
</template>
<script>
import { getToken } from "@/utils/auth"; // get token from cookie
export default {
  props: {
    upLoadUrl: {
      type: String,
      default: () => {
        return "";
      }
    },
    viewUrl: {
      type: String,
      default: () => {
        return "";
      }
    },
    limit: {
      type: Number,
      default: () => {
        return 3;
      }
    },
    value: {
      type: Array | String
    }
  },
  data() {
    return {
      imageUploadUrl: "",
      fileList: [],
      modeString: ""
    };
  },
  computed: {
    requestUrl() {
      if (this.upLoadUrl != null && this.upLoadUrl.trim() != "") {
        return process.env.BASE_API + this.upLoadUrl;
      } else {
        return process.env.BASE_API + "/file/upload";
      }
    },
    headers() {
      return {
        Authorization: getToken() // 直接从本地获取token就行
      };
    }
  },
  watch: {
    value(val) {
      this.echoUpload(val);
    }
  },
  mounted() {
    this.echoUpload(this.value);
  },
  methods: {
    handleRemove(file) {
      this.fileList = [];
      console.log(this.fileList);
      console.log(this.limit);
      this.change();
    },
    handleExceed() {
      this.$message.warning(`只能上传${this.limit}个文件`);
    },
    // 下载
    handleDownload(file) {
      window.open(file.url);
    },
    // 上传成功的回调
    handleSuccess(response, file, fileList) {
      if (response.code != 200) {
        this.$message.error("上传失败");
        return;
      }
      this.fileList.push({
        url: file.response.data.urlPath,
        fileId: file.response.data.fileId,
        fileType: file.response.data.fileType
      });
      console.log(this.fileList);
      this.change();
    },
    // 回传出去
    change() {
      const fileList = this.fileList;
      console.log(fileList);
      this.$emit("input", fileList);
      this.$emit("change", fileList);
    },
    // 上传检验
    handleBeforeUpload(file) {
      const extension = file.name
        .split(".")
        [file.name.split(".").length - 1].toLowerCase();
      // .png|.jpg|.gif|.icon|.pdf|.xlsx|.xls|.csv|.mp4|.avi
      const extensionList = [
        "png",
        "jpg",
        "gif",
        "icon",
        "pdf",
        "xlsx",
        "xls",
        "csv",
        "mp4",
        "avi"
      ];
      if (extensionList.indexOf(extension) < 0) {
        this.$message.warning("请上传正确的格式文件");
        return false;
      }
      return true;
    },
    // 回显
    echoUpload(val) {
      console.log(val);
      if (val && val.length > 0) {
        this.fileList = [
          {
            url: val
          }
        ];
      } else {
        this.fileList = [];
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.uploadImage .el-upload--picture-card {
  width: 60px;
  height: 60px;
  line-height: 65px;
}
.uploadImage .el-upload-list__item {
  width: 60px;
  height: 60px;
}
.hide_box /deep/.el-upload--picture-card {
  display: none;
}
.el-upload-list__item {
  line-height: 1.5;
}
.el-upload-list--picture-card .el-upload-list__item-actions {
  text-align: left;
  display: flex;
  flex-wrap: wrap;
}
.imgBox,
.iconFont {
  width: 100% !important;
  height: 100% !important;
}
</style>
