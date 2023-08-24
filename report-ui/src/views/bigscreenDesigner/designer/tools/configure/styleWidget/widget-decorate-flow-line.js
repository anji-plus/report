/**
 * author:chenxg
 * date:2023-08-24
 */
export const widgetDecorateFlowLine =  {
    code: 'widget-decorate-flow-line',
    type: 'border',
    tabName: '样式组件',
    label: '流光直线',
    icon: 'icontupian1',
    options: {
      // 配置
      setup: [
        {
          type: 'el-input-text',
          label: '图层名称',
          name: 'layerName',
          required: false,
          placeholder: '',
          value: '流光直线',
        },
        {
          type: 'vue-color',
          label: '背景颜色',
          name: 'background',
          required: false,
          placeholder: '',
          value: ''
        },
        {
          type: 'el-select',
          label: '流动方向',
          name: 'flowDirection',
          required: false,
          placeholder: '',
          selectOptions: [
            { code: 'left', name: '自左向右' },
            { code: 'right', name: '自右向左' },
          ],
          value: 'left'
        },
      ],
      // 数据
      data: [],
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
