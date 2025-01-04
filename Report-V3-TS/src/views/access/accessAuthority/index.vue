<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-03 22:37:11
-->
<template>
  <div class="view-container">
    <JsqCrud @register="register" />
  </div>
</template>
<script lang="ts" setup>
  import { JsqCrud, useCrud } from '@/components/Base/Jsq-crud';
  import { formSchemas, treeOptions, tableButtons } from './utils/schemas';

  const [register, {}] = useCrud({
    treeOptions: treeOptions(), // 左侧树
    searchFormOption: {         // 搜索条件
      schemas: formSchemas({}).value,
    },
    tableButtonsOptions: {
      // 添加naive table 其他属性
      tableButtons: tableButtons()
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
