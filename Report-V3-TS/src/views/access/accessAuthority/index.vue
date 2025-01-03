<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:38:28
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-03 03:07:27
-->
<template>
  <div class="view-container">
    <div class="view-container-left">
      <JsqTree
        default-expand-all
        key-field="id"
        label-field="label"
        @register="register"
        :node-props="nodeProps"
      />
    </div>
    <div class="view-container-right">
      <!-- <JsqSelect @register="register1" /> -->
      <JsqSearchForm @register="register2" />
      <Test v-bind="obj" />
    </div>
  </div>
</template>
<script lang="ts" setup>
  import { ref, onMounted } from 'vue';
  import { useTree, JsqTree } from '@/components/Base/Jsq-tree';
  import { useSelect, JsqSelect } from '@/components/Base/Jsq-select';
  import { useJsqSearchForm, JsqSearchForm } from '@/components/Base/Jsq-searchForm';
  import Test from './components/test.vue';

  import { getAuthorityTree } from '@/api/access/accessAuthority';
  import { formSchemas } from './components/schemas';

  const [register2, {}] = useJsqSearchForm({
    schemas: formSchemas({}),
  });

  const [register1, {}] = useSelect({});

  const obj = ref({ a: 1, b: 2, c: 3 });

  const [register, { loadData }] = useTree({
    api: getAuthorityTree,
  });
  const nodeProps = ({ option }: { option: any }) => {
    return {
      onClick() {
        console.log(11, option);
        console.log(22, option);
      },
    };
  };
  onMounted(() => {
    loadData({ a: 1 });
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
