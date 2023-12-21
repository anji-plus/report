/*
 * @Descripttion: 下拉框
 * @Author: qianlishi qianlishi@anji-plus.com
 * @Date: 2023-01-09 13:02:59
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-03-24 10:27:23
 */

export const widgetSelect = {
  code: 'widget-select',
  type: 'form',
  tabName: '表单',
  label: '下拉框',
  icon: 'iconxialakuang1',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '下拉框',
      },
      {
        type: 'el-input-text',
        label: '提示内容',
        name: 'select_text',
        require: false,
        placeholder: '',
        value: '请选择'
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
        value: 600000
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
          { "label": "苹果", "value": 1000 },
          { "label": "三星", "value": 2229 },
          { "label": "小米", "value": 3879 },
          { "label": "oppo", "value": 2379 },
          { "label": "vivo", "value": 4079 },
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
        chartType: 'widget-select',
        dictKey: 'SELECT_PROPERTIES',
        value: '',
      },
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
        value: 200,
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
