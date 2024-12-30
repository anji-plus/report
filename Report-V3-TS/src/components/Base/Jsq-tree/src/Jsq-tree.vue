<template>
  <n-space vertical :size="12">
    <n-input v-model:value="pattern" placeholder="搜索" clearable />
    <h3>{{ treeTitle }}</h3>
    <n-tree
      v-bind="getBindValue"
      :show-irrelevant-nodes="showIrrelevantNodes"
      :pattern="pattern"
      :data="treeData"
      block-line
    />
  </n-space>
</template>
<script lang="ts" setup>
  import { ref, computed, useAttrs, onMounted, unref } from 'vue';
  import type { TreeOption } from 'naive-ui';
  import type { TreeActionType } from './types/index';
  import type { TreeProps } from 'naive-ui/lib/tree';

  import { basicProps } from './props';
  import { deepMerge, removeTreeNotValChildren } from '@/utils';

  const props = defineProps({ ...basicProps });
  const attrs = useAttrs();
  const emit = defineEmits(['register']);

  const pattern = ref('');
  const showIrrelevantNodes = ref(false);
  const treeData = ref<TreeOption[]>([]);

  const propsRef = ref<Partial<TreeProps>>({});

  const getProps = computed(() => {
    return { ...props, ...(unref(propsRef) as any) };
  });
  const getBindValue = computed(() => ({ ...attrs, ...props, ...unref(getProps) } as Recordable));

  const setProps = async (treeProps: Partial<TreeProps>): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, treeProps);
  };

  // 查询tree数据
  const loadData = async (params?: any) => {
    const { api } = getBindValue.value;
    if (!api) return;
    const { code, data } = await api(params);
    if (code != 200) return;
    treeData.value = removeTreeNotValChildren(data);
  };

  const TreeMethods: TreeActionType = {
    setProps,
    loadData,
  };

  onMounted(() => {
    emit('register', TreeMethods);
  });

  defineExpose({
    ...TreeMethods,
  });
</script>
<style lang="less" scoped></style>
