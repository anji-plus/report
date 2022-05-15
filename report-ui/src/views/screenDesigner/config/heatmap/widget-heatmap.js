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
  type: 'heatmap',
  tabName: '热力图',
  label: '热力图',
  icon: 'iconrelitu',
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
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
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
                {code: 'center', name: '居中'},
                {code: 'left', name: '左对齐'},
                {code: 'right', name: '右对齐'},
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
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
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
          name: '图设置',
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
              label: '数值颜色',
              name: 'lengedColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '图例大小',
              name: 'lengedFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'el-input-number',
              label: '图例宽度',
              name: 'lengedWidth',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'el-select',
              label: '横向位置',
              name: 'lateralPosition',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'center', name: '居中'},
                {code: 'left', name: '左对齐'},
                {code: 'right', name: '右对齐'},
              ],
              value: 'center'
            },
            {
              type: 'el-select',
              label: '纵向位置',
              name: 'longitudinalPosition',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'top', name: '顶部'},
                {code: 'bottom', name: '底部'},
              ],
              value: 'top'
            },
            {
              type: 'el-select',
              label: '布局前置',
              name: 'layoutFront',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'vertical', name: '竖排'},
                {code: 'horizontal', name: '横排'},
              ],
              value: 'horizontal'
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
              value: [{color: '#abd9e9'}, {color: '#74add1'}, {color: '#4575b4'}, {color: '#313695'}],
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
          {"axis": "0", "yaxis": "0", "num": 3320},
          {"axis": "0", "yaxis": "1", "num": 1561},
          {"axis": "0", "yaxis": "2", "num": 3194},
          {"axis": "0", "yaxis": "3", "num": 2899},
          {"axis": "0", "yaxis": "4", "num": 2363},
          {"axis": "0", "yaxis": "5", "num": 3945},
          {"axis": "0", "yaxis": "6", "num": 2051},
          {"axis": "0", "yaxis": "7", "num": 3657},
          {"axis": "0", "yaxis": "8", "num": 3304},
          {"axis": "0", "yaxis": "9", "num": 2990},
          {"axis": "1", "yaxis": "9", "num": 2663},
          {"axis": "1", "yaxis": "0", "num": 378},
          {"axis": "1", "yaxis": "1", "num": 4076},
          {"axis": "1", "yaxis": "2", "num": 3178},
          {"axis": "1", "yaxis": "3", "num": 1501},
          {"axis": "1", "yaxis": "4", "num": 1660},
          {"axis": "1", "yaxis": "5", "num": 726},
          {"axis": "1", "yaxis": "6", "num": 4148},
          {"axis": "1", "yaxis": "7", "num": 720},
          {"axis": "1", "yaxis": "8", "num": 430},
          {"axis": "2", "yaxis": "9", "num": 2983},
          {"axis": "2", "yaxis": "0", "num": 1917},
          {"axis": "2", "yaxis": "1", "num": 1188},
          {"axis": "2", "yaxis": "2", "num": 3581},
          {"axis": "2", "yaxis": "3", "num": 1781},
          {"axis": "2", "yaxis": "4", "num": 4725},
          {"axis": "2", "yaxis": "5", "num": 4077},
          {"axis": "2", "yaxis": "6", "num": 299},
          {"axis": "2", "yaxis": "7", "num": 4828},
          {"axis": "2", "yaxis": "8", "num": 1778},
          {"axis": "3", "yaxis": "9", "num": 3171},
          {"axis": "3", "yaxis": "0", "num": 2944},
          {"axis": "3", "yaxis": "1", "num": 763},
          {"axis": "3", "yaxis": "2", "num": 1678},
          {"axis": "3", "yaxis": "3", "num": 1765},
          {"axis": "3", "yaxis": "4", "num": 2949},
          {"axis": "3", "yaxis": "5", "num": 966},
          {"axis": "3", "yaxis": "6", "num": 4622},
          {"axis": "3", "yaxis": "7", "num": 2818},
          {"axis": "3", "yaxis": "8", "num": 3913},
          {"axis": "4", "yaxis": "9", "num": 4382},
          {"axis": "4", "yaxis": "0", "num": 1670},
          {"axis": "4", "yaxis": "1", "num": 4532},
          {"axis": "4", "yaxis": "2", "num": 2116},
          {"axis": "4", "yaxis": "3", "num": 2383},
          {"axis": "4", "yaxis": "4", "num": 510},
          {"axis": "4", "yaxis": "5", "num": 33},
          {"axis": "4", "yaxis": "6", "num": 4974},
          {"axis": "4", "yaxis": "7", "num": 3627},
          {"axis": "4", "yaxis": "8", "num": 2737},
          {"axis": "5", "yaxis": "9", "num": 656},
          {"axis": "5", "yaxis": "0", "num": 3689},
          {"axis": "5", "yaxis": "1", "num": 713},
          {"axis": "5", "yaxis": "2", "num": 3551},
          {"axis": "5", "yaxis": "3", "num": 3159},
          {"axis": "5", "yaxis": "4", "num": 4150},
          {"axis": "5", "yaxis": "5", "num": 1416},
          {"axis": "5", "yaxis": "6", "num": 3021},
          {"axis": "5", "yaxis": "7", "num": 1778},
          {"axis": "5", "yaxis": "8", "num": 863},
          {"axis": "6", "yaxis": "9", "num": 772},
          {"axis": "6", "yaxis": "0", "num": 1675},
          {"axis": "6", "yaxis": "1", "num": 1323},
          {"axis": "6", "yaxis": "2", "num": 2023},
          {"axis": "6", "yaxis": "3", "num": 43},
          {"axis": "6", "yaxis": "4", "num": 4964},
          {"axis": "6", "yaxis": "5", "num": 4781},
          {"axis": "6", "yaxis": "6", "num": 2608},
          {"axis": "6", "yaxis": "7", "num": 2278},
          {"axis": "6", "yaxis": "8", "num": 3285},
          {"axis": "7", "yaxis": "9", "num": 1977},
          {"axis": "7", "yaxis": "0", "num": 882},
          {"axis": "7", "yaxis": "1", "num": 2434},
          {"axis": "7", "yaxis": "2", "num": 4694},
          {"axis": "7", "yaxis": "3", "num": 3022},
          {"axis": "7", "yaxis": "4", "num": 1798},
          {"axis": "7", "yaxis": "5", "num": 2503},
          {"axis": "7", "yaxis": "6", "num": 693},
          {"axis": "7", "yaxis": "7", "num": 275},
          {"axis": "7", "yaxis": "8", "num": 3774},
          {"axis": "8", "yaxis": "9", "num": 1386},
          {"axis": "8", "yaxis": "0", "num": 1212},
          {"axis": "8", "yaxis": "1", "num": 1982},
          {"axis": "8", "yaxis": "2", "num": 1509},
          {"axis": "8", "yaxis": "3", "num": 94},
          {"axis": "8", "yaxis": "4", "num": 2082},
          {"axis": "8", "yaxis": "5", "num": 3930},
          {"axis": "8", "yaxis": "6", "num": 4528},
          {"axis": "8", "yaxis": "7", "num": 1861},
          {"axis": "8", "yaxis": "8", "num": 4582},
          {"axis": "9", "yaxis": "9", "num": 3038},
          {"axis": "9", "yaxis": "0", "num": 4038},
          {"axis": "9", "yaxis": "1", "num": 357},
          {"axis": "9", "yaxis": "2", "num": 306},
          {"axis": "9", "yaxis": "3", "num": 479},
          {"axis": "9", "yaxis": "4", "num": 823},
          {"axis": "9", "yaxis": "5", "num": 3442},
          {"axis": "9", "yaxis": "6", "num": 904},
          {"axis": "9", "yaxis": "7", "num": 399},
          {"axis": "9", "yaxis": "8", "num": 4869},
        ]
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-coord',
        relactiveDomValue: 'dynamicData',
        dictKey: 'COORD_PROPERTIES',
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
        value: 300,
      },
    ],
  }
}
