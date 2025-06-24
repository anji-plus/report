/*
 * @Descripttion: 日历组件json
 * @version:
 * @Author: lishuaiwu
 * @Date: 2025-06-05 13:44:32
 */
export const widgetCalendar = {
  code: 'widget-calendar',
  type: 'text',
  tabName: '文本栏',
  label: '日历',
  icon: 'iconbiaoge',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '日历',
      },
      [
        {
          name: '日历样式',
          list: [
            {
              type: 'vue-color',
              label: '边框线颜色',
              name: 'borderColor',
              required: false,
              placeholder: '',
              value: 'rgb(221, 221, 221)'
            },
            {
              type: 'vue-color',
              label: '头部背景颜色',
              name: 'headerBackground',
              required: false,
              placeholder: '',
              value: 'rgb(10, 115, 255)'
            },
            {
              type: 'vue-color',
              label: '头部文字颜色',
              name: 'headerTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(255, 255, 255)'
            },
            {
              type: 'vue-color',
              label: '头部按钮颜色',
              name: 'headerBtnBackground',
              required: false,
              placeholder: '',
              value: 'rgb(10, 115, 255)'
            },
            {
              type: 'vue-color',
              label: '头部按钮文字',
              name: 'headerBtnTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(255, 255, 255)'
            },
            {
              type: 'vue-color',
              label: '星期背景色',
              name: 'weekBackground',
              required: false,
              placeholder: '',
              value: 'rgb(10, 39, 50)'
            },
            {
              type: 'vue-color',
              label: '星期文字颜色',
              name: 'weekTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(255, 255, 255)'
            },
            {
              type: 'vue-color',
              label: '日期背景色',
              name: 'dayBackground',
              required: false,
              placeholder: '',
              value: 'rgb(0, 59, 81)'
            },
            {
              type: 'vue-color',
              label: '日期文字颜色',
              name: 'dayTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(255, 255, 255)'
            },
            {
              type: 'vue-color',
              label: '当日背景色',
              name: 'todayBackground',
              required: false,
              placeholder: '',
              value: 'rgba(0, 59, 81, .5)'
            },
            {
              type: 'vue-color',
              label: '当日文字颜色',
              name: 'todayTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(0, 0, 0)'
            },{
              type: 'vue-color',
              label: '选中背景色',
              name: 'selectedBackground',
              required: false,
              placeholder: '',
              value: 'rgb(11, 180, 241)'
            },
            {
              type: 'vue-color',
              label: '选中文字颜色',
              name: 'selectedTextColor',
              required: false,
              placeholder: '',
              value: 'rgb(0, 0, 0)'
            },
            {
              type: 'el-switch',
              label: '按钮显隐',
              name: 'isButton',
              required: false,
              placeholder: '',
              value: true,
            },
          ]
        }
      ],
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
          {
            "date": "2025-06-01",
            "data": '2单'
          },
          {
            "date": "2025-06-02",
            "data": '10单'
          }
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
        chartType: 'widget-calendar',
        dictKey: 'CALENDAR_PROPERTIES',
        value: '',
      }
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
        value: 600,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 400,
      },
    ]
  }
}
