/**
 * author:wenqindong
 * date:2023-05-31
 */
let selectOptions = []
for(let i=1;i<13;i++){
    selectOptions.push({code: 'dv-decoration-'+i, name: '装饰'+i})
}
export const widgetDecoration =  {
    code: 'widget-decoration',
    type: 'border',
    tabName: '样式组件',
    label: '装饰',
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
          value: '装饰',
        },
        {
          type: 'el-select',
          label: '样式',
          name: 'showtype',
          required: false,
          placeholder: '',
          selectOptions: selectOptions,
          value: 'dv-decoration-1'
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
          value: 150,
        },
      ],
    }
  }
