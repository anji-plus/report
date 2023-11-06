/*
 * @Descripttion: 柱状图json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:21:45
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-10 14:09:03
 */
export const widgetBarchart = {
  code: 'widget-barchart',
  type: 'barChart',
  tabName: '柱状图',
  label: '柱状图',
  icon: 'iconzhuzhuangtu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '柱状图',
      },
      {
        type: 'el-switch',
        label: '竖展示',
        name: 'verticalShow',
        required: false,
        placeholder: '',
        value: false,
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
          name: '柱体设置',
          list: [
            {
              type: 'el-slider',
              label: '最大宽度',
              name: 'maxWidth',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'el-slider',
              label: '圆角',
              name: 'radius',
              require: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'el-slider',
              label: '最小高度',
              name: 'minHeight',
              require: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-select',
              label: '堆叠样式',
              name: 'stackStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'leftRight', name: '左右堆叠' },
                { code: 'upDown', name: '上下堆叠' },
              ],
              value: 'leftRight'
            },
            {
              type: 'el-switch',
              label: '背景显示',
              name: 'isShowBackground',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'vue-color',
              label: '背景颜色',
              name: 'backgroundStyleColor',
              required: false,
              placeholder: '',
              value: 'rgba(180, 180, 180, 0.2)',
            },
            {
              type: 'vue-color',
              label: '描边颜色',
              name: 'backgroundStyleBorderColor',
              required: false,
              placeholder: '',
              value: '#000',
            },
            {
              type: 'el-input-number',
              label: '描边宽度',
              name: 'backgroundStyleBorderWidth',
              required: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-select',
              label: '描边类型',
              name: 'backgroundStyleBorderType',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'solid', name: '实线' },
                { code: 'dashed', name: '虚线' },
                { code: 'dotted', name: '斑点' },
              ],
              value: 'dashed'
            },
            {
              type: 'el-input-number',
              label: '阴影模糊',
              name: 'backgroundStyleShadowBlur',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'vue-color',
              label: '阴影颜色',
              name: 'backgroundStyleShadowColor',
              required: false,
              placeholder: '',
              value: 'rgba(0, 0, 0, 0.5)',
            },
            {
              type: 'el-slider',
              label: '透明度',
              name: 'backgroundStyleOpacity',
              require: false,
              placeholder: '',
              value: 100,
            },
          ],
        },
        {
          name: '标题设置',
          list: [
            {
              type: 'el-switch',
              label: '标题显示',
              name: 'isNoTitle',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '标题名',
              name: 'titleText',
              required: false,
              placeholder: '',
              value: '',
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'textColor',
              required: false,
              placeholder: '',
              value: '#FFD700'
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'textFontSize',
              required: false,
              placeholder: '',
              value: 20
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
              type: 'el-select',
              label: '字体风格',
              name: 'textFontStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'normal', name: '正常' },
                { code: 'italic', name: 'italic斜体' },
                { code: 'oblique', name: 'oblique斜体' },
              ],
              value: 'normal'
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
              label: '副标题名',
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
              value: 'rgba(30, 144, 255, 1)'
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'subTextFontSize',
              required: false,
              placeholder: '',
              value: 20
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
              type: 'el-select',
              label: '字体风格',
              name: 'subTextFontStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'normal', name: '正常' },
                { code: 'italic', name: 'italic斜体' },
                { code: 'oblique', name: 'oblique斜体' },
              ],
              value: 'normal'
            },
          ],
        },
        {
          name: '图例操作',
          list: [
            {
              type: 'el-switch',
              label: '图例显示',
              name: 'isShowLegend',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '名称( | 分隔)',
              name: 'legendName',
              required: false,
              placeholder: '多值以' | '隔开',
              value: ''
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'legendColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'legendFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'el-input-number',
              label: '图例宽度',
              name: 'legendWidth',
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
                { code: 'center', name: '居中' },
                { code: 'left', name: '左对齐' },
                { code: 'right', name: '右对齐' },
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
                { code: 'top', name: '顶部' },
                { code: 'bottom', name: '底部' },
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
                { code: 'vertical', name: '竖排' },
                { code: 'horizontal', name: '横排' },
              ],
              value: 'horizontal'
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
              label: '坐标名',
              name: 'nameX',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorX',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeX',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'colorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'fontSizeX',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-switch',
              label: '数值自动换行',
              name: 'textRowsBreakAuto',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-text',
              label: '数值行数',
              name: 'textRowsNum',
              required: false,
              placeholder: '',
              value: '',
            },
            {
              type: 'el-input-number',
              label: '数值间隔',
              name: 'textInterval',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-slider',
              label: '数值角度',
              name: 'textAngleX',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '坐标轴反转',
              name: 'reversalX',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthX',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'isShowSplitLineX',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineWidthX',
              required: false,
              placeholder: '',
              value: 1,
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
              label: '最大值',
              name: 'maxY',
              required: false,
              placeholder: '',
              value: '',
            },
            {
              type: 'el-input-text',
              label: '坐标名',
              name: 'textNameY',
              require: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'colorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'fontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-switch',
              label: '缩放',
              name: 'scale',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-number',
              label: '均分',
              name: 'splitNumberY',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-slider',
              label: '数值角度',
              name: 'textAngleY',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '坐标轴反转',
              name: 'reversalY',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthY',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'isShowSplitLineY',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineWidthY',
              required: false,
              placeholder: '',
              value: 1,
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
              type: 'el-switch',
              label: '百分比符号显示',
              name: 'percentSign',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-input-number',
              label: '距离',
              name: 'distance',
              required: false,
              placeholder: '',
              value: 5
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
              name: 'dataColor',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-select',
              label: '字体粗细',
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
              name: 'tipsColor',
              required: false,
              placeholder: '',
              value: '#00FEFF'
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
              type: 'el-select',
              label: '配色样式',
              name: 'colorStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'same', name: '同色' },
                { code: 'unsame', name: '异色' },
              ],
              value: 'same'
            },
            {
              type: 'customColor',
              label: '',
              name: 'customColor',
              required: false,
              value: [{ color: '#ff7f50' }, { color: '#87cefa' }, { color: '#da70d6' }, { color: '#32cd32' }, { color: '#6495ed' }],
            },
          ],
        },
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
          { "axis": "苹果", "data": 1000 },
          { "axis": "三星", "data": 2229 },
          { "axis": "小米", "data": 3879 },
          { "axis": "oppo", "data": 2379 },
          { "axis": "vivo", "data": 4079 },
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
        chartType: 'widget-barchart',
        dictKey: 'BAR_PROPERTIES',
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
        value: 200,
      },
    ],
    // 事件
    methods: [
      // {
      //   type: 'methods',
      //   label: '前置钩子',
      //   name: 'beforeMethods',
      //   value: 'function beforeMethods(data){\n\t//自定义脚本内容1\n\treturn data;\n}',
      // },
      // {
      //   type: 'methods',
      //   label: '后置钩子',
      //   name: 'afterMethods',
      //   value: 'function afterMethods(data){\n\t//自定义脚本内容2\n\treturn data;\n}',
      // },
    ]
  }
}
