<template>
  <div class="dashboard-container">
    <div class="dashboard-text">设备总览 </div>
    <Summary></Summary>
  </div>
</template>

<script>
import Summary from "@/views/deviceLog/logSummary/summary.vue"
  export default {
    name: 'index',
    components:{
      Summary,
    },
    computed: { 
     
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.dashboard {
  &-container {
    margin: 0;
  }
  &-text {
    font-size:20px;
    line-height:36px;
    text-indent: 1.2rem;
  }
}
</style>
