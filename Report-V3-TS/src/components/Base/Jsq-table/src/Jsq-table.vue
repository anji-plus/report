<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-04 23:37:00
-->
<template>
  <div class="table">
    <n-data-table v-bind="getBindValue" />
  </div>
  <div class="pagination">
    <n-pagination  v-bind="getBindValue" />
  </div>

</template>
<script lang='ts' setup>
import { useAttrs, computed } from 'vue'
import { basicProps } from './props'

const props = defineProps({ ...basicProps })
const attrs = useAttrs()
const emit = defineEmits(['handlePage', 'handlePageSize'])
const getBindValue = computed(() => ({  ...props, ...attrs } as Recordable));

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
