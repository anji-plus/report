<template>
  <div>
    <el-button
      type="primary"
      size="small"
      icon="el-icon-plus"
      plain
      @click="handleAddClick"
    >新增</el-button
    >
    <el-table :data="formData" style="width: 100%">
      <el-table-column prop="name" label="名称" width="90" />
      <el-table-column prop="key" label="key值" width="90" />
      <el-table-column prop="max" label="最大值" width="70" />
      <el-table-column label="操作" width="90">
        <template slot-scope="scope">
          <div class="button-group">
            <el-button
              @click="handleEditorClick(scope.$index, scope.row)"
              type="text"
              size="small"
            >编辑</el-button
            >
            <el-button
              type="text"
              size="small"
              @click="handleDeleteClick(scope.$index, scope.row)"
            >删除</el-button
            >
          </div>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog
      title="新增"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <el-form :model="rowFormData" label-width="60px">
        <el-form-item label="名称:">
          <el-input
            v-model.trim="rowFormData['name']"
            placeholder="请输入名称"
            size="mini"
          >
          </el-input>
        </el-form-item>
        <el-form-item label="key值:">
          <el-input
            v-model.trim="rowFormData['key']"
            placeholder="请输入key值"
            size="mini"
          >
          </el-input>
        </el-form-item>
        <el-form-item label="最大值:">
          <el-input
            v-model.trim="rowFormData['max']"
            placeholder="请输入最大值"
            size="mini"
          >
          </el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="dialogVisible = false">取 消</el-button>
        <el-button size="mini" type="primary" @click="handleSaveClick"
        >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>
<script>
export default {
  model: {
    prop: "formData",
    event: "input"
  },
  props: {
    formData: Array
  },
  data() {
    return {
      dialogVisible: false,
      rowFormData: {
        name: "",
        key: "",
        max: ""
      },
      flag: true, // true 新增， false 编辑
      indexEditor: -1, // 编辑第几个数据
      tableData: []
    };
  },
  methods: {
    // 新增
    handleAddClick() {
      this.rowFormData = {};
      this.flag = true;
      this.dialogVisible = true;
    },
    // 编辑
    handleEditorClick(index, row) {
      this.flag = false;
      this.rowFormData = this.deepClone(row);
      this.indexEditor = index;
      this.dialogVisible = true;
    },
    // 关闭
    handleClose() {
      this.dialogVisible = false;
    },
    // 保存
    handleSaveClick() {
      if (this.flag) {
        // 新增
        this.formData.push(this.rowFormData);
        this.dialogVisible = false;
      } else {
        // 编辑
        this.formData[this.indexEditor] = this.rowFormData;
        this.$set(this.formData, this.indexEditor, this.rowFormData);
        this.dialogVisible = false;
      }
      this.$emit("input", this.formData);
      this.$emit("change", this.formData);
    },
    // 删除
    handleDeleteClick(index) {
      this.formData.splice(index, 1);
      this.$emit("input", this.formData);
      this.$emit("change", this.formData);
    }
  }
};
</script>
<style lang="scss">
::-webkit-scrollbar-track-piece {
  background-color: transparent;
}
 .el-table__body-wrapper::-webkit-scrollbar {
  width: 0; // 横向滚动条
  height: 8px; // 纵向滚动条 必写
}
// 滚动条的滑块
 .el-table__body-wrapper::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: rgba(144, 146, 152, 0.3);
}
.el-table,
.el-table__expanded-cell,
.el-table th,
.el-table tr {
  background-color: transparent !important;
  color: #859094 !important;
  font-size: 12px !important;
}
.el-table td.el-table__cell,
.el-table th.el-table__cell.is-leaf {
  border-bottom: 0px;
}
.el-table td,
.el-table th.is-leaf {
  border-bottom: none;
  line-height: 26px;
}
.el-table tbody tr:hover {
  background-color: #263445 !important;
}
.el-table tbody tr:hover > td {
  background-color: #263445 !important;
}
.el-table::before {
  height: 0;
}
.button-group .el-button {
  padding: 0;
}
</style>
