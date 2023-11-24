<!--
 * @Descripttion: 大屏设计器-右区动态表单
 * @Author: Devli
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2022-3-14 14:04:24
 !-->
<template>
  <div class="collapse-input-style">
    <el-form label-width="100px" label-position="left">
      <template v-for="(item, index) in options">
        <div v-if="isShowForm(item, '[object Object]')" :key="index">
          <el-form-item
            v-if="
              inputShow[item.name] &&
              item.type != 'dycustComponents' &&
              item.type != 'dynamic-add-table'
            "
            :label="item.label"
            :prop="item.name"
            :required="item.required"
          >
            <el-input-number
              v-if="item.type == 'el-input-number'"
              size="mini"
              style="width: 100%"
              v-model.trim="formData[item.name]"
              :disabled="item.disabled"
              controls-position="right"
              @change="changed($event, item.name)"
            />

            <el-input
              v-if="item.type == 'el-input-text'"
              v-model.trim="formData[item.name]"
              :disabled="item.disabled"
              type="text"
              size="mini"
              placeholder="请输入内容"
              clearable
              @change="changed($event, item.name)"
            />

            <el-input
              v-if="item.type == 'el-input-textarea'"
              v-model.trim="formData[item.name]"
              type="textarea"
              size="mini"
              rows="2"
              :disabled="item.disabled"
              placeholder="请输入内容"
              @change="changed($event, item.name)"
            />

            <el-switch
              v-if="item.type == 'el-switch'"
              v-model="formData[item.name]"
              size="mini"
              placeholder="请输入内容"
              :disabled="item.disabled"
              @change="changed($event, item.name)"
            />
            <ColorPicker
              v-if="item.type == 'vue-color'"
              v-model="formData[item.name]"
              @change="(val) => changed(val, item.name)"
            />
            <customUpload
              v-if="item.type == 'custom-upload'"
              v-model="formData[item.name]"
              @change="changed($event, item.name)"
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
                >{{ itemChild.name }}</el-radio
              >
            </el-radio-group>

            <el-select
              v-if="item.type == 'el-select'"
              size="mini"
              :disabled="item.disabled"
              v-model="formData[item.name]"
              :multiple="item.multiple"
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
              :step="item.options==null?1:item.options.step"
              :min="item.options==null?1:item.options.min"
              :max="item.options==null?100:item.options.max"
              :show-stops="item.options==null?false:item.options.showStops"
            />

            <el-button
              v-if="item.type == 'el-button'"
              type="primary"
              size="mini"
              plain
              @click="addStaticData"
              >编辑</el-button
            >

            <el-button
              v-if="item.type == 'methods'"
              type="primary"
              size="mini"
              @click="methodsVisible = true"
              >添加事件</el-button
            >

            <!-- 弹窗 -->
            <el-dialog
              title="代码编辑"
              :visible.sync="dialogVisibleStaticData"
              width="50%"
              :before-close="handleClose"
            >
              <vue-json-editor
                v-model="formData[item.name]"
                :show-btns="false"
                :mode="'code'"
                lang="zh"
                class="my-editor"
              />
              <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisibleStaticData = false"
                  >取 消</el-button
                >
                <el-button type="primary" @click="saveData">确 定</el-button>
              </span>
            </el-dialog>

            <el-dialog
              title="代码编辑"
              :visible.sync="methodsVisible"
              width="50%"
              :before-close="handleClose"
            >
              <monaco-editor
                v-model.trim="formData[item.name]"
                language="javascript"
                style="height: 500px"
              />
              <span slot="footer" class="dialog-footer">
                <el-button @click="methodsVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveData">确 定</el-button>
              </span>
            </el-dialog>
          </el-form-item>
          <dynamicComponents
            v-if="item.type == 'dycustComponents' && inputShow[item.name]"
            v-model="formData[item.name]"
            :chart-type="item.chartType"
            :dict-key="item.dictKey"
            @change="changed($event, item.name)"
          />
          <dynamic-add-table
            v-if="item.type == 'dynamic-add-table' && inputShow[item.name]"
            v-model="formData[item.name]"
            :chart-type="item.chartType"
            @change="changed($event, item.name)"
          />
          <dynamic-add-radar
            v-if="item.type == 'dynamic-add-radar' && inputShow[item.name]"
            v-model="formData[item.name]"
            :chart-type="item.chartType"
            @change="changed($event, item.name)"
          />
        </div>
        <div v-else-if="isShowForm(item, '[object Array]')" :key="'a-' + index">
          <el-collapse accordion>
            <el-collapse-item
              v-for="(itemChild, indexChild) in item"
              :key="indexChild"
              :title="itemChild.name"
              :name="indexChild"
            >
              <template v-for="(itemChildList, idx) in itemChild.list">
                <el-form-item
                  :key="idx"
                  :label="itemChildList.label"
                  :prop="itemChildList.name"
                  :required="itemChildList.required"
                >
                  <el-input-number
                    v-if="itemChildList.type == 'el-input-number'"
                    size="mini"
                    style="width: 100%"
                    v-model="formData[itemChildList.name]"
                    :disabled="item.disabled"
                    controls-position="right"
                    :placeholder="itemChildList.placeholder"
                    @change="changed($event, itemChildList.name)"
                  />

                  <el-input
                    v-if="itemChildList.type == 'el-input-text'"
                    v-model.trim="formData[itemChildList.name]"
                    :disabled="item.disabled"
                    type="text"
                    size="mini"
                    placeholder="请输入内容"
                    clearable
                    @change="changed($event, itemChildList.name)"
                  />

                  <el-input
                    v-if="itemChildList.type == 'el-input-textarea'"
                    v-model.trim="formData[itemChildList.name]"
                    :disabled="item.disabled"
                    size="mini"
                    type="textarea"
                    rows="2"
                    placeholder="请输入内容"
                    @change="changed($event, itemChildList.name)"
                  />

                  <el-switch
                    v-if="itemChildList.type == 'el-switch'"
                    v-model="formData[itemChildList.name]"
                    :disabled="item.disabled"
                    placeholder="请输入内容"
                    size="mini"
                    @change="changed($event, itemChildList.name)"
                  />

                  <ColorPicker
                    v-if="itemChildList.type == 'vue-color'"
                    v-model="formData[itemChildList.name]"
                    @change="(val) => changed(val, itemChildList.name)"
                  />

                  <el-upload
                    v-if="itemChildList.type == 'el-upload-picture'"
                    size="mini"
                    action="https://jsonplaceholder.typicode.com/posts/"
                    list-type="picture-card"
                  />

                  <el-radio-group
                    v-if="itemChildList.type == 'el-radio-group'"
                    v-model="formData[itemChildList.name]"
                    @change="(val) => changed(val, itemChildList.name)"
                  >
                    <el-radio
                      v-for="it in itemChildList.selectOptions"
                      :key="it.code"
                      :label="it.code"
                      >{{ it.name }}</el-radio
                    >
                  </el-radio-group>

                  <el-select
                    v-if="itemChildList.type == 'el-select'"
                    size="mini"
                    v-model="formData[itemChildList.name]"
                    clearable
                    placeholder="请选择"
                    @change="(val) => changed(val, itemChildList.name)"
                  >
                    <el-option
                      v-for="it in itemChildList.selectOptions"
                      :key="it.code"
                      :label="it.name"
                      :value="it.code"
                    />
                  </el-select>

                  <el-slider
                    v-if="itemChildList.type == 'el-slider'"
                    v-model="formData[itemChildList.name]"
                    @change="(val) => changed(val, itemChildList.name)"
                  />
                </el-form-item>
                <customColorComponents
                  v-if="itemChildList.type == 'customColor'"
                  :key="'b-' + idx"
                  v-model="formData[itemChildList.name]"
                  @change="changed($event, itemChildList.name)"
                />
                <componentLinkage
                  v-if="itemChildList.type == 'componentLinkage'"
                  :key="'cl-' + idx"
                  v-model="formData[itemChildList.name]"
                  :layer-widget="layerWidget"
                  :widget-params-config="widgetParamsConfig"
                  :widget-index="widgetIndex"
                  @change="changed($event, itemChildList.name)"
                />
              </template>
            </el-collapse-item>
          </el-collapse>
        </div>
      </template>
    </el-form>
  </div>
</template>

<script>
import ColorPicker from "./colorPicker.vue";
import vueJsonEditor from "vue-json-editor";
import "codemirror/lib/codemirror.css"; // 核心样式
import "codemirror/theme/cobalt.css"; // 引入主题后还需要在 options 中指定主题才会生效
// language
import "codemirror/mode/vue/vue.js";
import "codemirror/mode/javascript/javascript.js";
import "codemirror/mode/sql/sql.js";
import "codemirror/mode/shell/shell.js";
import dynamicComponents from "./dynamicComponents.vue";
import customColorComponents from "./customColorComponents";
import dynamicAddTable from "./dynamicAddTable.vue";
import customUpload from "./customUpload.vue";
import dynamicAddRadar from "./dynamicAddRadar";
import MonacoEditor from "@/components/MonacoEditor/index";
import componentLinkage from './componentLinkage';
export default {
  name: "DynamicForm",
  components: {
    ColorPicker,
    vueJsonEditor,
    dynamicComponents,
    customColorComponents,
    dynamicAddTable,
    customUpload,
    dynamicAddRadar,
    MonacoEditor,
    componentLinkage
  },
  model: {
    prop: "value",
    event: "input",
  },
  props: {
    options: Array,
    value: {
      type: [Object],
      default: () => {},
    },
    layerWidget: {
      type: Array,
      default: () => []
    },
    widgetParamsConfig: {
      type: Array,
      default: () => []
    },
    widgetIndex: {
      type: Number,
      default: -1
    }
  },
  data() {
    return {
      formData: {},
      inputShow: {}, // 控制表单是否显示
      dialogVisibleStaticData: false,
      methodsVisible: false,
      validationRules: "",
      optionsJavascript: {
        mode: "text/javascript",
        tabSize: 2, // 缩进格式
        lineNumbers: true, // 显示行号
        line: true,
        styleActiveLine: true, // 高亮选中行

        hintOptions: {
          completeSingle: true, // 当匹配只有一项的时候是否自动补全
        },
      },
    };
  },
  watch: {
    value(newValue, oldValue) {
      this.formData = newValue || {};
    },
    options(val) {
      this.setDefaultValue();
      this.isShowData();
    },
  },
  created() {
    this.isShowData();
    this.setDefaultValue();
  },
  mounted() {},
  methods: {
    onJsonChange(val) {
      console.log(val);
    },
    onJsonSave(val) {
      console.log(val);
    },
    // 无论哪个输入框改变 都需要触发事件 将值回传
    changed(val, key) {
      console.log(val);
      console.log(key);
      if (val.extend) {
        this.$set(this.formData, key, val.value);
      } else {
        this.$set(this.formData, key, val);
      }

      this.$emit("onChanged", this.formData);
      // key为当前用户操作的表单组件
      for (let i = 0; i < this.options.length; i++) {
        let item = this.options[i];
        if (item.relactiveDom == key) {
          this.inputShow[item.name] = val == item.relactiveDomValue;
          this.inputShow = Object.assign({}, this.inputShow);
        }
      }
    },
    saveData() {
      this.$emit("onChanged", this.formData);
      this.dialogVisibleStaticData = false;
      this.methodsVisible = false;
    },
    // 静态数据
    addStaticData() {
      this.dialogVisibleStaticData = true;
    },
    handleClose() {
      this.dialogVisibleStaticData = false;
      this.methodsVisible = false;
    },
    // 组件属性 数据是否展示动态还是静态数据
    isShowData() {
      let currentData = {};
      const data = [];
      for (let i = 0; i < this.options.length; i++) {
        // 添加默认的inputShow值
        this.inputShow[this.options[i].name] = true;
        if (this.options[i].selectValue) {
          currentData = this.options[i];
        } else {
          data.push(this.options[i]);
        }
      }
      data.forEach((el) => {
        if (el.relactiveDomValue != currentData.value) {
          this.inputShow[el.name] = false;
        }
      });
    },
    // 组件拖入时 赋值
    setDefaultValue() {
      if (this.options && this.options.length > 0) {
        for (let i = 0; i < this.options.length; i++) {
          const obj = this.options[i];
          if (Object.prototype.toString.call(obj) == "[object Object]") {
            this.formData[this.options[i].name] = this.deepClone(
              this.options[i].value
            );
          } else if (Object.prototype.toString.call(obj) == "[object Array]") {
            for (let j = 0; j < obj.length; j++) {
              const list = obj[j].list;
              list.forEach((el) => {
                this.formData[el.name] = el.value;
              });
            }
          }
        }
        this.formData = Object.assign({}, this.formData);
      }
    },
    // 是否显示 那种格式
    isShowForm(val, type) {
      return Object.prototype.toString.call(val) == type;
    },
  },
};
</script>

<style scoped lang="scss">
/deep/ .el-form-item {
  margin-bottom: 5px;
}
/deep/ .el-form-item__label {
  font-size: 12px;
  color: #fff;
}
.code-mirror {
  width: 100%;
  height: 100% !important;
}
.el-collapse {
  border-top: none;
  border-bottom: none;
}
/deep/.el-collapse-item__header {
  height: 40px;
  line-height: 40px;
  background: transparent;
  color: #bcc9d4;
  font-weight: 300;
  font-size: 12px;
  border-color: #282e3a;
}
/deep/.el-collapse-item__wrap {
  background: transparent;
  border: none;
}
/deep/.el-collapse-item__content {
  padding-bottom: 0;
}
</style>
