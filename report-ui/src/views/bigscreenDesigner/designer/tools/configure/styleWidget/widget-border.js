/**
 * author:wenqindong
 * date:2023-05-31
 */
let selectOptions = []
for(let i=1;i<14;i++){
    selectOptions.push({code: 'dv-border-Box-'+i, name: '样式'+i})
}
export const widgetBorder =  {
    code: 'widget-border',
    type: 'border',
    tabName: '样式组件',
    label: '边框',
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
          value: '边框',
        },
        {
          type: 'el-select',
          label: '样式',
          name: 'showtype',
          required: false,
          placeholder: '',
          selectOptions: selectOptions,
          value: 'dv-border-Box-1'
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
