<template>
  <div class="menu-left">
    <div class="menu-nav">
      <n-menu v-model:value="selectValue" class="menu" :options="menuOptions"  />
    </div>
    <div class="menu-sub" :class="[ isActive ? '' : 'active']">
      <div class="title">
        <span>组件列表</span>
        <span class="iconfont icon-guanbi" @click="close"></span>
      </div>
      <div class="menu-sub-box">
        <div class="menu-sub-box-one">
          <n-menu v-model:value="selectValue1" class="menu" :options="menuOptions1"  />
        </div>
        <div class="menu-sub-box-two">
          <n-menu v-model:value="selectValue2" class="menu" :options="menuOptions2"  />
        </div>
     
        <div class="menu-sub-box-imgs">
          <div class="input">
            <n-input type="text" size="small" placeholder="搜索组件" />
          </div>
          <n-scrollbar>
            <div class="item" v-for="item in 10">
              <div class="item-title">柱状图</div>
              <div class="item-box">
                <img src="@/assets/echImgs/bar_line.png" class="item-box-img" alt="">
              </div>
            </div>
          </n-scrollbar>
        </div>
      </div>

    </div>
  </div>
</template>
<script lang='ts' setup>
import { reactive, ref } from 'vue'
import { renderFontClassIcon } from '@/utils';
const menuOptions = reactive([
  {
    label: '组件库',
    key: 'pinball-1973',
    icon: renderFontClassIcon('icon-zujianku')
  },
  {
    label: '图层',
    key: 'pinball-1974',
    icon: renderFontClassIcon('icon-tuceng')
  },
  {
    label: '历史记录',
    key: 'pinball-1975',
    icon: renderFontClassIcon('icon-lishijilu')
  }
])
const menuOptions1 = [
  {
    label: '所有',
    icon: renderFontClassIcon('icon-zujianku'),
    key: '1'
  },
  {
    label: '图表',
    icon: renderFontClassIcon('icon-zujianku'),
    key: '2'
  }
]
const menuOptions2 = [
  {
    label: '全部',
    key: '1'
  },
  {
    label: '柱状图',
    key: '2'
  },
]
const selectValue = ref<string>(menuOptions[0].key)
const selectValue1 = ref('1')
const selectValue2 = ref('1')
const isActive = ref(true)
const close = () => {
  isActive.value = false
}
</script>
<style lang='less' scoped>
.menu-left {
  height: calc(100vh - 60px);
  display: flex;
  .menu-nav {
    width: 70px;
    height: 100%;
    background: #fafafa;
    // background: red;
    ::v-deep .menu  {
      .n-menu-item {
        height: auto !important;
        &.n-menu-item--selected {
          &::after {
            content: '';
            position: absolute;
            left: 2px;
            top: 0;
            height: 100%;
            width: 3px;
            border-top-right-radius: 3px;
            border-bottom-right-radius: 3px;
          }
        }
        .n-menu-item-content {
          // &.n-menu-item-content:not(.n-menu-item-content--disabled):hover {
          //    background: none;
          // }
          display: flex;
          flex-direction: column;
          padding: 6px 12px !important;
          font-size: 14px !important;
        }
        .n-menu-item-content__icon {
          font-size: 18px !important;
          margin-right: 0 !important;
        }
      }
    }
  }
  .menu-sub {
    overflow: hidden;
    &.active {
      width: 0;
    }
    .title {
      width: 100%;
      line-height: 50px;
      border-bottom: 2px solid #fafafa;
      padding:0 20px;
      display: flex;
      justify-content: space-between;
    }
    ::v-deep .menu-sub-box {
      display: flex;
      height: 100%;
      transition: all 1s;
      &-one {
        width: 60px;
        height: 30px;
        .n-menu-item-content {
          display: flex;
          flex-direction: column;
          padding: 0 !important;
          font-size: 12px !important;
          box-sizing: border-box;
          &.n-menu-item-content__icon{
            margin-right: 0!important;
          }
          &.n-menu-item-content:not(.n-menu-item-content--disabled):hover::before {
             background: none;
          }
          &.n-menu-item-content.n-menu-item-content--selected::before {
            background: none;
          }
        }
        .n-menu-item-content__icon {
          margin-right: 0px !important;
        }
      }
      &-two {
        width: 70px;
        background: #fafafa;
        .menu  {
          .n-menu-item {
            height: 30px;
            .n-menu-item-content {
              display: grid;
              text-align: center;
              padding: 6px 12px !important;
              font-size: 12px !important;
            }
          }
        }
      }
      &-imgs {
        width: 160px;
        .input {
          margin: 4px;
        }
        .item {
          margin-top: 6px;
          &-title {
            font-size: 12px;
            color: #999;
            padding: 4px;
            background: #e5e6eb;
            border-radius: 5px 5px 0 0;
          }
          &-box {
            background: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 6px 0;
            overflow: hidden;
            &-img {
              max-width: 140px;
              height: 100px;
              border-radius: 5px;
              object-fit: contain;
              &:hover {
                transform: scale(1.1);
                transition: all 0.5s;
              }
            }
          }
        }
      }
    }
  }
}
</style>
