<template>
  <div>
    <el-button
      type="primary"
      size="mini"
      icon="el-icon-plus"
      plain
      @click="handleAddClick"
      >新增</el-button
    >
    <el-table :data="formData" style="width: 100%">
      <el-table-column prop="country" label="国家" align="center"></el-table-column>
      <el-table-column prop="name" label="别名" align="center"></el-table-column>
      <el-table-column label="操作" align="center" min-width="100">
        <template slot-scope="scope">
          <span
            class="editor"
            @click="handleEditorClick(scope.$index, scope.row)"
          >
            编辑
          </span>
          <el-divider direction="vertical"></el-divider>
          <span
            class="editor"
            @click="handleDeleteClick(scope.$index, scope.row)"
          >
          删除
          </span>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog
      title="新增"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <el-form>
        <el-form-item label="国家">
          <el-select
            v-model="country"
            style="width: 200px"
            placeholder="请选择国家"
            size="mini"
          >
            <el-option v-for="(item,index) in Object.values(nameMap)" :key="index" :value="item">{{ item }}</el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="别名">
          <el-input
            v-model="name"
            style="width: 200px"
            placeholder="请输入别名"
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
import { nameMap } from "@/utils/word";

export default {
  name: "customNameComponents",
  model: {
    prop: "formData",
    event: "input"
  },
  props: {
    formData: Array
  },
  data() {
    return {
      nameMap,
      predefineColors: [
        "#ff4500",
        "#ff8c00",
        "#ffd700",
        "#90ee90",
        "#00ced1",
        "#1e90ff",
        "#c71585"
      ],
      country: "",
      name:'',
      dialogVisible: false,
      flag: true, // true 新增， false 编辑
      indexEditor: -1 // 编辑第几个数据
    };
  },
  mounted() {},
  methods: {
    // 弹出框关闭
    handleClose() {
      this.dialogVisible = false;
      this.country = "";
      this.name=''
    },
    // 新增
    handleAddClick() {
      this.country = "";
      this.name=''
      this.flag = true;
      this.dialogVisible = true;
    },
    // 确定
    handleSaveClick() {
      if (this.flag) {
        // 新增
        const obj = {
          country: this.country,
          name:this.name
        };
        this.formData.push(obj);
        this.dialogVisible = false;
      } else {
        // 编辑
        this.formData[this.indexEditor].country = this.country;
        this.formData[this.indexEditor].name = this.name;
        this.dialogVisible = false;
      }
      this.$emit("input", this.formData);
      this.$emit("change", this.formData);
    },
    // 编辑
    handleEditorClick(index, row) {
      this.flag = false;
      this.country = row.country;
      this.name = row.name;
      this.dialogVisible = true;
      this.indexEditor = index;
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
.color-box {
  .title {
    display: flex;
    flex-direction: row;
  }
}
.el-table,
.el-table__expanded-cell,
.el-table th,
.el-table tr {
  background-color: transparent !important;
  color: #859094 !important;
}
.el-table td,
.el-table th.is-leaf {
  border-bottom: none;
  line-height: 26px;
}
.el-table tbody tr:hover > td {
  background-color: #263445 !important;
}
.el-table::before {
  height: 0;
}
.el-color-picker--mini,
.el-color-picker--mini .el-color-picker__trigger {
  width: 23px;
  height: 23px;
}
.el-dialog {
  background: #1b1e25;
  .el-dialog__title {
    color: #fff;
  }
}
.color-box {
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 5px;
}
.editor {
  color: #409eff;
  cursor: pointer;
}
</style>
