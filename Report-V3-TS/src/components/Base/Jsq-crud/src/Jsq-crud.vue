<template>
  <div class="view-container">
    <div class="view-container-left">
      <n-space vertical :size="12">
        <n-input v-model:value="pattern" placeholder="搜索" />
        <h3>所属菜单</h3>
        <n-tree
          default-expand-all
          :show-irrelevant-nodes="showIrrelevantNodes"
          :pattern="pattern"
          :data="data"
          block-line
        />
      </n-space>
    </div>
    <div class="view-container-right">右</div>
  </div>
</template>
<script lang="ts" setup></script>
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
