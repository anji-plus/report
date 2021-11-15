/*
 * @Descripttion: 装饰饼图
 * @version:
 * @Author: foming
 * @Date:
 * @LastEditors:
 * @LastEditTime:
 */
export const widgetDecoratePie = {
  code: 'widgetDecoratePieChart',
  type: 'chart',
  label: '装饰饼图',
  icon: 'iconicon_tubiao_bingtu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '装饰饼图',
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'background',
        required: false,
        placeholder: '',
        value: ''
      },
      [
        {
          name: '最外环设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isLastRingShow',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'vue-color',
              label: '0%颜色',
              name: 'lastRing0Color',
              required: false,
              placeholder: '',
              value: '#4FADFD'
            },
            {
              type: 'vue-color',
              label: '100%颜色',
              name: 'lastRing100Color',
              required: false,
              placeholder: '',
              value: '#28E8FA'
            },
          ]
        },
        {
          name: '八分环设置',
          list: [
            {
              type: 'vue-color',
              label: '颜色',
              name: 'eightColor',
              required: false,
              placeholder: '',
              value: '#4FADFD'
            },
          ]
        },
        {
          name: '虚线环设置',
          list: [
            {
              type: 'el-input-number',
              label: '虚线数量',
              name: 'dottedNum',
              required: false,
              placeholder: '',
              value: 40
            },
            {
              type: 'vue-color',
              label: '颜色',
              name: 'dottedColor',
              required: false,
              placeholder: '',
              value: '#28E8FA'
            },
          ]
        },
        {
          name: '三分环设置',
          list: [
            {
              type: 'vue-color',
              label: '一段颜色',
              name: 'three1Color',
              required: false,
              placeholder: '',
              value: '#fc8d89'
            },
            {
              type: 'vue-color',
              label: '二段颜色',
              name: 'three2Color',
              required: false,
              placeholder: '',
              value: '#46d3f3'
            },
            {
              type: 'vue-color',
              label: '三段颜色',
              name: 'three3Color',
              required: false,
              placeholder: '',
              value: 'rgba(203,203,203,.2)'
            },
          ]
        },
      ],
    ],
    // 坐标
    position: [
      {
        type: 'el-input-number',
        label: '左边距',
        name: 'left',
        required: false,
        placeholder: '',
        value: 0,
      },
      {
        type: 'el-input-number',
        label: '上边距',
        name: 'top',
        required: false,
        placeholder: '',
        value: 0,
      },
      {
        type: 'el-input-number',
        label: '宽度',
        name: 'width',
        required: false,
        placeholder: '该容器在1920px大屏中的宽度',
        value: 400,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 300,
      },
    ],
  }
}
