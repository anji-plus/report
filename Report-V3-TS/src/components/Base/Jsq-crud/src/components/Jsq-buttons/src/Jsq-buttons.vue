<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 23:45:51
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-04 16:26:43
-->
<template>
  <n-space>
    <n-button v-for="(item, index) in getSchema"
      v-bind="getBindValue"
      v-permission="item.permission" :key="index" :type="item.type" size="small" @click="item.click()">
      {{ item.label }}
    </n-button>
  </n-space>
</template>
<script lang="ts" setup>
import { useAttrs, unref, computed } from 'vue';
import { baseProps } from './props'

const props = defineProps({ ...baseProps })
const attrs = useAttrs()

const getBindValue = computed(
  () => ({ ...attrs, ...props } as Recordable),
);

const getSchema = computed(() => {
  return unref(getBindValue).tableButtons || []
})

</script>

<style lang="less" scoped>
</style>
