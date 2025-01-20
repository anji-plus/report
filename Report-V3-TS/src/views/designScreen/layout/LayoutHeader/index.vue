<!--
 * @Description: 设计器头部组件
 * @Author: qianlishi
 * @Date: 2025-01-16 16:30:35
 * @LastEditors: Do not edit
 * @LastEditTime: 2025-01-17 05:00:53
-->
<template>
  <div class="header">
    <div class="nav-left">
      <div class="home mr-20">
        <n-popover trigger="hover">
          <template #trigger>
            <span class="iconfont icon-shouye" />
          </template>
          <span>首页</span>
        </n-popover>
      </div>
      <div class="echarts mr-10">
        <n-popover trigger="hover">
          <template #trigger>
            <span class="iconfont icon-tubiao-qiapian" />
          </template>
          <span>图标收缩</span>
        </n-popover>
      </div>
      <div class="config mr-10">
        <n-popover trigger="hover">
          <template #trigger>
            <span class="iconfont icon-peizhi-fenqupeizhi" />
          </template>
          <span>配置项收缩</span>
        </n-popover>
      </div>
    </div>
    <div class="nav-content"></div>
    <div class="nav-right"></div>
  </div>
</template>
<script lang='ts' setup>
</script>
<style lang='less' scoped>
.header {
  width: 100%;
  height: 60px;
  border-bottom: 2px solid #fafafa;
  box-sizing: border-box;
  display: flex;
  padding: 0 20px;
  .nav-left {
    display: flex;
    line-height: 60px;
    .iconfont {
      font-size: 20px;
    }
  }
}
</style>
