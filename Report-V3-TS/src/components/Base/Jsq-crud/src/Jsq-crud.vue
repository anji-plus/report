<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-08 23:50:09
-->
<template>
  <div class="view-container">
    <div v-if="getBindValue.treeOptions" class="view-container-left">
      <JsqTree default-expand-all v-bind="getTreeBindValue" :node-props="toClickTree" />
    </div>
    <div class="view-container-right">
      <JsqSearchForm v-model="formModel" v-bind="getSearchFormOption" @toRestForm='toRestForm' @toQuery="toQuery"/>
      <JsqButtons v-bind="getTableButtonsOptions" class="view-container-right-btn"/>
      <JsqTable v-bind="getTableOptions" />
    </div>
  </div>
  <JsqDialog ref="dialogRef" v-bind='getTableOptions'/>
</template>
<script lang="ts" setup>
  import { onMounted, ref, unref, useAttrs, computed, watch, onBeforeMount } from 'vue';
  import { basicProps } from './props';
  import { CrudActionType, serachFormProps } from './types';
  import { deepMerge } from '@/utils';
  import { cloneDeep } from 'lodash-es'
  import { editFormShow } from '@/enums/common';

  import type { TreeOption } from 'naive-ui'
  import { useDialog, useMessage } from 'naive-ui'

  import { JsqTree } from '@/components/Base/Jsq-tree';
  import { JsqTable } from '@/components/Base/Jsq-table'
  import { JsqSearchForm } from './components/Jsq-searchForm';
  import { JsqButtons } from './components/Jsq-buttons'
  import JsqDialog from './components/jsq-dialog.vue'

  const message = useMessage()
  const dialog = useDialog()

  const dialogRef = ref<InstanceType<typeof JsqDialog> | null>(null)
  const tableColumnsCache = ref()
  const formModel = ref({})
  const selectIds = ref<string[]>([])
  const selectSections = ref<serachFormProps[]>([])
  const treePrams = ref<serachFormProps>({})

  let pageNumber = ref<number>(1)
  let pageSize = ref<number>(10) 
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
    return setTableAndEditOptions(unref(getBindValue).tableOptions)
  })

  /**
   * 将table 编辑数据进行处理
   */
  onBeforeMount(() => {
    setTimeout(() => {
      const tableOptions = unref(getTableOptions)
      tableColumnsCache.value = cloneDeep(tableOptions.columns)
      if(tableOptions && tableOptions.columns) {
        const tableColumns = unref(tableColumnsCache).filter(item => !item.tableHide)
        const editColumns = unref(tableColumnsCache).filter(item => isEditShow(item.editHide))
        tableOptions.columns = tableColumns
        tableOptions.editColumns = editColumns
      }
    })
  });

  const isEditShow = (val: editFormShow | boolean) => {
    if(typeof val === 'boolean' || typeof val === 'undefined') {
      return !val
    }
    return Object.values(editFormShow).includes(val)
  }

  /**
   * columns 分开编辑配置，表格配置
   * 分页配置
   * */ 
  const setTableAndEditOptions = (options) => {
    const tableOptions = options || {}

    tableOptions['row-key'] = (row: any) => row.id
    tableOptions['on-update:checked-row-keys'] = handleCheck
    tableOptions['page'] = unref(pageNumber)
    tableOptions['page-size'] = unref(pageSize)
    tableOptions['on-update:page'] = handlePage
    tableOptions['on-update:page-size'] = handlePageSize
    return tableOptions
  }

  // 表格复选框选中
  const handleCheck = (val, rows) => {
    selectIds.value = val
    selectSections.value = rows
  }

  // 分页页码
  const handlePage = (page: number) => {
    pageNumber.value = page
    loadData()
  }

  // 分页条数
  const handlePageSize = (pageSizes: number) => {
    pageNumber.value = 1
    pageSize.value = pageSizes
    loadData()
  }
  
  const setProps = async (curdProps: any): Promise<void> => {
    propsRef.value = deepMerge(unref(propsRef) || {}, curdProps);
  };

  const toClickTree = ({ option }: { option: TreeOption }) => {
    return { 
      onClick() {
        const filed = unref(getTreeBindValue)?.['field']
        const keyField = unref(getTreeBindValue)?.['keyField']
        unref(treePrams)[filed] = option[keyField]
        loadData()
      }
    }
  }

  watch(() => unref(getTableOptions)?.queryApi, 
  () => {
    loadData()
  })

  // 获取查询参数
  const getSearchForm = (searchForm?: serachFormProps) => {
    const params = deepMerge(unref(formModel), searchForm || {})
    params['pageSize'] = unref(pageSize)
    params['pageNumber'] = unref(pageNumber)
    return deepMerge(params, unref(treePrams))
  }

  const loadData = async () => {
    const params = getSearchForm()
    const { code, data } = await unref(getTableOptions)?.queryApi(params)
    if(code != 200) return
    const { records, pages } = data
    unref(getTableOptions)['data'] = records
    unref(getTableOptions)['pageCount'] = pages
  }

  const toQuery = () => {
    loadData()
  }

  const toRestForm = () => {
    formModel.value = {}
    treePrams.value = {}
    pageNumber.value = 1
    pageSize.value = 10
    loadData()
  }

  // 新增
  const toAdd = () => {
    console.log(getSearchForm())
    dialogRef.value?.initModel()  
  }

  // 编辑
  const toUpdate = (row) => {
    console.log(row)
    console.log('编辑')
    dialogRef.value?.initModel()
  }

  // 批量删除
  const toRemoveAll = () => {
    dialog.warning({
      title: '提示！',
      content: '你确定删除选中的数据？',
      positiveText: '确定',
      negativeText: '取消',
      onPositiveClick: async () => {
        const { code, message } = await unref(getTableOptions)?.removeApi(selectIds)
        if(code != 200) return
         message.success(message)
      },
      onNegativeClick: () => {
        message.error('取消成功')
      }
    })
  }

  // 删除
  const toRemove = (row) => {    
    const ids = [row.id]
    dialog.warning({
      title: '提示！',
      content: '你确定删除该条数据？',
      positiveText: '确定',
      negativeText: '取消',
      onPositiveClick: async () => {
        const { code, message } = await unref(getTableOptions)?.removeApi(ids)
        if(code != 200) return
         message.success(message)
      },
      onNegativeClick: () => {
        message.error('取消成功')
      }
    })
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
