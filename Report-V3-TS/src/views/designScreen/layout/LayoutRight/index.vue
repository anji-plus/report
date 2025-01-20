<template>
  <n-layout-sider 
      collapse-mode="transform"
      :collapsed-width="0"
      :width="350"
      :native-scrollbar="false"
      show-trigger="bar"
    >
    <div class="config">
      <n-scrollbar trigger="none">
        <n-tabs size="small" type="segment">
          <n-tab-pane name="chap1" tab="配置">
            配置
          </n-tab-pane>
          <n-tab-pane name="chap2" tab="动画">动画</n-tab-pane>
          <n-tab-pane name="chap3" tab="数据">数据</n-tab-pane>
          <n-tab-pane name="chap4" tab="事件">事件</n-tab-pane>
        </n-tabs>
      </n-scrollbar>
    </div>
  </n-layout-sider>
</template>
<script lang='ts' setup>

</script>
<style lang='less' scoped>
.config {
  height: calc(100vh - 60px);
  background: #f7f7fa;
  ::v-deep .n-tab-pane {
    background:#f7f7fa;
  }
}
</style>
