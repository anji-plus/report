<template>
  <div class="view-container">
    <div v-if="getBindValue.treeOptions" class="view-container-left">
      <JsqTree default-expand-all v-bind="getTreeBindValue" :node-props="toClickTree" />
    </div>
    <div class="view-container-right">
      <JsqSearchForm v-bind="getSearchFormOption" @change='change'/>
      <JsqButtons v-bind="getTableButtonsOptions" class="view-container-right-btn"/>
      <JsqTable v-bind="getTableOptions" />
    </div>
  </div>
</template>
<script lang="ts" setup>
  import { onMounted, ref, unref, useAttrs, computed, watch } from 'vue';
  import { basicProps } from './props';
  import { CrudActionType } from './types';
  import { deepMerge } from '@/utils';

  import type { TreeOption } from 'naive-ui'

  import { JsqTree } from '@/components/Base/Jsq-tree';
  import { JsqTable } from '@/components/Base/Jsq-table'
  import { JsqSearchForm } from './components/Jsq-searchForm';
  import { JsqButtons } from './components/Jsq-buttons'

  const formModel = ref({})
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

  const getTreeBindValue = computed(() => {
    return unref(getBindValue).treeOptions
  })

  const getSearchFormOption = computed(() => {
    return unref(getBindValue).searchFormOption
  })

  const getTableButtonsOptions = computed(() => {
    return unref(getBindValue).tableButtonsOptions
  })
 
  const getTableOptions = computed(() => {
    const tableOptions = setTableOptions(unref(getBindValue).tableOptions)
    return tableOptions
  })

  const setTableOptions = (options) => {
    const tableOptions = options || {}
    tableOptions['row-key'] = (row: any) => row.id
    tableOptions['on-update:checked-row-keys'] = handleCheck
    tableOptions['on-update:page'] = handlePage
    tableOptions['on-update:page-size'] = handlePageSize
    return tableOptions
  }

  // 表格复选框选中
  const handleCheck = (val, rows) => {
    console.log(val)
    console.log(rows)
  }

  // 分页页码
  const handlePage = (page: number) => {
    console.log('page', page)
  }

  // 分页条数
  const handlePageSize = (pageSize: number) => {
    console.log('pageSize', pageSize)
  }
  
  const setProps = async (curdProps: any): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, curdProps);
  };

  const toClickTree = ({ option }: { option: TreeOption }) => {
    return { 
      onClick() {
        console.log(option)
      }
    }
  } 

  const change = (form) => {
    formModel.value = deepMerge(unref(propsRef) || {}, form);
  }

  watch(() => unref(getTableOptions)?.queryApi, 
  () => {
    loadData()
  })

  const loadData = async () => {
    const { code, data } = await unref(getTableOptions)?.queryApi()
    if(code != 200) return
    const { records, total } = data
    unref(getTableOptions)['data'] = records
    unref(getTableOptions)['pageCount'] = total
  }

  // 新增
  const toAdd = () => {
    console.log('新增')
  }

  // 编辑
  const toUpdate = (row) => {
    console.log(row)
    console.log('编辑')
  }

  // 批量删除
  const toRemoveAll = () => {

    console.log('批量删除')
  }

  // 删除
  const toRemove = (row) => {
    console.log(row)
    console.log('删除')
  }

  const crudMethods: CrudActionType = {
    setProps,
    toAdd,
    toUpdate,
    toRemoveAll,
    toRemove,
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
      &-btn {
        margin-top: 10px;
      }
    }
  }
</style>
