<!--
 * @Descripttion: 大屏设置器
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-03-14 14:05:15
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-04-28 12:23:34
-->
<template>
  <div class="layout">
    <div :style="bigScreenStyle">
      <widget
        v-for="(widget, index) in widgets"
        :key="index"
        v-model="widget.value"
        :type="widget.type"
      />
    </div>
  </div>
</template>

<script>
import widget from "./components/temp";
import { detailDashboard } from "@/api/bigscreen";
export default {
  name: "Login",
  components: {
    widget
  },
  data() {
    return {
      bigScreenStyle: {},
      widgets: []
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    async getData() {
      const reportCode = this.$route.query.reportCode;
      const { code, data } = await detailDashboard(reportCode);
      if (code != 200) return;
      const equipment = document.body.clientWidth;
      const ratioEquipment = equipment / data.dashboard.width;
      this.bigScreenStyle = {
        width: data.dashboard.width + "px",
        height: data.dashboard.height + "px",
        "background-color": data.dashboard.backgroundColor,
        "background-image": "url(" + data.dashboard.backgroundImage + ")",
        "background-position": "0% 0%",
        "background-size": "100% 100%",
        "background-repeat": "initial",
        "background-attachment": "initial",
        "background-origin": "initial",
        "background-clip": "initial",
        transform: `scale(${ratioEquipment}, ${ratioEquipment})`,
        "transform-origin": "0 0"
      };
      this.widgets = data.dashboard.widgets;
    }
  }
};
</script>

<style scoped lang="scss">
.layout {
  width: 100%;
  height: 100%;
  text-align: center;
}
.bottom-text {
  width: 100%;
  color: #a0a0a0;
  position: fixed;
  bottom: 16px;
  z-index: 9999;
}
</style>
