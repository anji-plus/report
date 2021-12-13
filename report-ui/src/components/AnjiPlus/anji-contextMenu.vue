<!--
 * @Descripttion: 右键菜单
 * @version: 
 * @Author: qianlishi
 * @Date: 2021-10-21 15:52:03
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-10-21 19:40:05
-->
<template>
  <div v-show="visible" class="contentmenu" :style="styleObj">
    <slot />
  </div>
</template>
<script>
export default {
  props: {
    styleObj: Object,
    visible: Boolean,
  },
  data() {
    return {}
  },
  watch: {
    visible(value) {
      if (value) {
        document.body.addEventListener('click', this.closeMenu)
      } else {
        document.body.removeEventListener('click', this.closeMenu)
      }
    },
  },
  methods: {
    closeMenu() {
      this.$emit('update:visible', false)
    },
  },
}
</script>
<style lang="scss" scoped>
.contentmenu {
  position: fixed;
  z-index: 99999;
  list-style: none;
  -webkit-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
  padding: 0;
  background: #fff;
  cursor: pointer;
}
</style>
