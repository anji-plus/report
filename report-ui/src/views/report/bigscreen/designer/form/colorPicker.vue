<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-4-8 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-4-8 11:04:24
 !-->
<template>
  <el-popover placement="right" trigger="click">
    <Chrome v-model="colors" @input="updateValue" />
    <el-input slot="reference" v-model="colors.hex" placeholder="颜色选择器">
      <template #append><i class="iconfont iconcolorSelector" /></template>
    </el-input>
  </el-popover>
</template>

<script>
import { Chrome } from 'vue-color' // https://gitee.com/mirrors/vue-color  // Photoshop Chrome
export default {
  name: 'ColorPicker',
  components: {
    Chrome,
  },
  model: {
    prop: 'value',
    event: 'input',
  },
  props: {
    value: {
      type: [String],
      default: '',
    },
  },
  data() {
    return {
      colors: {
        hex: '',
        hsl: { h: 150, s: 0.5, l: 0.2, a: 1 },
        hsv: { h: 150, s: 0.66, v: 0.3, a: 1 },
        rgba: { r: 25, g: 77, b: 51, a: 1 },
      },
    }
  },
  watch: {
    value(val) {
      this.colors.hex = val
    }
  },
  mounted() {
    this.colors.hex = this.value
  },
  methods: {
    updateValue(value) {
      // this.colors = value
      this.$emit('input', value.hex)
      this.$emit('change', value.hex)
    },
  },
}
</script>

<style scoped lang="scss">
/deep/.el-input-group__append {
  width: 20px;
  padding: 0 5px;
}
</style>
