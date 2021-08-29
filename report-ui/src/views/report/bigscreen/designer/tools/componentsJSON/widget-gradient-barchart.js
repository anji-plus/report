/*
 * @Descripttion: 柱状图渐变色 json
 * @version: 
 * @Author: qianlishi
 * @Date: 2021-08-29 07:23:41
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-08-29 07:23:42
 */
export const widgetGradientBarchart =  {
    code: 'widget-gradient-color-barchart',
    type: 'chart',
    label: '柱形图-渐变色',
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
          value: '柱形图-渐变色',
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
/*              {
                type: 'el-slider',
                label: '最小高度',
                name: 'minHeight',
                require: false,
                placeholder: '',
                value: 0,
              },*/
            ],
          },
          {
            name: '标题设置',
            list: [
              {
                type: 'el-switch',
                label: '标题',
                name: 'isNoTitle',
                required: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'el-input-text',
                label: '标题',
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
                value: 22
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
                value: '#90979c'
              },
              {
                type: 'el-input-text',
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
                value: 20
              },
            ],
          },
          {
            name: 'X轴设置',
            list: [
              {
                type: 'el-input-text',
                label: '名称',
                name: 'xName',
                required: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'el-switch',
                label: '显示',
                name: 'hideX',
                required: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'el-input-number',
                label: '字号',
                name: 'fontSizeX',
                required: false,
                placeholder: '',
                value: 12,
              },
              {
                type: 'vue-color',
                label: '颜色',
                name: 'Xcolor',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-slider',
                label: '文字角度',
                name: 'textAngle',
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
                type: 'el-switch',
                label: '轴反转',
                name: 'reversalX',
                required: false,
                placeholder: '',
                value: false
              },
              {
                type: 'vue-color',
                label: '轴颜色',
                name: 'lineColorX',
                required: false,
                placeholder: '',
                value: '#fff',
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
              }
            ],
          },
          {
            name: 'Y轴设置',
            list: [
              {
                type: 'el-input-text',
                label: '名称',
                name: 'textNameY',
                require: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'el-switch',
                label: '显示',
                name: 'isShowY',
                require: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'vue-color',
                label: '颜色',
                name: 'colorY',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-input-number',
                label: '字号',
                name: 'fontSizeY',
                required: false,
                placeholder: '',
                value: 12,
              },
              {
                type: 'el-slider',
                label: '文字角度',
                name: 'ytextAngle',
                required: false,
                placeholder: '',
                value: 0
              },
              {
                type: 'el-input-number',
                label: '文字间隔',
                name: 'ytextInterval',
                required: false,
                placeholder: '',
                value: ''
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
                type: 'vue-color',
                label: '轴颜色',
                name: 'lineColorY',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-switch',
                label: '分割线显示',
                name: 'isShowSplitLineY',
                require: false,
                placeholder: '',
                value: false,
              }, {
                type: 'vue-color',
                label: '分割线颜色',
                name: 'splitLineColorY',
                required: false,
                placeholder: '',
                value: '#fff',

              }
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
                value: false
              },
              {
                type: 'el-input-number',
                label: '字体大小',
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
                label: '字体大小',
                name: 'tipsFontSize',
                required: false,
                placeholder: '',
                value: 16
              },
              {
                type: 'vue-color',
                label: '字体颜色',
                name: 'lineColor',
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
            name: '渐变色',
            list: [
              {
                type: 'vue-color',
                label: '0%处',
                name: 'bar0color',
                required: false,
                placeholder: '',
                value: '#00F4FF'
              },
              {
                type: 'vue-color',
                label: '100%处',
                name: 'bar100color',
                required: false,
                placeholder: '',
                value: '#004DA7'
              },
              {
                type: 'vue-color',
                label: '阴影颜色',
                name: 'shadowColor',
                required: false,
                placeholder: '',
                value: '#00A0DD'
              },
              {
                type: 'el-input-number',
                label: '模糊系数',
                name: 'shadowBlur',
                required: false,
                placeholder: '',
                value: 4,
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
          placeholder: 'px',
          relactiveDom: 'dataType',
          relactiveDomValue: 'staticData',
          value: {"categories": ["苹果","三星","小米","oppo","vivo"],"series": [{"name": "手机品牌","data": [1000,2229,3879,2379,4079]}]},
        },
        {
          type: 'dycustComponents',
          label: '',
          name: 'dynamicData',
          required: false,
          placeholder: 'px',
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
          placeholder: 'px',
          value: 0,
        },
        {
          type: 'el-input-number',
          label: '上边距',
          name: 'top',
          required: false,
          placeholder: 'px',
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
    }
  }