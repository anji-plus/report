<template>
  <div class="index-container">
    <!-- <div class="left-top"></div>
    <div class="left-bottom"></div>
    <div class="right-top"></div>
    <div class="right-bottom"></div> -->
    <el-row align="middle" justify="center">
      <el-col :span="24" :offset="0" class="position">
        <div class="center"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'index1',
  data() {
    return {}
  },
  components: {},
  watch: {},
  mounted() {},
  methods: {},
}
</script>

<style rel="stylesheet/scss" lang="scss">
.index-container {
  width: 100%;
  height: calc(100vh - 50px);
  overflow: hidden;
  background: #fff;
  background: -webkit-linear-gradient(
    75deg,
    #e9f0fb,
    #5bc4ef
  ); /* Safari 5.1 - 6.0 */
  background: -o-linear-gradient(
    75deg,
    #e9f0fb,
    #5bc4ef
  ); /* Opera 11.1 - 12.0 */
  background: -moz-linear-gradient(
    75deg,
    #e9f0fb,
    #5bc4ef
  ); /* Firefox 3.6 - 15 */
  background: linear-gradient(75deg, #e9f0fb, #e9f0fb);
  .position {
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 0;
    position: absolute;
    top: 67px;
  }
  .left-top,
  .left-bottom,
  .right-top,
  .right-bottom {
    position: absolute;
  }
  .left-top {
    left: 0;
    top: 0;
    z-index: 1;
    width: 223px;
    height: 291px;
    background: url('../../../static/index-top-left.png');
    background-size: 100% 100%;
  }
  .left-bottom {
    left: 0;
    bottom: 0;
    z-index: 2;
    width: 461px;
    height: 236px;
    background: url('../../../static/index-bottom-left.png');
    background-size: 100% 100%;
  }
  .right-top {
    right: 0;
    top: 0;
    z-index: 31;
    width: 346px;
    height: 309px;
    background: url('../../../static/index-top-right.png');
    background-size: 100% 100%;
  }
  .right-bottom {
    right: 0;
    bottom: 0;
    z-index: 4;
    width: 463px;
    height: 320px;
    background: url('../../../static/index-bottom-right.png');
    background-size: 100% 100%;
  }
  .center {
    width: 100%;
    height: 93vh;
    bottom: 0;
    position: relative;
    max-width: 1893px;
    background: url('../../../static/index-center.png');
    background-size: 100% 100%;
  }
}
</style>
