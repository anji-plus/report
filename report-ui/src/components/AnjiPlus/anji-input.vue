<!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:17:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 11:20:24
 !-->
<template>
  <div class="anji-input">
    <el-input v-model="inputValue" type="number" :placeholder="placeholder" :disabled="disabled" clearable @change="change">
      <template slot="append">
        <el-dropdown @command="handleClick">
          <el-button type="primary"> {{ systemUnit }}</el-button>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item v-for="item in SystemTimeConversionRadioGroup" :key="item.label" :command="item">{{ item.label }}</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </template>
    </el-input>
  </div>
</template>
<script>
export default {
  props: {
    value: null,
    placeholder: null,
    unit: String,
    defaultUnit: String,
    disabled: Boolean,
  },
  data() {
    return {
      inputValue: '',
      input: '',
      unitObj: {},
      systemUnit: '', // 单位
      systemConversion: '', // 转换单位
      systemKeepPoint: '', // 保留小数位
      systemRounding: '', // 取整方案
      SystemTimeConversionRadioGroup: [], // 单位选择
    }
  },
  watch: {
    value: function (val, oldVal) {
      this.echoInputValue(val)
    },
  },
  mounted() {
    this.getLocalStorage()
    this.getSystemData()
    this.echoInputValue(this.value)
  },
  methods: {
    getSystemData() {
      const defaultUnit = this.defaultUnit
      this.systemKeepPoint = this.getSystemKeepPoint()
      this.systemRounding = this.getSystemRounding()
      this.SystemTimeConversionRadioGroup = this.getSystemTimeConversionRadioGroup()
      if (defaultUnit == undefined) {
        this.systemUnit = this.getSystemUnit()
        this.systemConversion = this.getSystemConversion()
      } else {
        this.systemUnit = defaultUnit
        this.systemConversion = this.SystemTimeConversionRadioGroup.find((item) => item.label == this.systemUnit)['value']
      }
    },
    // 获取单位
    getSystemUnit() {
      let unit = ''
      for (const key in this.unitObj) {
        if (key.toLowerCase().indexOf('conversiontext') != -1) {
          unit = this.unitObj[key]
        }
      }
      return unit
    },
    // 获取转换关系
    getSystemConversion() {
      let conversion = ''
      for (const key in this.unitObj) {
        if (key.toLowerCase().indexOf('conversion') != -1 && key.toLowerCase().indexOf('conversiontext') == -1 && key.toLowerCase().indexOf('conversionradiogroup') == -1) {
          conversion = this.unitObj[key]
        }
      }
      return conversion
    },
    // 获取保留几位小数
    getSystemKeepPoint() {
      let keepPoint = ''
      for (const key in this.unitObj) {
        if (key.toLowerCase().indexOf('keeppoint') != -1) {
          keepPoint = this.unitObj[key]
        }
      }
      return keepPoint
    },
    // 获取怎么取整
    getSystemRounding() {
      let rounding = ''
      for (const key in this.unitObj) {
        if (key.toLowerCase().indexOf('pointrounding') != -1) {
          rounding = this.unitObj[key]
        }
      }
      return rounding
    },
    // 获取各类型的全部单位
    getSystemTimeConversionRadioGroup() {
      let radionGroup = ''
      for (const key in this.unitObj) {
        if (key.toLowerCase().indexOf('radiogroup') != -1) {
          radionGroup = this.unitObj[key]
        }
      }
      return radionGroup
    },
    handleClick(command) {
      this.systemUnit = command.label
      this.systemConversion = command.value
      this.echoInputValue(this.value)
    },
    // 从本地获取数据
    getLocalStorage() {
      const localstorageData = this.getSettingByName('unit_conversion')
      const unitObj = {}
      for (const key in localstorageData) {
        if (key.toLowerCase().indexOf(this.unit.toLowerCase()) != -1) {
          unitObj[key] = localstorageData[key]
        }
      }
      this.unitObj = unitObj
    },
    change(val) {
      if (val === null || val === '') {
        this.$emit('input', val)
        this.$emit('change', val)
        return
      }
      this.inputValue = val
      if (this.systemRounding != undefined) {
        let newVal
        if (this.systemRounding == 'up') {
          newVal = this.upFixed(val, this.systemKeepPoint)
        }
        if (this.systemRounding == 'down') {
          newVal = this.downFixed(val, this.systemKeepPoint)
        }
        this.inputValue = newVal
        const value = (newVal || val) * this.systemConversion
        this.$emit('input', value)
        this.$emit('change', value)
      } else {
        const value = val * this.systemConversion
        this.inputValue = val
        this.$emit('input', value)
        this.$emit('change', value)
      }
    },
    echoInputValue(val) {
      if (val === undefined || val === '') {
        this.inputValue = ''
      } else {
        this.inputValue = val / this.systemConversion
      }
    },
    // 向上取整
    upFixed(num, fix) {
      return Math.ceil(num * Math.pow(10, fix)) / Math.pow(10, fix).toFixed(fix)
    },
    // 向下取整
    downFixed(num, fix) {
      return Math.floor(num * Math.pow(10, fix)) / Math.pow(10, fix).toFixed(fix)
    },
  },
}
</script>
<style lang="less" scoped>
/deep/.el-input__suffix {
  padding: 0 6px;
}
.anji-input /deep/ .el-input__inner {
  padding-right: 0 !important;
}
</style>
