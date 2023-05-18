<template>
  <div class="component-linkage">
    <el-button
      type="primary"
      size="mini"
      icon="el-icon-plus"
      :disabled="formData.length === layerWidget.length -1"
      plain
      @click="handleAddClick"
    >
      新增
    </el-button>
    <el-table :data="formData" style="width: 100%">
      <el-table-column label="被联动组件名" align="left">
        <template slot-scope="scope">
          <div class="button-name" v-text="scope.row.widgetValue.split('-$-')[1]" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
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
      :title="isAddFlag ? '新增' : '修改'"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <el-form ref="myForm" v-model="linkageForm" label-width="100px">
        <el-form-item label="被联动的组件">
          <el-select
            v-model="linkageForm.widgetValue"
            size="mini"
            clearable
            placeholder="请选择"
          >
            <el-option
              v-for="(item, index) in layerWidget"
              :key="item.widgetId"
              :disabled="widgetIndex === index || widgetIdList.includes(index)"
              :label="item.label"
              :value="`${item.widgetId}-$-${item.label}-$-${index}`"
            />
          </el-select>
        </el-form-item>
        <el-form-item v-show="linkageForm.widgetValue" class="params-form-item" label="参数配置">
          <div class="params-config">
            <div
              v-for="item in linkageForm.paramsConfig"
              :key="item.originKey"
              class="item-config"
            >
              <div class="label">{{ item.originKey }}</div>
              <div class="value">
                <el-select
                  v-model="item.targetKey"
                  size="mini"
                  clearable
                  placeholder="请选择"
                >
                  <el-option
                    v-for="paramKey in currentTargetParams"
                    :key="paramKey"
                    :label="paramKey"
                    :value="paramKey"
                  />
                </el-select>
              </div>
            </div>
          </div>
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
import { getOneConfigByCode } from '../linkageLogic'
export default {
  name: 'ComponentLinkage',
  components: {},
  model: {
    prop: 'formData',
    event: 'input'
  },
  props: {
    formData: {
      type: Array,
      default: () => []
    },
    layerWidget: { // 当前设计器中所有组件的名称
      type: Array,
      default: () => []
    },
    widgetParamsConfig: { // 当前设计器中所有组件的的数据集配置
      type: Array,
      default: () => []
    },
    widgetIndex: { // 当前操作的组件下标
      require: true,
      type: Number,
      default: -1
    }
  },
  data() {
    return {
      isAddFlag: true, // true 新增， false 编辑
      indexEditor: -1, // 编辑第几个数据
      linkageForm: {
        widgetValue: '', // 选中的组件的名字
        paramsConfig: []
      },
      dialogVisible: false // 显示弹窗
    }
  },
  computed: {
    targetIndex() { // 当前选择联动的目标组件的下标
      if (!this.linkageForm.widgetValue) return -1
      return +this.linkageForm.widgetValue.split('-$-')[2]
    },
    currentTargetParams() { // 当前选择联动的目标组件的数据集参数
      try {
        return Object.keys(this.widgetParamsConfig[this.targetIndex].dynamicData.contextData)
      } catch (error) {
        return []
      }
    },
    widgetIdList() {
      return this.formData.map(item => {
        return +item.widgetValue.split('-$-')[0]
      })
    }
  },
  watch: {
    widgetIndex: {
      handler(val) {
        if (val !== -1) {
          this.initFormDynamicData()
        }
      },
      immediate: true
    }
  },
  created() {
  },
  mounted() {},
  methods: {
    // 重置对象
    initFormDynamicData() {
      let paramsKey = []
      const dynamicParamsWidget = ['widgetButtonGroup', 'widget-table']
      if (dynamicParamsWidget.includes(this.layerWidget[this.widgetIndex].code)) { // 参数不确定的 通过消息接收
        paramsKey = this.layerWidget[this.widgetIndex].paramsKeys || []
      } else {
        const widgetConfigTemp = getOneConfigByCode(this.layerWidget[this.widgetIndex].code)
        if (!widgetConfigTemp) return
        // console.log('this.layerWidget[this.widgetIndex---', this.layerWidget, '  ---  ', this.widgetIndex)
        paramsKey = widgetConfigTemp.paramsKey
      }
      this.linkageForm = {
        widgetValue: '', // 选中的组件的名字
        paramsConfig: paramsKey.map(item => {
          return {
            originKey: item,
            targetKey: ''
          }
        })
      }
    },
    // 弹出框关闭
    handleClose() {
      this.dialogVisible = false
      this.buttonLabel = ''
      this.initFormDynamicData()
    },
    // 新增按钮
    handleAddClick() {
      this.buttonLabel = ''
      this.initFormDynamicData()
      this.isAddFlag = true
      this.dialogVisible = true
    },
    // 修改按钮
    handleEditorClick(index, row) {
      this.isAddFlag = false
      this.linkageForm = JSON.parse(JSON.stringify(this.formData[index]))
      this.dialogVisible = true
      this.indexEditor = index
    },
    // 删除
    handleDeleteClick(index) {
      this.formData.splice(index, 1)
      this.$emit('input', this.formData)
      this.$emit('change', this.formData)
    },
    // 确定
    handleSaveClick() {
      const obj = JSON.parse(JSON.stringify(this.linkageForm))
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
    }
  }
}
</script>
<style lang='scss' scoped>
.component-linkage {

  .button-name {
    width: 80px;
    height: 30px;
    line-height: 30px;
    color: #A9B2BC;
    border: 1px solid #23466F;
    border-radius: 4px;
    box-shadow: 0 0 3px #23466f inset;
    text-align: center;
  }
  .editor, .delete {
    color: #409eff;
    cursor: pointer;
  }
  .delete {
    margin-left: 10px;
  }

  /deep/.el-table,
  /deep/.el-table__expanded-cell,
  /deep/.el-table th,
  /deep/.el-table tr {
    background-color: transparent !important;
    color: #859094 !important;
  }
  /deep/.el-table td,
  /deep/.el-table th.is-leaf {
    border-bottom: none;
    line-height: 26px;
  }
  /deep/.el-table tbody tr:hover > td {
    background-color: #263445 !important;
  }
  /deep/.el-table::before {
    height: 0;
  }
  /deep/.el-dialog {
    background: #1b1e25;
    .el-dialog__title {
      color: #fff;
    }
  }
  .params-form-item {
    margin-top: 20px;
  }
  .item-config {
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    margin-bottom: 20px;
    .label {
      margin-right: 20px;
    }
  }
}
</style>
