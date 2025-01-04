<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-04 18:23:35
-->
<template>
  <div class="table">
    <n-data-table
      v-bind="getBindValue"
      :single-line="false"
      :max-height="300"
      :columns="getBindValue.columns"
      default-expand-all
    />
  </div>
  <div class="pagination">
    <n-pagination
      :display-order="['pages', 'quick-jumper', 'size-picker']"
      :page-count="100"
      show-quick-jumper
      show-size-picker
    />
  </div>

</template>
<script lang='ts' setup>
import { useAttrs, computed } from 'vue'
import { basicProps } from './props'

const props = defineProps({ ...basicProps })
const attrs = useAttrs()
const getBindValue = computed(() => ({  ...props, ...attrs } as Recordable));
console.log('table', getBindValue)

</script>
<style lang='less' scoped>
.table {
  height: 300px;
  width: 100%;
  margin-top: 10px;
}
.pagination {
  float: right;
  margin-top: 10px;
}
</style>
