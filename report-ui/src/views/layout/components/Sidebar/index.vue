<template>
  <el-scrollbar wrap-class="scrollbar-wrapper">
    <div class="admin-title" @click="goBigScreen">
      <div class="con">
        <img src="/static/logo-dp.png" width="50" />
        <span class="version">V1.7.0</span>
      </div>
    </div>
    <el-menu
      :show-timeout="200"
      :default-active="$route.path"
      :collapse="isCollapse"
      mode="vertical"
    >
      <sidebar-item
        v-for="route in routes"
        :key="route.path"
        :item="route"
        :base-path="route.path"
      />
    </el-menu>
  </el-scrollbar>
</template>

<script>
import { mapGetters } from "vuex";
import SidebarItem from "./SidebarItem";

export default {
  components: { SidebarItem },
  computed: {
    ...mapGetters(["sidebar"]),
    routes() {
      return this.$router.options.routes;
    },
    isCollapse() {
      return !this.sidebar.opened;
    }
  },
  methods: {
    goBigScreen() {
      let routeUrl = this.$router.resolve({
        path: "/report/bigScreen"
      });
      window.open(routeUrl.href, "_blank");
    }
  }
};
</script>

<style lang="scss" scoped>
.admin-title {
  // height: 60px;
  // line-height: 60px;
  text-align: center;
  width: 100%;
  font-weight: 500;
  color: #333;
  font-size: 14px;
  background: #fff;
  .con {
    margin: auto;
    img {
      margin-top: 10px;
    }
    .version {
      display: inline-block;
      font-size: 12px;
      color: #fff;
      background: #4FADFD;
      padding: 2px;
      border-radius: 10px;
    }
  }
}
.admin-title:hover {
  cursor: pointer;
}
</style>
