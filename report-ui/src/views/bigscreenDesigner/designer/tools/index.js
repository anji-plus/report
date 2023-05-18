/*
 * @Descripttion: 主文件
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 06:43:07
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-03-06 16:00:09
 */
import { widgetTool } from "./main"
const screenConfig = {
  code: 'screen',
  type: 'screen',
  label: '大屏设置',
  icon: '',
  options: {
    setup: [
      {
        type: 'el-input-number',
        label: '大屏宽度',
        name: 'width',
        required: false,
        placeholder: 'px',
        value: '1920',
      },
      {
        type: 'el-input-number',
        label: '大屏高度',
        name: 'height',
        required: false,
        placeholder: 'px',
        value: '1080',
      },
      {
        type: 'el-input-text',
        label: '标题',
        name: 'title',
        require: false,
        placeholder: '',
        value: '大屏',
      },
      {
        type: 'el-input-textarea',
        label: '大屏简介',
        name: 'description',
        required: false,
        placeholder: '',
        value: ''
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'backgroundColor',
        required: false,
        placeholder: '',
        value: '#1E1E1E',
      },
      {
        type: 'custom-upload',
        label: '图片地址',
        name: 'backgroundImage',
        required: false,
        placeholder: '',
        value: '',
      },
    ],
    data: [],
    position: [],
  }
}

export const converArr = (data) => {
  let tempArr = [], newArr = []
  for (let i = 0; i < data.length; i++) {
    const item = data[i]
    item.widgetId = ''
    if (tempArr.indexOf(item.type) === -1) {
      newArr.push({
        name: item.tabName,
        type: item.type,
        list: [item]
      })
      tempArr.push(item.type);
    } else {
      for (let j = 0; j < newArr.length; j++) {
        if (newArr[j].type == item.type) {
          newArr[j].list.push(item)
        }
      }
    }
  }
  return newArr
}

const widgetTools = converArr([...widgetTool])

const getToolByCode = function (code) {
  // 获取大屏底层设置属性
  if (code == 'screen') {
    return screenConfig
  }
  // 获取组件
  return [...widgetTool].find((item) => {
    return item.code == code
  })
}
export { widgetTools, getToolByCode }
