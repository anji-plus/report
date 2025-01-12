<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 23:45:51
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 21:33:34
-->
<template>
  <n-space>
    <n-button v-for="(item, index) in getSchema"
      v-bind="getBindValue"
      v-permission="item.permission" :key="index" :type="item.type" size="small" @click="item.click({ selectIds, selectSections })">
      {{ item.label }}
    </n-button>
  </n-space>
</template>
<script lang="ts" setup>
import { useAttrs, unref, computed } from 'vue';
import { baseProps } from './props'
import { omit } from 'lodash-es';

const props = defineProps({ ...baseProps })
const attrs = useAttrs()

const getProps = computed(
  () => ({ ...attrs, ...props } as Recordable),
);

// 表格批量选中的id
const selectIds = computed(() => unref(getProps).tableSelectIds)
// 表格批量选中的数据
const selectSections = computed(() => unref(getProps).tableSelectSections)

const getBindValue = computed(() => omit(unref(getProps), ['tableButtons', 'tableSelectIds', 'tableSelectSections']))

const getSchema = computed(() => {
  return unref(getProps).tableButtons || []
})

</script>

<style lang="less" scoped>
</style>
