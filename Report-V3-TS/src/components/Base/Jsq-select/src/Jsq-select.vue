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
    return { ...props, ...(unref(propsRef) as any) };
  });

  const getOptions = computed(() => {
    const { api, dictCode, localOptions } = unref(getProps);
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

  watch(
    () => unref(getProps).api,
    (old, val) => {
      console.log(old);
      console.log(val);
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
