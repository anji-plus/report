<!--
 * @Descripttion: 报表设计--报表管理
 * @Author: Devli
 * @Date: 2021-4-9 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-05-17 17:38:44
-->
<template>
  <el-input
    clearable
    v-model="colorValue"
    placeholder="请输入颜色"
    size="mini"
    @change="changeColor"
  >
    <template slot="append">
      <el-color-picker
        v-model="colorValue"
        :predefine="predefineColors"
        show-alpha
        size="mini"
        @change="changeColor"
      />
    </template>
  </el-input>
</template>

<script>
export default {
  name: "ColorPicker",
  model: {
    prop: "value",
    event: "input"
  },
  props: {
    value: {
      type: [String],
      default: ""
    }
  },
  data() {
    return {
      predefineColors: [
        "#ff4500",
        "#ff8c00",
        "#ffd700",
        "#90ee90",
        "#00ced1",
        "#1e90ff",
        "#c71585"
      ],
      colorValue: ""
    };
  },
  watch: {
    value(val) {
      this.colorValue = val || "";
    }
  },
  mounted() {
    this.colorValue = this.value;
  },
  methods: {
    changeColor(val) {
      this.colorValue = val || "";
      this.$emit("input", this.colorValue);
      this.$emit("change", this.colorValue);
    }
  }
};
</script>
<style scoped lang="scss">
::v-deep.el-color-picker--mini,
::v-deep.el-color-picker--mini .el-color-picker__trigger {
  width: 23px;
  height: 23px;
}
</style>
