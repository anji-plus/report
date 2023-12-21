/*
 * @Descripttion: 时间筛选器
 * @Author: qianlishi qianlishi@anji-plus.com
 */
export const widgetFormTime = {
  code: 'widget-form-time',
  type: 'form',
  tabName: '表单',
  label: '时间筛选器',
  icon: 'iconshijianshaixuan',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '时间筛选器',
      },
      {
        type: 'vue-color',
        label: '背景',
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
      },*/
      [{
        name: '组件联动',
        list: [
          {
            type: 'componentLinkage',
            label: '',
            name: 'componentLinkage',
            required: false,
            value: []
          }
        ]
      }]
    ],
    data: [],
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
        value: 40,
      },
    ],
  }
}
