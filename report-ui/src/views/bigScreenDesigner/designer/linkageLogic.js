/*
 * @Author: chengsl
 * @Date: 2023-02-24 09:40:13
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-03-24 14:01:08
 * @Description: 各联动组件的参数配置 参数paramsKey的值具体封装时再改
 */
import { eventBus as bus } from "@/utils/eventBus";
export const lickageParamsConfig = [
  // {
  //   name: '按钮组',
  //   code: 'widgetButtonGroup',
  //   paramsKey: [] // 40@remarks 动态：[...row, index]
  // },
  {
    name: '下拉框',
    code: 'widget-select',
    paramsKey: ['label','value']
  },
  {
    name: '时间筛选器',
    code: 'widget-form-time',
    paramsKey: ['startTime','endTime']
  },
  {
    name: '柱图',
    code: 'widget-barchart',
    paramsKey: ['name', 'value']
  },
  {
    name: '柱图-渐变色',
    code: 'widget-gradient-color-barchart',
    paramsKey: ['name', 'value']
  },
  // ……
  {
    name: '折线图',
    code: 'widget-linechart',
    paramsKey: ['name', 'value']
  },
  {
    name: '百分比图',
    code: 'widgetPiePercentageChart',
    paramsKey: ['value']
  },
  {
    name: '饼图',
    code: 'widget-piechart',
    paramsKey: ['name', 'value']
  },
  {
    name: '南丁格尔玫瑰图',
    code: 'WidgetPieNightingaleRoseArea',
    paramsKey: ['name', 'value']
  },
]

export const getOneConfigByCode = function (code) {
  return lickageParamsConfig.find(item => { return item.code === code })
}

export const getOneConfigByName = function (name) {
  return lickageParamsConfig.find(item => { return item.name === name })
}

/**
 * 源组件 - 初始化联动逻辑
 * @param self 组件实例对象 this
 * @param isActiveClick 主动触发(非echart类click事件触发)
 * @param buttonConfig 按钮组组件的配置
 * 40@remarks
 * 1、v-chart 需添加 ref="myVChart" 以获取实例
 * 2、 发消息发过去的对象 待封装配置动态兼容
 */
export const originWidgetLinkageLogic = function (self, isActiveClick = false, buttonConfig = {}) {
  // if (self.allComponentLinkage && self.allComponentLinkage.length && self.allComponentLinkage[self.widgetIndex].index !== -1 && self.allComponentLinkage[self.widgetIndex].linkageArr.length) {
  if (self.optionsSetup.componentLinkage && self.optionsSetup.componentLinkage.length) {
    if (isActiveClick) { // 主动触发
      self.allComponentLinkage[self.widgetIndex].linkageArr.forEach(item => {
        console.log(item)
        console.log(`bus_${item.originId}_${item.targetId}`, ' -联动逻辑点击-发送消息', buttonConfig)
        bus.$emit(`bus_${item.originId}_${item.targetId}`, buttonConfig.currentData)
      })
    } else { // chart 组件
      self.$refs.myVChart.chart.on('click', function (params) {
        self.allComponentLinkage[self.widgetIndex].linkageArr.forEach(item => {
          console.log(`bus_${item.originId}_${item.targetId}`, ' -联动逻辑点击-发送消息', params)
          console.log(self.value)
          let message = {}
          const widgetConfigTemp = getOneConfigByCode(self.value.widgetCode)
          console.log('widgetConfigTemp', widgetConfigTemp)
          if (widgetConfigTemp && widgetConfigTemp.paramsKey.length) { // 动态加载各组件的参数来封装
            widgetConfigTemp.paramsKey.forEach(key => {
              message[key] = params[key]
            })
            // 40@remarks 部分组件 传参需要特殊处理下
            // ……
            // 40@remarks 专用于测试联动发消息 手动改造消息内容
            // if (self.value.widgetCode === 'widgetMap2d') {
            //   const nameTemp = ['苹果', '三星', '小米', '华为', 'OPPO', 'VIVO']
            //   // message = {
            //   //   name: nameTemp[(params.dataIndex % 6)],
            //   //   value: params.value,
            //   //   dataIndex: params.dataIndex
            //   // }
            //   // message.name = nameTemp[(+params.value % 6)]
            //   message.name = nameTemp[(parseInt(Math.random() * 6) % 6)]
            // }
            // if (self.value.widgetCode === 'widget-piechart') {
            //   message.name = (parseInt(Math.random() * 2) % 2) === 0 ? '深圳市' : '盐田区'
            // }
          } else {
            message = {
              name: params.name,
              value: params.value
            }
          }
          bus.$emit(`bus_${item.originId}_${item.targetId}`, message)
        })
      })
    }
  }
}

/**
 * 目标组件 - 初始化联动逻辑
 * @param self 组件实例对象 this
 * @returns
 */
export const targetWidgetLinkageLogic = function (self) {
  const busEvents = []
  // 有无有关联的组件
  if (!self.allComponentLinkage || !self.allComponentLinkage.length) return
  self.allComponentLinkage.some(item => {
    if (item.index !== -1 && item.linkageArr.length) {
      item.linkageArr.some(obj => {
        if (obj.targetId === self.value.setup.widgetId) {
          self.hasLinkage = true
          busEvents.push({
            eventName: `bus_${obj.originId}_${obj.targetId}`,
            paramsConfig: obj.paramsConfig
          })
          return true
        }
      })
    }
  })
  if (self.hasLinkage) {
    busEvents.forEach(item => {
      bus.$on(item.eventName, e => {
        console.log(item.eventName, ' 接收消息e', e)
        self.setOptionsData(e, item.paramsConfig)
      })
    })
  }
}
