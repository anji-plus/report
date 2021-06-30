<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="app-container">
    <el-form ref="form"
             :model="params"
             :rules="rules"
             label-width="120px">
      <!-- 搜索 -->
      <el-row :gutter="10">
        <el-col :xs="24"
                :sm="20"
                :md="12"
                :lg="6"
                :xl="4">
          <el-form-item label="数据源名称">
            <el-input v-model.trim="params.sourceName"
                      size="mini"
                      clearable
                      placeholder="数据源名称"
                      class="filter-item"
                      @keyup.enter.native="crud.toQuery" />
          </el-form-item>
        </el-col>
        <el-col :xs="24"
                :sm="20"
                :md="12"
                :lg="6"
                :xl="4">
          <el-form-item label="数据源编码">
            <el-input v-model.trim="params.sourceCode"
                      size="mini"
                      clearable
                      placeholder="数据源Code"
                      class="filter-item"
                      @keyup.enter.native="crud.toQuery" />
          </el-form-item>
        </el-col>
        <el-col :xs="24"
                :sm="20"
                :md="12"
                :lg="6"
                :xl="4">
          <el-form-item label="数据源类型"
                        size="mini">
            <Dictionary v-model="params.sourceType"
                        :updata-dict="params.sourceType"
                        :dict-key="'SOURCE_TYPE'" />
          </el-form-item>
        </el-col>
        <el-col :xs="24"
                :sm="20"
                :md="4"
                :lg="4"
                :xl="4">
          <el-button type="primary"
                     size="mini"
                     @click="search('form')">查询</el-button>
          <el-button type="danger"
                     size="mini"
                     @click="reset('form')">重置</el-button>
        </el-col>
      </el-row>
    </el-form>
    <el-button type="primary"
               icon="el-icon-plus"
               size="mini"
               @click="showAddLogModel()">新增</el-button>

    <!--表格渲染-->
    <el-table v-loading="listLoading"
              border
              :data="list"
              class="mt10"
              element-loading-text="Loading"
              style="width: 100%">
      <el-table-column align="center"
                       label="序号"
                       type="index"
                       min-width="40" />
      <el-table-column prop="sourceType"
                       label="数据源类型" />
      <el-table-column prop="sourceNameCode"
                       label="数据源名称[编码]" />
      <el-table-column prop="sourceDesc"
                       label="数据源描述" />
      <el-table-column prop="createBy"
                       label="创建人"
                       width="100" />
      <el-table-column prop="createTime"
                       label="创建时间"
                       width="140" />
      <el-table-column prop="updateBy"
                       label="修改人"
                       width="100" />
      <el-table-column prop="updateTime"
                       label="修改时间"
                       width="140" />
      <el-table-column label="操作"
                       width="120px"
                       align="center">
        <template slot-scope="scope">
          <el-button type="text"
                     @click="showAddLogModel(scope.row)">编辑</el-button>
          <!-- <el-popconfirm :title="'确定删除' + scope.row.sourceNameCode + '吗？'"
                         @onConfirm="delData(scope.row)"> -->
          <el-button slot="reference"
                     @click="delData(scope.row)"
                     type="text">删除</el-button>
          <!-- </el-popconfirm> -->
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination :total="totalCount"
                     :page-sizes="[10, 20, 50, 100]"
                     :page-size="params.pageSize"
                     :current-page="params.pageNumber"
                     layout="total, sizes, prev, pager, next, jumper"
                     @size-change="handleSizeChange"
                     @current-change="handleCurrentChange" />
    </div>
    <!--表单组件-->
    <el-dialog title="项目基础配置"
               width="50%"
               :close-on-click-modal="false"
               center
               :visible.sync="basicDialog"
               @close="closeDialog">
      <el-form ref="userForm"
               :model="dialogForm"
               :rules="rules"
               size="small"
               label-width="100px">
        <el-row :gutter="10">
          <el-col :xs="24"
                  :sm="20"
                  :md="6"
                  :lg="6"
                  :xl="6">
            <el-form-item label="数据源类型"
                          prop="sourceType">
              <el-select v-model.trim="dialogForm.sourceType"
                         placeholder="请选择"
                         clearable
                         @change="selectChange">
                <el-option v-for="item in dictionaryOptions"
                           :key="item.id"
                           :label="item.text"
                           :value="item.id" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :xs="24"
                  :sm="20"
                  :md="7"
                  :lg="7"
                  :xl="7">
            <el-form-item label="数据源编码"
                          prop="sourceCode"
                          :disabled="updataDisabled">
              <el-input v-model.trim="dialogForm.sourceCode" />
            </el-form-item>
          </el-col>
          <el-col :xs="24"
                  :sm="20"
                  :md="7"
                  :lg="7"
                  :xl="7">
            <el-form-item label="数据源名称"
                          prop="sourceName">
              <el-input v-model.trim="dialogForm.sourceName" />
            </el-form-item>
          </el-col>
          <el-col :xs="24"
                  :sm="20"
                  :md="20"
                  :lg="20"
                  :xl="20">
            <el-form-item label="数据源描述">
              <el-input v-model.trim="dialogForm.sourceDesc"
                        type="textarea"
                        :autosize="{ minRows: 2, maxRows: 4 }" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="10">
          <el-col v-for="(data, index) in dataLink"
                  :key="index"
                  :xs="24"
                  :sm="20"
                  :md="20"
                  :lg="20"
                  :xl="20">
            <el-form-item :label="data.labelValue">
              <el-input v-model.trim="data.value" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer"
           class="dialog-footer">
        <el-button @click="closeDialog">取消</el-button>
        <el-button type="warning"
                   @click="test">测试</el-button>
        <el-button type="primary"
                   @click="UserConfirm('userForm')">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { pageList, testConnection, addDataSource, editDataSource, deleteDataSource } from '@/api/report'
import { getDictList } from '@/api/dict-data' // 获取数据字典
import Dictionary from '@/components/Dictionary/index'

export default {
  name: 'Support',
  components: { Dictionary },
  data () {
    return {
      dictionaryOptions: [], // 数据源类型
      selectedList: [],
      clickType: '',
      formData: {},
      list: null,
      totalCount: 0,
      totalPage: 0,
      listLoading: true,
      // 弹框默认隐藏
      dialogFormVisible: false,
      basicDialog: false,
      params: {
        sourceName: '',
        sourceCode: '',
        sourceType: '',
        pageNumber: 1,
        pageSize: 10,
        order: 'DESC',
        sort: 'update_time',
      },
      dialogForm: {
        sourceName: '',
        sourceCode: '',
        sourceType: '',
        sourceDesc: '',
        sourceConfig: '',
      },
      dataLink: [],
      rules: {
        sourceType: [{ required: true, message: '数据集名称必选', trigger: 'change' }],
        sourceCode: [{ required: true, message: '数据集编码必填', trigger: 'blur' }],
        sourceName: [{ required: true, message: '数据源名称必选', trigger: 'blur' }],
      },
      value: '',
      updataDisabled: false,
      testReplyCode: null
    }
  },
  watch: {},
  // 在生命周期 beforeCreate里面改变this指向
  beforeCreate: function () { },
  mounted () { },
  created () {
    this.getSystem()
    this.queryByPage()
  },
  methods: {
    // 查询
    search () {
      this.params.pageNumber = 1
      this.queryByPage()
    },
    // 重置
    reset (formName) {
      // this.$refs[formName].resetFields()
      this.params.sourceName = ''
      this.params.sourceCode = ''
      this.params.pageNumber = 1
      this.params.sourceType = ''
      this.queryByPage()
    },
    async queryByPage () {
      const res = await pageList(this.params)
      if (res.code != '200') return
      this.listLoading = true
      this.list = res.data.records
      this.list.forEach((value) => {
        value['sourceNameCode'] = value.sourceName + '[' + value.sourceCode + ']'
      })
      this.totalCount = res.data.total
      this.totalPage = res.data.pages
      this.listLoading = false
    },
    handleSizeChange (val) {
      this.params.pageSize = val
      this.queryByPage()
    },
    handleCurrentChange (val) {
      this.params.pageNumber = val
      this.queryByPage()
    },
    // 关闭模态框
    closeDialog (bool) {
      // bool && this.search('form') // 点确定关闭弹窗的时候才会刷新列表
      // this.$refs['userForm'].resetFields()
      this.basicDialog = false
    },
    // 打开模态框
    showAddLogModel (val) {
      this.basicDialog = true
      if (val == undefined) {
        this.updataDisabled = false
        this.getSystem()
        this.dialogForm = {
          sourceName: '',
          sourceCode: '',
          sourceType: '',
          sourceDesc: '',
          sourceConfig: '',
        }
      } else {
        this.updataDisabled = true
        this.dialogForm = val
        const newSourceType = this.dialogForm
        let newDataLink = []
        this.dictionaryOptions.map((item) => {
          if (item.id == newSourceType.sourceType) {
            newDataLink = JSON.parse(item.extend)
            var sourceConfigJson = JSON.parse(newSourceType.sourceConfig)
            for (var i = 0; i < newDataLink.length; i++) {
              newDataLink[i].value = sourceConfigJson[newDataLink[i].label]
            }
          }
        })
        this.dataLink = newDataLink
      }
    },
    // 获取数据字典
    async getSystem () {
      const { code, data } = await getDictList('SOURCE_TYPE')
      if (code != '200') return
      this.dictionaryOptions = data
      this.dialogForm.sourceType = this.dictionaryOptions[0].text
      this.dataLink = JSON.parse(this.dictionaryOptions[0].extend)
    },
    selectChange (val) {
      this.dataLink = []
      const extendJSON = this.dictionaryOptions.find(function (obj) {
        return obj.id == val
      })
      this.dataLink = JSON.parse(extendJSON.extend)
    },
    // 测试
    test () {
      const newList = {}
      this.dataLink.forEach((item) => {
        newList[item.label] = item.value
      })
      this.dialogForm.sourceConfig = JSON.stringify(newList)
      testConnection(this.dialogForm).then((data) => {
        if (data.code == '200') {
          this.testReplyCode = data.code;
          this.$message({
            message: '测试成功！',
            type: 'success'
          });

        } else {
          this.testReplyCode = null
        }
      })
    },
    async delData (val) {
      this.$confirm('确定删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      })
        .then(async () => {
          this.$emit('deletelayer')
          this.visible = false
          const { code, data } = await deleteDataSource(val)
          if (code != '200') return
          this.queryByPage()
          this.$message({
            type: 'success',
            message: '删除成功!',
          })
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除',
          })
        })

    },
    // 提交
    async UserConfirm (formName) {
      const newList = {}
      this.dataLink.forEach((item) => {
        newList[item.label] = item.value
      })
      this.dialogForm.sourceConfig = JSON.stringify(newList)
      this.$refs[formName].validate(async (valid, obj) => {
        if (valid) {
          if (this.testReplyCode != '200') {
            this.$message.error("测试结果为成功后方可保存！")
            return
          }
          if (this.dialogForm.id == undefined) {
            const { code } = await addDataSource(this.dialogForm)
            if (code != '200') return
            this.queryByPage()
          } else {
            const { code } = await editDataSource(this.dialogForm)
            if (code != '200') return
            this.queryByPage()
          }
          this.closeDialog(false)
        } else {
          return
        }
      })
    },
  },
}
</script>
<style lang="scss" scoped>
.title {
  width: 100%;
  display: inline-block;
  text-align: left;
}
</style>
