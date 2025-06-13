<template>
  <div class="multi-iframe-manager">
    <el-button
      type="primary"
      size="mini"
      icon="el-icon-plus"
      plain
      @click="handleAddClick"
    >
      新增地址
    </el-button>
    <el-table :data="formData" style="width: 100%">
      <el-table-column prop="name" label="名称" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.name || `地址${scope.$index + 1}` }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="url" label="地址" show-overflow-tooltip>
        <template slot-scope="scope">
          <el-tooltip :content="scope.row.url" placement="top">
            <span class="url-text">{{ scope.row.url }}</span>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <span
            class="editor"
            @click="handleEditorClick(scope.$index, scope.row)"
          >
            <i class="el-icon-edit" /> 编辑
          </span>
          <span
            class="delete"
            @click="handleDeleteClick(scope.$index, scope.row)"
          >
            <i class="el-icon-delete" /> 删除
          </span>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog
      :title="isAddFlag ? '新增iframe地址' : '修改iframe地址'"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <el-form ref="iframeForm" :model="iframeForm" label-width="80px">
        <el-form-item label="名称">
          <el-input v-model="iframeForm.name" size="mini" placeholder="给iframe地址一个名称"></el-input>
        </el-form-item>
        <el-form-item label="地址" required>
          <el-input v-model="iframeForm.url" size="mini" placeholder="请输入iframe地址"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="handleClose">取 消</el-button>
        <el-button size="mini" type="primary" @click="handleSaveClick">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'MultiIframeManager',
  model: {
    prop: 'formData',
    event: 'input'
  },
  props: {
    formData: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      isAddFlag: true, // true 新增， false 编辑
      indexEditor: -1, // 编辑第几个数据
      iframeForm: {
        name: '',
        url: ''
      },
      dialogVisible: false // 显示弹窗
    }
  },
  methods: {
    // 弹出框关闭
    handleClose() {
      this.dialogVisible = false
      this.resetForm()
    },
    // 重置表单
    resetForm() {
      this.iframeForm = {
        name: '',
        url: ''
      }
    },
    // 新增按钮
    handleAddClick() {
      this.resetForm()
      this.isAddFlag = true
      this.dialogVisible = true
    },
    // 修改按钮
    handleEditorClick(index, row) {
      this.isAddFlag = false
      this.iframeForm = JSON.parse(JSON.stringify(row))
      this.dialogVisible = true
      this.indexEditor = index
    },
    // 删除
    handleDeleteClick(index) {
      this.$confirm('确定要删除该地址吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.formData.splice(index, 1)
        this.$emit('input', this.formData)
        this.$emit('change', this.formData)
        this.$message({
          type: 'success',
          message: '删除成功!'
        })
      }).catch(() => {})
    },
    // 确定
    handleSaveClick() {
      if (!this.iframeForm.url) {
        this.$message.error('请输入iframe地址')
        return
      }
      
      const obj = JSON.parse(JSON.stringify(this.iframeForm))
      
      // 如果没有设置名称，则使用默认名称
      if (!obj.name) {
        obj.name = this.isAddFlag 
          ? `地址${this.formData.length + 1}` 
          : `地址${this.indexEditor + 1}`
      }
      
      if (this.isAddFlag) {
        // 新增
        this.formData.push(obj)
        this.dialogVisible = false
      } else {
        // 编辑
        this.formData[this.indexEditor] = obj
        this.dialogVisible = false
      }
      
      this.$emit('input', this.formData)
      this.$emit('change', this.formData)
      this.resetForm()
    }
  }
}
</script>

<style lang="scss" scoped>
.multi-iframe-manager {
  margin-bottom: 20px;
  
  .editor,
  .delete {
    margin: 0 5px;
    font-size: 12px;
    color: #409EFF;
    cursor: pointer;
  }
  
  .delete {
    color: #F56C6C;
  }
  
  .url-text {
    display: inline-block;
    max-width: 150px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}
</style> 