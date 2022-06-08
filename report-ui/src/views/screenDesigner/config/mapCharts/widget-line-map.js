/*
 * @Descripttion: 中国地图 json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:31:21
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-09-28 14:17:20
 */
export const widgetLineMap = {
  code: 'widgetLineMap',
  type: 'mapChart',
  tabName: '中国地图',
  label: '路线地图',
  icon: 'iconzhongguoditu',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '中国地图-路线图',
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
              value: 20
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
              value: 12
            },
          ],
        },
        {
          name: '起点设置',
          list: [
            {
              type: 'el-switch',
              label: '起点显示',
              name: 'isShowSource',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '点大小',
              name: 'sourceSymbolSize',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'vue-color',
              label: '点颜色',
              name: 'sourcePointColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'sourceFontTextSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'sourceFontTextColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'sourceFontTextWeight',
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
          name: '终点设置',
          list: [
            {
              type: 'el-switch',
              label: '终点显示',
              name: 'isShowTarget',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '点大小',
              name: 'targetSymbolSize',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'vue-color',
              label: '点颜色',
              name: 'targetPointColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'targetFontTextSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'targetFontTextColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'targetFontTextWeight',
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
          name: '图标设置',
          list: [
            {
              type: 'el-select',
              label: '图标样式',
              name: 'symbol',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'arrow', name: '箭头'},
                {code: 'plane', name: '飞机'},
              ],
              value: 'arrow'
            },
            {
              type: 'el-input-number',
              label: '动画速度',
              name: 'symbolPeriod',
              required: false,
              placeholder: '',
              value: 4,
            },
            {
              type: 'el-input-number',
              label: '图标大小',
              name: 'symbolSize',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'vue-color',
              label: '图标颜色',
              name: 'symbolColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
          ],
        },
        {
          name: '线设置',
          list: [
            {
              type: 'vue-color',
              label: '线颜色',
              name: 'lineColor',
              required: false,
              placeholder: '',
              value: '#ffa022'
            },
            {
              type: 'el-input-number',
              label: '线宽度',
              name: 'lineWidth',
              required: false,
              placeholder: '',
              value: 2,
            },
          ],
        },
        {
          name: '地图颜色',
          list: [
            {
              type: 'vue-color',
              label: '地图块颜色',
              name: 'blockColor',
              required: false,
              placeholder: '',
              value: '#073684'
            },
            {
              type: 'vue-color',
              label: '边界颜色',
              name: 'borderColor',
              required: false,
              placeholder: '',
              value: '#061E3D'
            },
            {
              type: 'vue-color',
              label: '高亮颜色',
              name: 'highlightColor',
              required: false,
              placeholder: '',
              value: '#2B91B7'
            },
          ],
        },
      ]
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
          {source: '北京市', target: '上海市', value: 95},
          {source: '北京市', target: '广州市', value: 90},
          {source: '北京市', target: '大连市', value: 80},
          {source: '北京市', target: '南宁市', value: 70},
          {source: '北京市', target: '南昌市', value: 60},
          {source: '北京市', target: '拉萨市', value: 50},
          {source: '北京市', target: '长春市', value: 40},
          {source: '北京市', target: '包头市', value: 30},
          {source: '北京市', target: '重庆市', value: 20},
          {source: '北京市', target: '常州市', value: 10},
          {source: '上海市', target: '包头市', value: 95},
          {source: '上海市', target: '昆明市', value: 90},
          {source: '上海市', target: '广州市', value: 80},
          {source: '上海市', target: '郑州市', value: 70},
          {source: '上海市', target: '长春市', value: 60},
          {source: '上海市', target: '重庆市', value: 50},
          {source: '上海市', target: '长沙市', value: 40},
          {source: '上海市', target: '北京市', value: 30},
          {source: '上海市', target: '丹东市', value: 20},
          {source: '上海市', target: '大连市', value: 10},
          {source: '广州市', target: '福州市', value: 95},
          {source: '广州市', target: '太原市', value: 90},
          {source: '广州市', target: '长春市', value: 80},
          {source: '广州市', target: '重庆市', value: 70},
          {source: '广州市', target: '西安市', value: 60},
          {source: '广州市', target: '成都市', value: 50},
          {source: '广州市', target: '常州市', value: 40},
          {source: '广州市', target: '北京市', value: 30},
          {source: '广州市', target: '北海市', value: 20},
          {source: '广州市', target: '海口市', value: 10},
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-linemap',
        dictKey: 'SOUTAR_PROPERTIES',
        relactiveDomValue: 'dynamicData',
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
