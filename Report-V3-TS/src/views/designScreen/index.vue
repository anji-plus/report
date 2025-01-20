<!--
 * @Author: qianlishi 1432731663@qq.com
 * @Date: 2025-01-16 15:34:57
 * @LastEditors: Do not edit
 * @LastEditTime: 2025-01-17 08:13:07
-->
<template>
  <div class="designContainer">
    <n-layout>
      <n-layout-header>
        <!-- 顶部 -->
        <LayoutHeader />
      </n-layout-header>
      <n-layout has-sider sider-placement="right">
         <!-- 左侧 -->
         <LayoutLeft />
        <n-layout-content>
          <!-- 中间画布 -->
          <LayOutContent />
        </n-layout-content>
        <!-- 右侧配置 -->
        <LayOutRight />
      </n-layout>
    </n-layout>
  </div>
</template>  
<script lang='ts' setup>
  import LayoutHeader from './layout/LayoutHeader/index.vue'
  import LayoutLeft from './layout/LayoutLeft/index.vue'
  import LayOutContent from './layout/LayoutContent/index.vue'
  import LayOutRight from './layout/LayoutRight/index.vue'
</script>
<style lang="less" scoped>
.designContainer {
  width: 100%;
  height: 100vh;
  overflow: hidden;
  background: red;
}
</style>

