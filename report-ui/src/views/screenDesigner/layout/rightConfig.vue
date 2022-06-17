<!--
 * @Descripttion: 大屏右侧配置
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-05-12 11:05:54
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-14 11:52:30
-->
<template>
  <div class="layout-right">
    <el-tabs v-model="activeName" type="border-card" :stretch="true">
      <el-tab-pane
        v-if="
          isNotNull(widgetOptions.setup) || isNotNull(widgetOptions.collapse)
        "
        name="first"
        label="配置"
      >
        <dynamicForm
          ref="formData"
          :options="widgetOptions.setup"
          @onChanged="val => widgetValueChanged('setup', val)"
        />
      </el-tab-pane>
      <el-tab-pane
        v-if="isNotNull(widgetOptions.data)"
        name="second"
        label="数据"
      >
        <dynamicForm
          ref="formData"
          :options="widgetOptions.data"
          @onChanged="val => widgetValueChanged('data', val)"
        />
      </el-tab-pane>
      <el-tab-pane
        v-if="isNotNull(widgetOptions.position)"
        name="third"
        label="坐标"
      >
        <dynamicForm
          ref="formData"
          :options="widgetOptions.position"
          @onChanged="val => widgetValueChanged('position', val)"
        />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
import dynamicForm from "../components/dynamicForm.vue";
export default {
  components: {
    dynamicForm
  },
  data() {
    return {
      activeName: "first"
    };
  },
  props: {
    widgetOptions: Object
  },
  methods: {
    widgetValueChanged(type, val) {
      this.$emit("widgetValueChanged", type, val);
    }
  }
};
</script>
