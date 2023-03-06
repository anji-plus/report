/*
 * @Author: chengsl
 * @Date: 2022-11-08 10:30:37
 * @LastEditors: chengsl
 * @LastEditTime: 2023-02-24 09:54:34
 * @Description: 设计器公用变量
 */

const designer = {
  state: {
    allComponentLinkage: [], // 所有组件之间的联动配置
  },

  mutations: {
    SET_ALL_COMPONENT_LINKAGE: (state, params) => {
      var { index = -1, widgetId = '', linkageArr } = params
      try {
        console.log('params---', params)
        linkageArr = linkageArr.map(item => {
          const arr = item.widgetValue.split('-$-')
          return {
            originId: widgetId,
            targetId: arr[0],
            targetName: arr[1],
            paramsConfig: item.paramsConfig
          }
        })
      } catch (error) {
        linkageArr = [] // 兼容异常错误导致页面加载不出来
      }
      state.allComponentLinkage[index] = {
        index: +index,
        widgetId,
        linkageArr
      }
    }
  },

  actions: {}
}

export default designer
