<!--
 * @Descripttion: 
 * @version: 
 * @Author: Raod
 * @Date: 2021-8-4 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-12-13 18:48:24
-->
<template>
  <el-dialog
    :title="caseResultTitle"
    :close-on-click-modal="false"
    :visible.sync="visib"
    width="70%"
    :before-close="closeDialog"
  >
    <vue-json-editor
      v-model="caseResultContent"
      :show-btns="false"
      :mode="'code'"
      lang="zh"
      class="my-editor"
      @json-change="onJsonChange"
      @json-save="onJsonSave"
    />
    <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="closeDialog">关闭</el-button>
    </span>
  </el-dialog>
</template>
<script>
import vueJsonEditor from "vue-json-editor";
export default {
  name: "Support",
  components: { vueJsonEditor },
  props: {
    visib: {
      required: true,
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      dialogCaseResult: false,
      caseResultTitle: "",
      caseResultContent: null
    };
  },
  methods: {
    dataViewPreview(caseResultTitle, caseResultContent) {
      this.caseResultTitle = caseResultTitle;
      this.caseResultContent = caseResultContent;
    },

    // 关闭模态框
    closeDialog() {
      this.$emit("handleClose");
    },
    onJsonChange(value) {},
    onJsonSave(value) {}
  }
};
</script>
