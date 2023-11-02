export const widgetBarMap = {
  code: 'widgetBarMap',
  type: 'mapChart',
  tabName: '中国地图',
  label: '柱形地图',
  icon: 'iconzhongguoditu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '中国地图-柱形图',
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
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
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
                {code: 'normal', name: '正常'},
                {code: 'italic', name: 'italic斜体'},
                {code: 'oblique', name: 'oblique斜体'},
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
                {code: 'center', name: '居中'},
                {code: 'left', name: '左对齐'},
                {code: 'right', name: '右对齐'},
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
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
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
                {code: 'normal', name: '正常'},
                {code: 'italic', name: 'italic斜体'},
                {code: 'oblique', name: 'oblique斜体'},
              ],
              value: 'normal'
            },
          ],
        },
        {
          name: '地图设置',
          list: [
            {
              type: 'el-switch',
              label: '省市区显示',
              name: 'isShowMap',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'fontSizeMap',
              required: false,
              placeholder: '',
              value: 20,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'colorMap',
              required: false,
              placeholder: '',
              value: '#53D9FF'
            }
          ]
        },
        {
          name: '地图块颜色',
          list: [
            {
              type: 'vue-color',
              label: '0%处颜色',
              name: 'font0PreColor',
              required: false,
              placeholder: '',
              value: '#073684'
            },
            {
              type: 'vue-color',
              label: '100%颜色',
              name: 'font100PreColor',
              required: false,
              placeholder: '',
              value: '#061E3D'
            },
            {
              type: 'vue-color',
              label: '高亮渐变色',
              name: 'fontHighlightColor',
              required: false,
              placeholder: '',
              value: '#2B91B7'
            },
            {
              type: 'vue-color',
              label: '边界颜色',
              name: 'borderColor',
              required: false,
              placeholder: '',
              value: '#061E3D'
            },
          ],
        },
        {
          name: '柱形设置',
          list: [
            {
              type: 'el-input-number',
              label: '高度比',
              name: 'heightRate',
              required: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'el-input-number',
              label: '柱体宽度',
              name: 'barWidth',
              required: false,
              placeholder: '',
              value: 20,
            },
            {
              type: 'el-input-number',
              label: '柱底外圆大小',
              name: 'barBottomOutSymbolSize',
              required: false,
              placeholder: '',
              value: 30,
            },
          ],
        },
        {
          name: '数值设置',
          list: [
            {
              type: 'el-switch',
              label: '文字显示',
              name: 'isShowFontText',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'fontTextSize',
              required: false,
              placeholder: '',
              value: 15,
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'fontTextWeight',
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
              type: 'el-select',
              label: '字体风格',
              name: 'fontTextStyle',
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
              type: 'el-switch',
              label: '数值显示',
              name: 'isShowFontData',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '数值大小',
              name: 'fontDataSize',
              required: false,
              placeholder: '',
              value: 15,
            },
            {
              type: 'el-select',
              label: '数值粗细',
              name: 'fontDataWeight',
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
              type: 'el-select',
              label: '字体风格',
              name: 'fontDataStyle',
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
          name: '自定义配色',
          list: [
            {
              type: 'customColor',
              label: '',
              name: 'customColor',
              required: false,
              value: [{ color: '#ff7f50' }, { color: '#87cefa' }, { color: '#da70d6' }, { color: '#32cd32' }, { color: '#6495ed' }],
            },
          ],
        },
      ],
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
          {name: "北京", latitude: 116.4073, longitude: 39.9041, value: 70,},
          {name: "天津", latitude: 117.2015, longitude: 39.0853, value: 20,},
          {name: "上海", latitude: 121.4648, longitude: 31.2891, value: 150,},
          {name: "重庆", latitude: 107.7539, longitude: 30.1904, value: 75,},
          {name: "河南", latitude: 113.753, longitude: 34.767, value: 83,},
          {name: "云南", latitude: 102.7093, longitude: 25.0464, value: 50,},
          {name: "安徽", latitude: 117.3301, longitude: 31.7345, value: 36,},
          {name: "山东", latitude: 117.0207, longitude: 36.6702, value: 39,},
          {name: "江西", latitude: 115.8165, longitude: 28.6372, value: 23,},
          {name: "青海", latitude: 101.7804, longitude: 36.6225, value: 27,},
          {name: "四川", latitude: 104.0764, longitude: 30.6516, value: 46,},
          {name: "海南", latitude: 110.3487, longitude: 20.0186, value: 16,},
          {name: "西藏", latitude: 91.1174, longitude: 29.6486, value: 31,},
          {name: "宁夏", latitude: 106.2588, longitude: 38.4722, value: 47,},
          {name: "新疆", latitude: 87.6285, longitude: 43.7933, value: 42,},
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-mapv2chart',
        dictKey: 'MAP_V2_PROPERTIES',
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
