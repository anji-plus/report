<!--
 * @Description: 
 * @Author: qianlishi
 * @Date: 2024-12-08 17:49:23
 * @LastEditors: qianlishi
 * @LastEditTime: 2024-12-13 15:58:45
-->
<template>
  <div class="index-container">
    <div class="bg"></div>
  </div>
</template>
<script setup lang="ts"></script>
<style lang="less" scoped>
.index-container {
  width: 100%;
  height: calc(100vh - 118px);
  overflow: hidden;
  background: #fff;
  background: -webkit-linear-gradient(75deg,
      #e9f0fb,
      #5bc4ef);
  /* Safari 5.1 - 6.0 */
  background: -o-linear-gradient(75deg,
      #e9f0fb,
      #5bc4ef);
  /* Opera 11.1 - 12.0 */
  background: -moz-linear-gradient(75deg,
      #e9f0fb,
      #5bc4ef);
  /* Firefox 3.6 - 15 */
  background: linear-gradient(75deg, #e9f0fb, #e9f0fb);

  .bg {
    width: 100%;
    height: 100%;
    background: url('@/assets/imgs/index-center.png') no-repeat;
    background-size: cover;
  }

}
</style>
