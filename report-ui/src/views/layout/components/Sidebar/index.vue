<template>
  <el-scrollbar wrap-class="scrollbar-wrapper">
    <div class="admin-title" @click="goBigScreen">
      <img src="../../../../../static/logo-dp.png" width="50" class="mt10" />
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
    <div class="version">V0.9.5</div>
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
  height: 60px;
  line-height: 60px;
  text-align: center;
  width: 100%;
  font-weight: 500;
  color: #333;
  font-size: 14px;
  background: #fff;
}
.admin-title:hover {
  cursor: pointer;
}
.version {
  color: #999;
  position: absolute;
  bottom: 10px;
  font-size: 16px;
  margin-left: 10px;
}
</style>
