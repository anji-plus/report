<template>
  <div class="view-container">
    <div v-if="getBindValue.treeOptions" class="view-container-left">
      <JsqTree default-expand-all v-bind="getBindValue.treeOptions" :node-props="nodeProps" />
    </div>
    <div class="view-container-right">
      <JsqSearchForm v-bind="getBindValue.searchFormOption" />
    </div>
  </div>
</template>
<script lang="ts" setup>
  import { onMounted, ref, unref, useAttrs, computed } from 'vue';
  import { basicProps } from './props';
  import { CrudActionType } from './types';
  import { deepMerge } from '@/utils';
  import { JsqTree } from '@/components/Base/Jsq-tree';
  import { JsqSearchForm } from '@/components/Base/Jsq-crud/components/Jsq-searchForm';

  // props传递参数
  const props = defineProps({ ...basicProps });
  const attrs = useAttrs();
  const emit = defineEmits(['register']);

  const propsRef = ref<Partial<CrudActionType>>({});
  // 将标签传递的属性与hooks传递的参数合并
  const getProps = computed(() => {
    return { ...props, ...attrs, ...(unref(propsRef) as any) };
  });

  const getBindValue = computed(() => ({ ...attrs, ...props, ...unref(getProps) } as Recordable));
  console.log('value', getBindValue)
  const setProps = async (curdProps: any): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, curdProps);
  };

  const crudMethods: CrudActionType = {
    setProps,
  };   

  onMounted(() => {
    emit('register', crudMethods);
  });

  defineExpose({
    ...crudMethods,
  });
</script>
<style lang="less" scoped>
  .view-container {
    width: 100%;
    height: calc(100vh - 118px);
    display: flex;
    flex-direction: row;
    &-left {
      width: 20%;
      height: calc(100vh - 118px);
      overflow-y: auto;
      background: #fff;
      padding: 20px 10px;
      box-sizing: border-box;
    }
    &-right {
      background: #fff;
      flex: 1;
      padding: 20px 10px;
      margin-left: 6px;
    }
  }
</style>
