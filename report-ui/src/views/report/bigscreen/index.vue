<!--
 * @Author: lide1202@hotmail.com
 * @Date: 2021-3-13 11:04:24
 * @Last Modified by:   lide1202@hotmail.com
 * @Last Modified time: 2021-3-13 11:04:24
 !-->
<template>
  <div class="main-layout">
    <el-row :gutter="20">
      <el-col v-for="item in list"
              :key="item.id"
              :span="6">
        <div class="bg">
          <div class="rgba" />
          <div class="content">
            <header>{{ item.name }}</header>
            <footer>
              {{ item.time }}
              <div class="operation">
                <el-button icon="el-icon-view"
                           class="view"
                           type="text"
                           @click="viewDesign(item.id)" />
                <el-button icon="el-icon-edit"
                           class="edit"
                           type="text"
                           @click="openDesign(item.id)" />
              </div>
            </footer>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'Login',
  components: {},
  data () {
    return {
      list: [
        {
          id: 1,
          name: '货物在途大屏',
          time: '2021-3-19 17:54:00',
        },
        {
          id: 2,
          name: '仓库库容大屏',
          time: '2021-3-19 17:54:00',
        },
        {
          id: 3,
          name: '运输时效大屏',
          time: '2021-3-19 17:54:00',
        },
        {
          id: 4,
          name: '运输时效大屏1',
          time: '2021-3-19 17:54:00',
        },
        {
          id: 5,
          name: '运输时效大屏2',
          time: '2021-3-19 17:54:00',
        },
      ],
    }
  },
  mounted () { },
  methods: {
    openDesign (reportId) {
      var routeUrl = this.$router.resolve({ path: '/bigscreen/designer', query: { reportId: reportId } })
      window.open(routeUrl.href, '_blank')
    },
    viewDesign (reportId) {
      var routeUrl = this.$router.resolve({ path: '/bigscreen/viewer', query: { reportId: reportId } })
      window.open(routeUrl.href, '_blank')
    },
  },
}
</script>

<style scoped lang="scss">
.main-layout {
  position: relative;
  height: auto;
  header {
    font-size: 24px;
    text-align: center;
    line-height: 80px;
  }
  .bg {
    width: 100%;
    height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px 0;
    border: 12px solid white;
  }

  .bg::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background-image: url("../../../assets/images/charts.jpg");
    background-size: 100% 100%;
    background-repeat: no-repeat;
    background-position: left top;
    filter: blur(6px);
    z-index: 2;
  }
  .content {
    width: 100%;
    height: 100%;
    position: absolute;
    color: #fff;
    left: 0;
    top: 0;
    z-index: 3;
  }
  footer {
    width: 100%;
    font-size: 14px;
    padding: 16px;
    line-height: 30px;
    position: absolute;
    z-index: 3;
    bottom: 0;
    .operation {
      float: right;
      .view,
      .edit {
        color: #fff;
        font-size: 14px;
      }
    }
  }
}
</style>
