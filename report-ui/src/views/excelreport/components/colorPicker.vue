<!--
 * @Descripttion:
 * @Author: yanzili
 * @Date: 2021-6-24 10:23:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 12:04:24
 !-->
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
<style lang="scss">
.el-color-picker--mini,
.el-color-picker--mini .el-color-picker__trigger {
  width: 23px;
  height: 23px;
}
</style>
