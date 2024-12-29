/*
 * @Descripttion: 百分比图 json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:34:01
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-11 13:15:26
 */
export const widgetPiePercentage = {
  code: 'widgetPiePercentageChart',
  type: 'percent',
  tabName: '百分比',
  label: '百分比图',
  icon: 'iconbaifenbi',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '百分比图',
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
          name: '圆环设置',
          list: [
            {
              type: 'el-slider',
              label: '内半径',
              name: 'innerNumber',
              required: false,
              placeholder: '',
              value: 65,
            },
            {
              type: 'el-slider',
              label: '外半径',
              name: 'outerNumber',
              required: false,
              placeholder: '',
              value: 80,
            },
            {
              type: 'el-input-number',
              label: '刻度数量',
              name: 'lineNumber',
              required: false,
              placeholder: '',
              value: 12
            },
            {
              type: 'el-input-number',
              label: '刻度长度',
              name: 'lineLength',
              required: false,
              placeholder: '',
              value: 20
            },
            {
              type: 'el-input-number',
              label: '刻度宽度',
              name: 'lineWidth',
              required: false,
              placeholder: '',
              value: 2
            },
            {
              type: 'el-input-number',
              label: '圆环刻度距离',
              name: 'lineDistance',
              required: false,
              placeholder: '',
              value: -10
            },
            {
              type: 'vue-color',
              label: '刻度颜色',
              name: 'lineColor',
              required: false,
              placeholder: '',
              value: '#061740'
            },
          ]
        },
        {
          name: '数值设置',
          list: [
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'textNumColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '数值字体',
              name: 'textNumFontSize',
              required: false,
              placeholder: '',
              value: 40
            },
            {
              type: 'el-select',
              label: '数值粗细',
              name: 'textNumFontWeight',
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
              label: '数值风格',
              name: 'textNumFontStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'normal', name: '正常'},
                {code: 'italic', name: 'italic斜体'},
                {code: 'oblique', name: 'oblique斜体'},
              ],
              value: 'normal'
            },
            {
              type: 'el-select',
              label: '数值字体',
              name: 'textNumFontFamily',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'sans-serif', name: 'sans-serif'},
                {code: 'serif', name: 'serif'},
                {code: 'Arial', name: 'Arial'},
                {code: 'Courier New', name: 'Courier New'},
              ],
              value: 'sans-serif'
            },
            {
              type: 'vue-color',
              label: '%号颜色',
              name: 'textPerColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '%号字体',
              name: 'textPerFontSize',
              required: false,
              placeholder: '',
              value: 20
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'textPerFontWeight',
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
              label: '字体风格',
              name: 'textPerFontStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'normal', name: '正常'},
                {code: 'italic', name: 'italic斜体'},
                {code: 'oblique', name: 'oblique斜体'},
              ],
              value: 'normal'
            },
            {
              type: 'el-select',
              label: '字体系列',
              name: 'textPerFontFamily',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'sans-serif', name: 'sans-serif'},
                {code: 'serif', name: 'serif'},
                {code: 'Arial', name: 'Arial'},
                {code: 'Courier New', name: 'Courier New'},
              ],
              value: 'sans-serif'
            },
          ],
        },
        {
          name: '渐变色',
          list: [
            {
              type: 'vue-color',
              label: '0%处颜色',
              name: 'color0Start',
              required: false,
              placeholder: '',
              value: '#4FADFD'
            },
            {
              type: 'vue-color',
              label: '100%颜色',
              name: 'color100End',
              required: false,
              placeholder: '',
              value: '#28E8FA'
            },
            {
              type: 'vue-color',
              label: '余处颜色',
              name: 'colorsurplus',
              required: false,
              placeholder: '',
              value: '#173164'
            },
          ]
        }
      ],
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
          { "num": 60 }
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-piechart',
        dictKey: 'TEXT_PROPERTIES',
        relactiveDomValue: 'dynamicData',
        value: '',
      },
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
