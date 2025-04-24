/*
 * @Descripttion: 超链接文本
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:03:58
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-11 13:16:21
 */
export const widgetButton = {
  code: 'widget-button',
  type: 'text',
  tabName: '文本栏',
  label: '按钮',
  icon: 'iconanniu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '按钮',
      },
      {
        type: 'el-input-text',
        label: '按钮文本',
        name: 'text',
        required: false,
        placeholder: '',
        value: '按钮',
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'backgroundColor',
        required: false,
        placeholder: '',
        value: '#0000FF',
      },
      {
        type: 'el-input-number',
        label: '字体字号',
        name: 'fontSize',
        required: false,
        placeholder: '',
        value: '26',
      },
      {
        type: 'vue-color',
        label: '字体颜色',
        name: 'color',
        required: false,
        placeholder: '',
        value: '#FAD400',
      },
      {
        type: 'el-input-number',
        label: '字体间距',
        name: 'letterSpacing',
        required: false,
        placeholder: '',
        value: '0',
      },
      {
        type: 'vue-color',
        label: '字体背景',
        name: 'background',
        required: false,
        placeholder: '',
        value: 'rgba(115,170,229,.5)',
      },
      {
        type: 'el-select',
        label: '文字粗细',
        name: 'fontWeight',
        required: false,
        placeholder: '',
        selectOptions: [
          { code: 'normal', name: '正常' },
          { code: 'bold', name: '粗体' },
          { code: 'bolder', name: '特粗体' },
          { code: 'lighter', name: '细体' }
        ],
        value: 'normal'
      },
      {
        type: 'el-select',
        label: '对齐方式',
        name: 'textAlign',
        required: false,
        placeholder: '',
        selectOptions: [
          { code: 'center', name: '居中' },
          { code: 'left', name: '左对齐' },
          { code: 'right', name: '右对齐' },
        ],
        value: 'center'
      },
      {
        type: 'el-select',
        label: '是否圆角边框',
        name: 'isBorderRadius',
        required: false,
        placeholder: '',
        selectOptions: [
          { code: 'true',  name: '是' },
          { code: 'false', name: '否' },
        ],
        value: 'false',
      },
      {
        type: 'el-input-number',
        label: '圆角边框设置',
        name: 'borderRadius',
        required: false,
        placeholder: '单位px',
        value: '10',
      },
     [
       {
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
       }
     ]
    ],
    // 数据
    data: [
      {
        type: 'el-radio-group',
        label: '数据类型',
        name: 'dataType',
        require: false,
        placeholder: '',
        selectValue: true,
        selectOptions: [
          {
            code: 'staticData',
            name: '静态数据',
          },
          {
            code: 'dynamicData',
            name: '动态数据',
          },
        ],
        value: 'staticData',
      },
      {
        type: 'el-input-number',
        label: '刷新时间(毫秒)',
        name: 'refreshTime',
        relactiveDom: 'dataType',
        relactiveDomValue: 'dynamicData',
        value: 30000
      },
      {
        type: 'el-button',
        label: '静态数据',
        name: 'staticData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        relactiveDomValue: 'staticData',
        value: [
          { paramKey: 'key1', paramValue: 'value1'},
          { paramKey: 'key2', paramValue: 'value2'},
          { paramKey: 'key3', paramValue: 'value3'}
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        relactiveDomValue: 'dynamicData',
        chartType: 'widget-button',
        dictKey: 'TEXT_PROPERTIES',
        value: '',
      }
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
