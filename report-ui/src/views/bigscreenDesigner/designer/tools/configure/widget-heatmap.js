/*
 * @Descripttion: 热力图
 * @version:
 * @Author: whw
 * @Date: 2021-11-3
 * @LastEditors: whw
 * @LastEditTime: 2021-11-3
 */
export const widgetHeatmap = {
  code: 'widget-heatmap',
  type: 'chart',
  label: '热力图',
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
        value: '热力图',
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
          name: '标题设置',
          list: [
            {
              type: 'el-switch',
              label: '标题',
              name: 'isNoTitle',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-text',
              label: '标题',
              name: 'titleText',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'textColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'textFontWeight',
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
              type: 'el-input-number',
              label: '字体大小',
              name: 'textFontSize',
              required: false,
              placeholder: '',
              value: 16
            },
            {
              type: 'el-select',
              label: '字体位置',
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
              type: 'el-input-text',
              label: '副标题',
              name: 'subText',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'subTextColor',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'subTextFontWeight',
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
              type: 'el-input-number',
              label: '字体大小',
              name: 'subTextFontSize',
              required: false,
              placeholder: '',
              value: 16
            },
          ],
        },
        {
          name: 'X轴设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'hideX',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: 'X轴别名',
              name: 'xName',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '别名颜色',
              name: 'xNameColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '别名字号',
              name: 'xNameFontSize',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'el-switch',
              label: '轴反转',
              name: 'reversalX',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-slider',
              label: '文字角度',
              name: 'textAngleX',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-input-number',
              label: '文字间隔',
              name: 'textInterval',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'Xcolor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '文字字号',
              name: 'fontSizeX',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'vue-color',
              label: '轴颜色',
              name: 'lineColorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
          ],
        },
        {
          name: 'Y轴设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowY',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: 'Y轴别名',
              name: 'textNameY',
              require: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '别名颜色',
              name: 'NameColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '别名字号',
              name: 'NameFontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-switch',
              label: '轴反转',
              name: 'reversalY',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-slider',
              label: '文字角度',
              name: 'textAngleY',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'colorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '文字字号',
              name: 'fontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'vue-color',
              label: '轴颜色',
              name: 'lineColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
          ],
        },
        {
          name: '图例操作',
          list: [
            {
              type: 'el-switch',
              label: '图例',
              name: 'isShowLegend',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-number',
              label: '最小值',
              name: 'dataMin',
              required: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-input-number',
              label: '最大值',
              name: 'dataMax',
              required: false,
              placeholder: '',
              value: 5000,
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'lengedColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '字体大小',
              name: 'lengedFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
          ],
        },
        {
          name: '数值设定',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShow',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSize',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'subTextColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'fontWeight',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
              ],
              value: 'normal'
            },
          ],
        },
        {
          name: '提示语设置',
          list: [
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'tipsFontSize',
              required: false,
              placeholder: '',
              value: 16
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'tipsLineColor',
              required: false,
              placeholder: '',
            },
          ],
        },
        {
          name: '坐标轴边距设置',
          list: [
            {
              type: 'el-slider',
              label: '左边距(像素)',
              name: 'marginLeft',
              required: false,
              placeholder: '',
              value: 10,
            }, {
              type: 'el-slider',
              label: '顶边距(像素)',
              name: 'marginTop',
              required: false,
              placeholder: '',
              value: 50,
            }, {
              type: 'el-slider',
              label: '右边距(像素)',
              name: 'marginRight',
              required: false,
              placeholder: '',
              value: 40,
            }, {
              type: 'el-slider',
              label: '底边距(像素)',
              name: 'marginBottom',
              required: false,
              placeholder: '',
              value: 10,
            },
          ],
        },
        {
          name: '自定义配色',
          list: [
            {
              type: 'customColor',
              label: '',
              name: 'lengedColorList',
              required: false,
              value: [{ color: '#abd9e9' }, { color: '#74add1' }, { color: '#4575b4' }, { color: '#313695' }],
            },
          ],
        },
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
        value: 5000
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
          [0, 0, 3320],
          [0, 1, 1561],
          [0, 2, 3194],
          [0, 3, 2899],
          [0, 4, 2363],
          [0, 5, 3945],
          [0, 6, 2051],
          [0, 7, 3657],
          [0, 8, 3304],
          [0, 9, 2990],
          [1, 9, 2663],
          [1, 0, 378],
          [1, 1, 4076],
          [1, 2, 3178],
          [1, 3, 1501],
          [1, 4, 1660],
          [1, 5, 726],
          [1, 6, 4148],
          [1, 7, 720],
          [1, 8, 430],
          [2, 9, 2983],
          [2, 0, 1917],
          [2, 1, 1188],
          [2, 2, 3581],
          [2, 3, 1781],
          [2, 4, 4725],
          [2, 5, 4077],
          [2, 6, 299],
          [2, 7, 4828],
          [2, 8, 1778],
          [3, 9, 3171],
          [3, 0, 2944],
          [3, 1, 763],
          [3, 2, 1678],
          [3, 3, 1765],
          [3, 4, 2949],
          [3, 5, 966],
          [3, 6, 4622],
          [3, 7, 2818],
          [3, 8, 3913],
          [4, 9, 4382],
          [4, 0, 1670],
          [4, 1, 4532],
          [4, 2, 2116],
          [4, 3, 2383],
          [4, 4, 510],
          [4, 5, 33],
          [4, 6, 4974],
          [4, 7, 3627],
          [4, 8, 2737],
          [5, 9, 656],
          [5, 0, 3689],
          [5, 1, 713],
          [5, 2, 3551],
          [5, 3, 3159],
          [5, 4, 4150],
          [5, 5, 1416],
          [5, 6, 3021],
          [5, 7, 1778],
          [5, 8, 863],
          [6, 9, 772],
          [6, 0, 1675],
          [6, 1, 1323],
          [6, 2, 2023],
          [6, 3, 43],
          [6, 4, 4964],
          [6, 5, 4781],
          [6, 6, 2608],
          [6, 7, 2278],
          [6, 8, 3285],
          [7, 9, 1977],
          [7, 0, 882],
          [7, 1, 2434],
          [7, 2, 4694],
          [7, 3, 3022],
          [7, 4, 1798],
          [7, 5, 2503],
          [7, 6, 693],
          [7, 7, 275],
          [7, 8, 3774],
          [8, 9, 1386],
          [8, 0, 1212],
          [8, 1, 1982],
          [8, 2, 1509],
          [8, 3, 94],
          [8, 4, 2082],
          [8, 5, 3930],
          [8, 6, 4528],
          [8, 7, 1861],
          [8, 8, 4582],
          [9, 9, 3038],
          [9, 0, 4038],
          [9, 1, 357],
          [9, 2, 306],
          [9, 3, 479],
          [9, 4, 823],
          [9, 5, 3442],
          [9, 6, 904],
          [9, 7, 399],
          [9, 8, 4869]
        ]
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-heatmap',
        relactiveDomValue: 'dynamicData',
        dictKey: 'PIE_PROPERTIES',
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
        value: 700,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 250,
      },
    ],
  }
}
