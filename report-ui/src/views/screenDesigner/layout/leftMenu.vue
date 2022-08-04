<!--
 * @Descripttion: 大屏左侧工具栏
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-05-12 11:05:21
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-06-17 17:26:22
-->
<template>
  <el-tabs class="layout-left" type="border-card">
    <el-tab-pane>
      <span slot="label"><i class="el-icon-date icon"></i>工具栏</span>
      <div class="chart-type">
        <el-tabs class="type-left" tab-position="left">
          <el-tab-pane
            v-for="(item, index) in widgetTools"
            :key="index"
            :label="item.name"
          >
            <draggable
              v-for="(it, idx) in item.list"
              :key="idx"
              @end="evt => widgetOnDragged(evt, it.code)"
            >
              <div class="tools-item" v-if="it.code != 'screen'">
                <span class="tools-item-icon">
                  <i class="iconfont" :class="it.icon"></i>
                </span>
                <span class="tools-item-text">{{ it.label }}</span>
              </div>
            </draggable>
          </el-tab-pane>
        </el-tabs>
      </div>
    </el-tab-pane>
    <el-tab-pane>
      <span slot="label" class="icon"
        ><i class="el-icon-date icon"></i>图层</span
      >
      <div
        v-for="(item, index) in layerWidget"
        :key="'item' + index"
        class="tools-item"
        :class="widgetIndex == index ? 'is-active' : ''"
        @click="layerClick(index)"
      >
        <span class="tools-item-icon">
          <i class="iconfont" :class="item.icon"></i>
        </span>
        <span class="tools-item-text">{{ item.label }}</span>
      </div>
    </el-tab-pane>
  </el-tabs>
</template>
<script>
import draggable from "vuedraggable";
export default {
  components: {
    draggable
  },
  props: {
    widgetIndex: Number,
    widgetTools: Array,
    layerWidget: Array
  },
  methods: {
    widgetOnDragged(evt, code) {
      this.$emit("widgetOnDragged", evt, code);
    },
    layerClick(index) {
      this.$emit("layerClick", index);
    }
  }
};
</script>
<style lang="scss" scoped>
/deep/.el-dropdown-menu__item {
  max-width: none;
}
.layout-left {
  width: 200px;
  background: #242a30;
  overflow-x: hidden;
  overflow-y: auto;
  .chart-type {
    display: flex;
    flex-direction: row;
    overflow: hidden;
    .type-left {
      width: 100%;
      height: calc(100vh - 80px);
      text-align: center;
      /deep/.el-tabs__header {
        width: 30%;
        margin-right: 0;
        .el-tabs__nav-wrap {
          &::after {
            background: transparent;
          }
          .el-tabs__item {
            text-align: center;
            width: 100% !important;
            color: #fff;
            padding: 0;
          }
        }
      }
      /deep/.el-tabs__content {
        width: 70%;
      }
    }
  }
  //工具栏一个元素
  .tools-item {
    display: flex;
    position: relative;
    width: 100%;
    height: 48px;
    align-items: center;
    -webkit-box-align: center;
    padding: 0 6px;
    cursor: pointer;
    font-size: 12px;
    margin-bottom: 1px;

    .tools-item-icon {
      color: #409eff;
      margin-right: 10px;
      width: 53px;
      height: 30px;
      line-height: 30px;
      text-align: center;
      display: block;
      border: 1px solid #3a4659;
      background: #282a30;
    }
    .tools-item-text {
    }
  }
  /deep/.el-tabs__content {
    padding: 0;
  }
}
</style>
