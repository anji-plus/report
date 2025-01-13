<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:49:41
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 21:26:25
-->
<template>
  <n-select v-bind="getBindValue" />
</template>
<script lang="ts" setup>
  import { ref, unref, useAttrs, computed, onMounted, watch } from 'vue';
  import type { SelectProps } from 'naive-ui/lib/select';
  import { basicProps } from './props';
  import { selectActionType } from './types';
  import { deepMerge, getDictName } from '@/utils';

  const props = defineProps({ ...basicProps });
  const attrs = useAttrs();
  const emit = defineEmits(['register']);
  const selectOptions = ref<any[]>([]);

  const propsRef = ref<Partial<SelectProps>>({});
  // 将标签传递的属性与hooks传递的参数合并
  const getProps = computed(() => {
    return { ...props, ...attrs, ...(unref(propsRef) as any) };
  });

  /**
   * 下拉框数据源优先级
   *  静态数据 > 数字字典 > 接口
   * */
  const getOptions = computed(() => {
    const { dictCode, localOptions } = unref(getProps);
    const options = localOptions
      ? localOptions
      : dictCode
      ? getDictName(dictCode)
      : selectOptions.value;
    return { options };
  });

  const getBindValue = computed(
    () => ({ ...attrs, ...props, ...unref(getProps), ...unref(getOptions) } as Recordable),
  );

  const setProps = async (selectProps: Partial<SelectProps>): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, selectProps);
  };

  const selectMethods: selectActionType = {
    setProps,
  };

  const loadData = async () => {
    const requestApi = unref(getProps).api;
    if (!requestApi) return;
    const { data } = await requestApi();
    selectOptions.value = data;
  };

  watch(
    () => unref(getProps).api,
    () => {
      loadData();
    },
    {
      immediate: true,
    },
  );

  onMounted(() => {
    emit('register', selectMethods);
  });

  defineExpose({
    ...selectMethods,
  });
</script>
<style lang="less" scoped></style>
