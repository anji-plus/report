<template>
  <div class="uploadImage">
    <el-upload
      :headers="headers"
      :limit="limit"
      :action="requestUrl"
      list-type="picture-card"
      :file-list="fileList"
      :on-preview="handlePictureCardPreview"
      :on-remove="handleRemove"
      :on-success="handleSuccess"
      :show-file-list="true"
      :before-upload="handleBeforeUpload"
      :class="fileList && fileList.length >= limit ? 'hide_box' : ''"
    >
      <i slot="default" class="el-icon-plus" />
      <div slot="file" slot-scope="{ file }" class="imgBox">
        <img
          v-if="typeImgShow(file)"
          class="el-upload-list__item-thumbnail"
          :src="file.url"
          alt=""
        />
        <svg-icon
          v-else-if="typePdfShow(file)"
          icon-class="PDF"
          class="iconFont"
        />
        <svg-icon
          v-else-if="typeExcelShow(file)"
          icon-class="Excel"
          class="iconFont"
        />
        <span class="el-upload-list__item-actions">
          <span
            v-if="typeImgShow(file)"
            class="el-upload-list__item-preview"
            @click="handlePictureCardPreview(file)"
          >
            <i class="el-icon-zoom-in" />
          </span>
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
    <el-dialog :visible.sync="dialogVisibleImageUpload" :modal="false">
      <img width="100%" :src="imageUploadUrl" alt="" />
    </el-dialog>
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
      type: Array,
      default: () => {
        return [];
      }
    },
    uploadType: {
      type: String,
      default: () => {
        return "img";
      }
    }
  },
  data() {
    return {
      imageUploadUrl: "",
      dialogVisibleImageUpload: false,
      fileList: [],
      modeString: ""
    };
  },
  computed: {
    requestUrl() {
      if (this.upLoadUrl != null && this.upLoadUrl.trim() != "") {
        return process.env.VUE_APP_BASE_API + this.upLoadUrl;
      } else {
        return process.env.VUE_APP_BASE_API + "/meta/file/upload";
      }
    },
    headers() {
      return {
        Authorization: getToken() // 直接从本地获取token就行
      };
    }
  },
  watch: {
    value: {
      handler(val) {
        this.echoUpload(val);
      },
      immediate: true
    }
  },
  mounted() {},
  methods: {
    // 图片
    typeImgShow(file) {
      if (!file.fileType) return;
      const fileType = file.fileType.toLowerCase();
      if (
        fileType == "jpg" ||
        fileType == "png" ||
        fileType == "gif" ||
        fileType == "icon"
      ) {
        return true;
      }
      return false;
    },
    // pdf
    typePdfShow(file) {
      if (!file.fileType) return;
      const fileType = file.fileType.toLowerCase();
      if (fileType == "pdf") {
        return true;
      }
      return false;
    },
    // excel
    typeExcelShow(file) {
      if (!file.fileType) return;
      const fileType = file.fileType.toLowerCase();
      if (fileType == "xlsx" || fileType == "xls" || fileType == "csv") {
        return true;
      }
      return false;
    },
    handleRemove(file) {
      const fileList = [];
      this.fileList.forEach(el => {
        if (el.fileId != file.fileId) {
          fileList.push(el);
        }
      });
      this.fileList = fileList;
      this.change();
    },
    handlePictureCardPreview(file) {
      this.imageUploadUrl = file.url;
      this.dialogVisibleImageUpload = true;
    },
    // 下载
    handleDownload(file) {
      window.open(file.url);
    },
    // 上传成功的回调
    handleSuccess(response, file, fileList) {
      console.log(fileList);
      if (response.code != 200) {
        this.$message.error("上传失败");
        return;
      }
      this.fileList.push({
        url: file.response.data.urlPath,
        fileId: file.response.data.fileId,
        fileType: file.response.data.fileType
      });
      this.change();
    },
    // 回传出去
    change() {
      const fileList = this.fileList;
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
      if (val && val.length > 0) {
        const fileList = [];
        for (let i = 0; i < val.length; i++) {
          const obj = {};
          obj.url = val[i].urlPath || val[i].url;
          obj.fileType = val[i].fileType;
          obj.fileId = val[i].fileId;
          fileList.push(obj);
        }
        fileList.forEach((el, index) => {
          this.$set(this.fileList, index, el);
        });
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
.hide_box .el-upload--picture-card {
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
