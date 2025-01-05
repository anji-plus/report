<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-05 01:24:51
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
  </div>
</template>
<script lang="ts" setup>
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { getFormSchemas, getTreeOptions, getTableButtons, getTableColumns } from './utils/schemas';
  import { getPageList, addAccessAuthority, updateAccessAuthority, deleteBatchAccessAuthority, getDetail } from '@/api/access/accessAuthority'

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
    treeOptions: getTreeOptions(), // 左侧树
    searchFormOption: {         // 搜索条件
      schemas: getFormSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive table 其他属性
      tableButtons: rowsButtons
    },
    tableOptions: {
      columns: columns, // 表格配置
      queryApi: getPageList, // 查询
      addApi: addAccessAuthority, // 新增
      removeApi: deleteBatchAccessAuthority, // 删除
      updateApi: updateAccessAuthority, // 修改
      getDataByIdApi: getDetail // 查询详情页
    }
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
