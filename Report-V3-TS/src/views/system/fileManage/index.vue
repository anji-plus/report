<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-10 15:54:36
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
  </div>
</template>
<script lang="ts" setup>
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { getFormSchemas, getTableButtons, getDialogRecordingSchemas, getTableColumns } from './utils/schemas';
  import { toGetPageList, toAddApi, toUpdateApi, toDeleteApi, toGetDataDetailApi } from '@/api/system/fileManage'

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

  const { rowsButtons } = getTableButtons({ addClick, removeAll })
  const { columns } = getTableColumns({ updateClick, removeSingle })

  const [register, { toAdd, toUpdate, toRemoveAll, toRemove }] = useCrud({
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
