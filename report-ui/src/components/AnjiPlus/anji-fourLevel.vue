 <!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:17:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 11:20:24
 !-->
<template>
  <el-cascader ref="country" v-model="countryValue" size="mini" :props="props" :options="countryOptions" style="width: 100%" clearable @change="handleChange" />
</template>
<script>
import { postRequest } from '@/api/common.js'
export default {
  props: {
    value: null,
  },
  data() {
    return {
      countryValue: [],
      props: {
        value: 'value',
        label: 'label',
        children: 'children',
      },
      countryOptions: [],
    }
  },
  watch: {
    value(val) {
      this.handleCountryEcho(val)
    },
  },
  created() {
    this.provinceFn()
    this.handleCountryEcho(this.value)
  },
  methods: {
    // 获取省市区
    async provinceFn() {
      const { code, data } = await postRequest()
      if (code != 200) return
      this.countryOptions = data
    },
    handleChange(value) {
      if (value.length > 0) {
        const countryNameArr = this.$refs.country.getCheckedNodes()[0].pathLabels
        const countryObj = {
          countryName: countryNameArr[0],
          provinceName: countryNameArr[1],
          cityName: countryNameArr[2],
          areaName: countryNameArr[3],
          countryCode: value[0],
          provinceCode: value[1],
          cityCode: value[2],
          areaCode: value[3],
        }

        this.$emit('input', countryObj)
        this.$emit('change', countryObj)
      } else {
        this.$emit('input', {})
        this.$emit('change', {})
      }
    },
    handleCountryEcho(val) {
      if (val) {
        this.countryValue = [val.countryCode, val.provinceCode, val.cityCode, val.areaCode || val.regionCode]
      } else {
        this.countryValue = []
      }
    },
  },
}
</script>
<style lang="scss" scoped>
.con {
  display: inline-block;
}
</style>
