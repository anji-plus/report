<!--
 * @Description: 使用于，表格行按钮超过2列出现更多展示按钮 
 * @Author: qianlishi
 * @Date: 2025-01-11 22:50:26
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-11 23:51:23
-->
<template>
  <div class="flex items-center justify-center">
    <template v-if="getActions.length <= 2">
        <template v-for="(action, index) in getActions" :key="`${index}-${action.label}`">
          <n-button v-bind="action" class="mx-1">
            {{ action.label }}
          </n-button>
        </template>
      </template>
      <template v-else>
        <n-button v-bind="getActions[0]" class="mx-1">
            {{ getActions[0].label }}
        </n-button>
        <n-dropdown trigger="hover" @select="select" :options="getActions.filter((item, index) => index > 0)">
          <n-button quaternary type="primary" icon-placement="right">
            更多
            <template #icon>
              <jsqIcon name="icon-zhankai" color="#3b82f680" :size='12'/>
            </template>
          </n-button>
        </n-dropdown> 
      </template>
  </div>
</template>
<script lang='ts' setup>
import { computed } from 'vue'
import jsqIcon from '@/components/Base/Jsq-icon/index.vue'

interface action {
  label: string; // 按钮文本
  key?: string | number, // 按钮标记
  onClick: () => void; // 按钮点击事件
  isShow?: (row?: object) => boolean; // 根据业务场景按钮是否显示 row当前行数据
  permission?: string; // 目前只考虑一个按钮只绑定一个权限码
}

interface actionsProps {
  actions: {
    type: action[],
    default: []
  },
  select: {
    type: Function,
    default: () => void,
  },
} 
const props =  defineProps<actionsProps>()
  console.log('111', props.actions)
const getActions = computed<action[]>(() => {
  return props.actions
})

</script>
<style lang='less' scoped></style>
