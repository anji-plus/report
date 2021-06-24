<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-4-6 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="collapse-input-style">
    <el-form label-width="80px" label-position="left">
      <template v-for="(item, index) in options">
        <el-form-item v-if="inputShow[item.name]" :key="index" :label="item.label" :prop="item.name" :required="item.required">
          <el-input-number
            v-if="item.type == 'el-input-number'"
            v-model="formData[item.name]"
            controls-position="right"
            :placeholder="item.placeholder"
            @change="changed($event, item.name)"
          />

          <el-input
            v-if="item.type == 'el-input-text'"
            v-model.trim="formData[item.name]"
            type="text"
            placeholder="请输入内容"
            clearable
            @change="changed($event, item.name)"
          />

          <el-input
            v-if="item.type == 'el-input-textarea'"
            v-model.trim="formData[item.name]"
            type="textarea"
            rows="2"
            placeholder="请输入内容"
            @change="changed($event, item.name)"
          />

          <el-switch
            v-if="item.type == 'el-switch'"
            v-model="formData[item.name]"
            placeholder="请输入内容"
            @change="changed($event, item.name)"
          />

          <ColorPicker
            v-if="item.type == 'vue-color'"
            v-model="formData[item.name]"
            @change="(val) => changed(val, item.name)"
          />

          <el-upload
            v-if="item.type == 'el-upload-picture'"
            action="https://jsonplaceholder.typicode.com/posts/"
            list-type="picture-card"
          />

          <el-radio-group
            v-if="item.type == 'el-radio-group'"
            v-model="formData[item.name]"
            @change="(val) => changed(val, item.name)"
          >
            <el-radio
              v-for="itemChild in item.selectOptions"
              :key="itemChild.code"
              :label="itemChild.code"
            >{{ itemChild.name }}</el-radio>
          </el-radio-group>

          <el-select
            v-if="item.type == 'el-select'"
            v-model="formData[item.name]"
            clearable
            placeholder="请选择"
            @change="(val) => changed(val, item.name)"
          >
            <el-option
              v-for="itemChild in item.selectOptions"
              :key="itemChild.code"
              :label="itemChild.name"
              :value="itemChild.code"
            />
          </el-select>

          <el-slider
            v-if="item.type == 'el-slider'"
            v-model="formData[item.name]"
            @change="(val) => changed(val, item.name)"
          />

          <el-button
            v-if="item.type == 'el-button'"
            type="primary"
            plain
            @click="addStaticData"
          >编辑</el-button>

          <!-- 弹窗 -->
          <el-dialog
            title="代码编辑"
            :visible.sync="dialogVisibleStaticData"
            width="50%"
            :before-close="handleClose"
          >
            <codemirror
              v-model.trim="formData[item.name]"
              class="code-mirror"
              :options="optionsJavascript"
              style="height: 190px"
            />
            <span
              slot="footer"
              class="dialog-footer"
            >
              <el-button @click="dialogVisibleStaticData = false">取 消</el-button>
              <el-button
                type="primary"
                @click="saveData"
              >确 定</el-button>
            </span>
          </el-dialog>
        </el-form-item>
      </template>
      <!-- 自定义组件 -->
      <template v-for="item in options">
        <div :key="item.name">
          <dynamicComponents
            v-if="item.type == 'dycustComponents' && inputShow[item.name]"
            v-model="formData[item.name]"
            :chart-type="item.chartType"
          />
          <customColorComponents
            v-if="item.type == 'customColor' && inputShow[item.name]"
            v-model="formData[item.name]"
          />
        </div>
      </template>
    </el-form>
  </div>
</template>

<script>
import ColorPicker from './colorPicker.vue'
import { codemirror } from 'vue-codemirror' // 引入codeMirror全局实例
import 'codemirror/lib/codemirror.css' // 核心样式
import 'codemirror/theme/cobalt.css' // 引入主题后还需要在 options 中指定主题才会生效
// language
import 'codemirror/mode/vue/vue.js'
import 'codemirror/mode/javascript/javascript.js'
import 'codemirror/mode/sql/sql.js'
import 'codemirror/mode/shell/shell.js'
import dynamicComponents from './dynamicComponents.vue'
import customColorComponents from './customColorComponents'
import vueJsonEditor from 'vue-json-editor'
export default {
  name: 'DynamicForm',
  components: {
    ColorPicker,
    codemirror,
    dynamicComponents,
    customColorComponents,
    // eslint-disable-next-line vue/no-unused-components
    vueJsonEditor
  },
  model: {
    prop: 'value',
    event: 'input',
  },
  props: {
    options: Array,
    value: {
      type: [Object],
      default: () => { },
    },
  },
  data() {
    return {
      formData: {},
      inputShow: {}, // 控制表单是否显示
      dialogVisibleStaticData: false,
      validationRules: '',
      optionsJavascript: {
        mode: 'text/javascript',
        tabSize: 2, // 缩进格式
        // theme: 'cobalt', // monokai主题，对应主题库 JS 需要提前引入
        lineNumbers: true, // 显示行号
        line: true,
        styleActiveLine: true, // 高亮选中行

        hintOptions: {
          completeSingle: true, // 当匹配只有一项的时候是否自动补全
        },
      },
    }
  },
  watch: {
    value(newValue, oldValue) {
      console.log(newValue)
      this.formData = newValue || {}
    },
    options() {
      this.setDefaultValue()
      this.isShowData()
    },
    formData: {
      handler() {
        this.$emit('onChanged', this.formData)
      },
      deep: true,
    },
  },
  created() {
    this.isShowData()
    this.setDefaultValue()
  },
  mounted() {},
  methods: {
    // 无论哪个输入框改变 都需要触发事件 将值回传
    changed(val, key) {
      if (val.extend) {
        this.$set(this.formData, key, val.value)
      } else {
        this.$set(this.formData, key, val)
      }
      this.$emit('onChanged', this.formData)
      // key为当前用户操作的表单组件
      for (var i = 0; i < this.options.length; i++) {
        var item = this.options[i]
        if (item.relactiveDom == key) {
          this.inputShow[item.name] = val == item.relactiveDomValue
          this.inputShow = Object.assign({}, this.inputShow)
        }
      }
    },
    saveData() {
      this.$emit('onChanged', this.formData)
      this.dialogVisibleStaticData = false
    },
    // 静态数据
    addStaticData() {
      this.dialogVisibleStaticData = true
    },
    handleClose() {
      this.dialogVisibleStaticData = false
    },
    // 组件属性 数据是否展示动态还是静态数据
    isShowData() {
      let currentData = {}
      const data = []
      for (let i = 0; i < this.options.length; i++) {
        // 添加默认的inputShow值
        this.inputShow[this.options[i].name] = true
        if (this.options[i].selectValue) {
          currentData = this.options[i]
        } else {
          data.push(this.options[i])
        }
      }
      data.forEach((el) => {
        if (el.relactiveDomValue != currentData.value) {
          this.inputShow[el.name] = false
        }
      })
    },
    // 组件拖入时 赋值
    setDefaultValue() {
      if (this.options && this.options.length > 0) {
        for (let i = 0; i < this.options.length; i++) {
          this.formData[this.options[i].name] = this.deepClone(this.options[i].value)
        }
        this.formData = Object.assign({}, this.formData)
      }
    },
  },
}
</script>

<style scoped lang="scss">
/deep/ .el-form-item__label {
  font-size: 12px;
  color: #fff;
}
.code-mirror {
  width: 100%;
  height: 100% !important;
}
</style>
