<!--
 * @Author: qianlishi 1432731663@qq.com
 * @Date: 2025-01-16 13:26:37
 * @LastEditors: qianlishi 1432731663@qq.com
 * @LastEditTime: 2025-01-16 15:02:38
 * @FilePath: \Report-V3-TS\src\views\designScreen\readMe.md
-->
## 数据结构
{
  screenConfig: {
    id: string, // 唯一id navoid 生成
    width: number, // 大屏宽度
    height: number, // 大屏高度
    background: string; // 背景颜色
    backgroundImage: string; // 背景图片
    // 大屏展示规则：fit：自适应比例左右会空白，scrollX：x铺满，Y自适应 scrollY：Y轴铺满，x轴自适应 full 强行拉伸X,Y轴，全部铺满
    previewScaleType: 'fit' | 'scrollY' | 'scrollX' | 'full', // 大屏展示的规则
    ... // 其他需要添加的配置项
    componentList: [  // 组件的配置
      {
        id: string;  // 组件唯一 id navoid 生成
        isGoup: boolean; // 分组
        attrs: {
          width: number;
          height: number;
          offsetX: number;
          offsetY: number;
          zIndex: number;
        }, // 
        styles: {},  // 组件的样式 
        componentConfig: {}, // 组件的配置项
        option: {}, // 组件的配置项
        status: {    // 组件状态 锁定、隐藏
          lock: boolean;
          hide: boolean;
        }, 
        request: {}, // 数据来源
        event: {}, // 事件
      }
    ]
  }
}

## 文件目录
### 大屏设计器所有的文件都在views/designScreen下面
├── designScreen
│ ├── api 请求接口文件
│ ├── assets 静态资源
│ │ ├── images 图片资源
│ │ ├── styles css资源
│ ├── components 公共组件目录
│ ├── packages 图标组件
│ │ ├── Charts组件每个个类型
│ │ │ ├── Bars  柱状图组
│ │ │ │ ├── Bar  柱状图
│ │ │ │ │ ├── index.vue  柱状图结构
│ │ │ │ │ ├── index.ts   柱状图入口 主要是组件的一些配置并导出出去
│ │ │ │ │ ├── config.vue 组件右侧独特的配置
│ │ │ ├── Lines 线型图组
│ │ │ ├── Maps  地图组
│ │ │ ├── ...
│ │ ├── index.ts 图标组件入口
│ ├── Layout 设计器布局
│ ├── components 设计器组件
│ │ ├── top.vue 设计区头部
│ │ ├── leftNav.vue 左侧导航栏
│ │ ├── content.vue 中间
│ │ ├── rightConfig.vue 右侧配置项
│ ├── index 入口 
│ ├── screenStore 设计器全局状态配置
│ ├── util 公共 js
