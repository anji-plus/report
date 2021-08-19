<template>
  <el-dialog class="tree_dialog" :title="titleBuild()" width="60%" :close-on-click-modal="false" center :visible.sync="visib" :before-close="closeDialog">
    <div v-if="shareLinkFlag1">
      <el-form ref="userForm" :model="dialogForm" :rules="rules" size="small" label-width="100px">
        <el-row :gutter="10">
          <el-col :xs="24" :sm="20" :md="6" :lg="6" :xl="6">
            <el-form-item label="有效期" prop="shareValidType">
              <el-select v-model.trim="dialogForm.shareValidType" placeholder="请选择" clearable @change="selectChange">
                <el-option v-for="item in shareValidTypeOptions" :key="item.id" :label="item.text" :value="item.id" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <el-button type="primary" plain @click="createShare">创建链接</el-button>
    </div>
    <div v-else>
      <el-row :gutter="10">
      <el-col :xs="24" :sm="20" :md="20" :lg="20" :xl="16">
        <el-input v-model="reportShareUrl" :disabled="true"/>
      </el-col>
      </el-row>
      <el-row :gutter="10">
        <el-button type="primary" plain @click="copyShare">复制链接</el-button>
      </el-row>

    </div>

    <div slot="footer" style="text-align: center">

<!--      <el-button type="primary" plain @click="saveReportShare">保存</el-button>-->
      <el-button type="danger" plain @click="closeDialog">取消</el-button>
    </div>
  </el-dialog>
</template>
<script>

import { reportShareAdd } from '@/api/reportShare'
import { getDictList } from '@/api/dict-data' // 获取数据字典
import Dictionary from '@/components/Dictionary/index'
export default {
  components: { Dictionary },
  props: {
    visib: {
      required: true,
      type: Boolean,
      default: false,
    },
    reportCode: {
      required: true,
      type: String,
      default: () => {
        return ''
      },
    },
    reportName: {
      required: true,
      type: String,
      default: () => {
        return ''
      },
    },
  },
  data() {
    return {
      title: '报表分享',
      reportShareUrl:'',
      shareValidTypeOptions: [], // 有效期类型
      dialogForm: {
        shareValidType: 0,
        reportCode: '',
        shareUrl: '',
        shareCode: '',
      },
      shareLinkFlag1: true,
      rules: {
        shareValidType: [
          {required: true, message: '有效期必选', trigger: 'change'},
        ],
      },
    };
  },
  watch: {
    visib(val) {
      if (val) {
        // 弹窗弹出时需要执行的逻辑
        this.getSystem()
      }
    },
  },
  created() {},
  methods: {
    titleBuild(){
      return '【' +this.reportName + '】' + '报表分享-' + this.reportCode
    },
    selectChange(val) {
      this.dialogForm.shareValidType = val
    },
    // 获取数据字典
    async getSystem() {
      this.shareLinkFlag1 = true
      const { code, data } = await getDictList('SHARE_VAILD')
      if (code != '200') return
      this.shareValidTypeOptions = data
      this.dialogForm.shareValidType = this.shareValidTypeOptions[0].id
    },
    async createShare() {
      this.dialogForm.reportCode = this.reportCode
      this.dialogForm.shareUrl = window.location.href
      console.log(this.dialogForm)
      const {code, data} = await reportShareAdd(this.dialogForm)
      if (code != '200') return
      console.log(data)
      this.shareLinkFlag1 = false
      this.$message({
        message: '创建链接成功！',
        type: 'success',
      })
      this.reportShareUrl = data.shareUrl
    },

    copyShare(){
      this.copyToClip(this.reportShareUrl)
      this.$message({
        message: '复制链接成功！',
        type: 'success',
      })
    },
    copyToClip(content, message) {
      var aux = document.createElement("input");
      aux.setAttribute("value", content);
      document.body.appendChild(aux);
      aux.select();
      document.execCommand("copy");
      document.body.removeChild(aux);
    },

    async saveReportShare() {
      var params = {
      }
      //const { code } = await saveAuthorityTree(params)
      //if (code != '200') return
      this.closeDialog()
    },

    // 弹窗关闭之前需要执行的逻辑
    closeDialog() {
      this.$emit('handleClose')
    },
  },
}
</script>
