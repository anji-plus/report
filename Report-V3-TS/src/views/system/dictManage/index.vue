<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 21:57:32
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
  </div>
</template>
<script lang="ts" setup>
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { useMessage } from 'naive-ui'
  import { useRouter } from 'vue-router'
  import { isObject } from '@/utils/is'

  import { getFormSchemas, getTableButtons, getDialogRecordingSchemas, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toUpdateApi, toDeleteApi, toGetDataDetailApi, freshDict } from '@/api/system/dictManage'


  const router = useRouter();
  const messages = useMessage()

  // 刷新数字字典
  const toDictRefresh = async (data) => {
    const dictCodes = isObject(data) ? [data['dictCode']] : data.map(item => item.dictCode)
    const { code, message } = await freshDict(dictCodes)
    if(code != 200) return
    toQuery()
    messages.success(message)
  }

  // 新增
  const addClick = () => {
    toAdd()
  }

  // 批量删除
  const removeAll = () => {
    toRemoveAll()
  }

  // 编辑
  const updateClick = (row) => {
    toUpdate(row)
  }

  // 删除
  const removeSingle = (row) => {
    toRemove(row)
  }

  // 编辑字典项
  const toDictItem = (row) => {
    const { dictCode } = row
    router.push({
      path: '/dictItem',
      query: {
        dictCode
      }
    })
  }

  const { rowsButtons } = getTableButtons({ toDictRefresh, addClick, removeAll })
  const { columns } = getTableColumns({ updateClick, removeSingle, toDictItem, toDictRefresh })

  const [register, { toAdd, toUpdate, toRemoveAll, toRemove, toQuery }] = useCrud({
    searchFormOption: {
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive 按钮其他属性
      tableButtons: rowsButtons
    },
    dialogRecordingData: {
      width: 800,
      size: "small",
      labelPlacement: "left",
      labelWidth: 100,
      schemas: getDialogRecordingSchemas()
    },
    tableOptions: {
      // navie table配置
      columns: columns, // 表格配置
    },
    apiOptions: {
      queryApi: toGetPageList, // 查询
      addApi: toAddApi, // 新增
      removeApi: toDeleteApi, // 删除
      updateApi: toUpdateApi, // 修改
      getDataByIdApi: toGetDataDetailApi // 查询详情页
    }
  });
  
</script>
<style lang="less" scoped>
</style>
