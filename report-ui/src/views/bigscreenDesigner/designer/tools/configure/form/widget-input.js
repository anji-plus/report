export const widgetInput = {
  code: 'widget-input',
  type: 'form',
  tabName: '表单',
  label: '输入框',
  icon: 'icondanhangshurukuang',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '输入框',
      },
      {
        type: 'vue-color',
        label: '字体颜色',
        name: 'select_color',
        required: false,
        placeholder: '',
        value: '#FAD400',
      },
      {
        type: 'vue-color',
        label: '字体背景',
        name: 'select_background',
        required: false,
        placeholder: '',
        value: 'rgba(115,170,229,.5)',
      },
/*      {
        type: 'el-select',
        label: '触发事件',
        name: 'event',
        required: false,
        placeholder: '',
        selectOptions: [
          { code: 'change', name: 'change' },
          { code: 'blur', name: 'blur' },
          { code: 'focus', name: 'focus' },
        ],
        value: 'change',
      }*/
    ],
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
        value: 100,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 40,
      },
    ],
  }
}
