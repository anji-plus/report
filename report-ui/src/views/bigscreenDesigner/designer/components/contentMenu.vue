<!--
 * @Descripttion: 组件右键菜单
 * @Author: qianlishi
 * @Date: 2021-6-25 14:48:27
 * @LastEditors: qianlishi
 * @LastEditTime: 2023-3-6 17:38:44
-->
<template>
  <div v-show="visible" class="contentmenu" :style="styleObj">
    <div class="contentmenu__item" @click="deleteLayer">
      <i class="iconfont iconguanbi"></i> 删除图层
    </div>
    <div class="contentmenu__item" @click="lockLayer" name="singleSelect">
      <i class="iconfont iconfuzhi1"></i> 锁定图层
    </div>
    <div class="contentmenu__item" @click="noLockLayer" name="singleSelect">
      <i class="iconfont iconfuzhi1"></i> 解除锁定
    </div>
    <div class="contentmenu__item" @click="copyLayer">
      <i class="iconfont iconfuzhi1"></i> 复制图层
    </div>
    <div class="contentmenu__item" @click="istopLayer" name="singleSelect">
      <i class="iconfont iconjinlingyingcaiwangtubiao01"></i> 置顶图层
    </div>
    <div class="contentmenu__item" @click="setlowLayer" name="singleSelect">
      <i class="iconfont iconleft-copy"></i> 置底图层
    </div>
    <div class="contentmenu__item" @click="moveupLayer" name="singleSelect">
      <i class="iconfont iconjinlingyingcaiwangtubiao01"></i> 上移一层
    </div>
    <div class="contentmenu__item" @click="movedownLayer" name="singleSelect">
      <i class="iconfont iconleft-copy"></i> 下移一层
    </div>
    <div class="contentmenu__item" @click="alignment('left')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 左对齐
    </div>
    <div class="contentmenu__item" @click="alignment('right')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 右对齐
    </div>
    <div class="contentmenu__item" @click="alignment('horizontal_center')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 左右居中对齐
    </div>
    <div class="contentmenu__item" @click="alignment('top')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 上对齐
    </div>
    <div class="contentmenu__item" @click="alignment('bottom')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 下对齐
    </div>
    <div class="contentmenu__item" @click="alignment('vertical_center')" name="mulSelect">
      <i class="iconfont iconzhankai"></i> 上下居中对齐
    </div>
  </div>
</template>
<script>
export default {
  props: {
    styleObj: Object,
    visible: Boolean,
  },
  data() {
    return {};
  },
  watch: {
    visible(value) {
      if (value) {
        document.body.addEventListener("click", this.closeMenu);
      } else {
        document.body.removeEventListener("click", this.closeMenu);
      }
    },
  },
  methods: {
    closeMenu() {
      this.$emit("update:visible", false);
    },
    deleteLayer() {
      this.$confirm("是否删除所选图层?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$emit("deletelayer");
          this.$message({
            type: "success",
            message: "删除成功!",
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
    lockLayer() {
      this.$emit("lockLayer");
    },
    noLockLayer() {
      this.$emit("noLockLayer");
    },
    copyLayer() {
      this.$emit("copylayer");
    },
    istopLayer() {
      this.$emit("istopLayer");
    },
    setlowLayer() {
      this.$emit("setlowLayer");
    },
    moveupLayer() {
      this.$emit("moveupLayer");
    },
    movedownLayer() {
      this.$emit("movedownLayer");
    },
    alignment(align){
      this.$emit("alignment",align);
    }
  },
};
</script>
<style lang="scss">
.contentmenu {
  width: 160px;
  position: fixed;
  z-index: 99999;
  list-style: none;
  -webkit-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  padding: 0;
  background: #27343e;
  color: #bcc9d4;
  .contentmenu__item {
    z-index: 10000;
    list-style: none;
    padding: 8px 12px;
    cursor: pointer;
    position: relative;
    font-size: 12px;
  }
  .iconfont {
    font-size: 12px;
  }
}
</style>
