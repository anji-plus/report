<template>
  <el-upload
    class="upload-demo"
    :action="requestUrl"
    :on-success="handleSucess"
    :on-remove="handleRemove"
    :file-list="fileList"
    :headers="headers"
    :limit="1"
    list-type="picture"
  >
    <el-button size="small" type="primary">点击上传</el-button>
  </el-upload>
</template>
<script>
import { getToken } from "@/utils/auth";
export default {
  model: {
    prop: "value",
    event: "input"
  },
  props: {
    value: {
      type: Array,
      default: []
    }
  },
  data() {
    return {
      requestUrl: process.env.BASE_API + "/file/upload",
      headers: {
        Authorization: getToken()
      },
      fileList: []
    };
  },
  created() {
    this.fileList = this.value;
  },
  methods: {
    handleSucess(file) {
      console.log(file);
      this.fileList = [{ name: file.data.fileType, url: file.data.urlPath }];
      this.$emit("input", this.fileList);
      this.$emit("change", this.fileList);
    },
    handleRemove(file) {
      this.fileList = [];
      this.$emit("input", []);
      this.$emit("change", []);
    }
  }
};
</script>
<style lang="scss" scoped></style>
