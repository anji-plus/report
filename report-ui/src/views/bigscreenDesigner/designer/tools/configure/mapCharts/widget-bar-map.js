export const widgetBarMap = {
  code: 'widgetBarMap',
  type: 'mapChart',
  tabName: '地图',
  label: '柱形地图',
  icon: 'icon-ditu1',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '柱形图',
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'background',
        required: false,
        placeholder: '',
        value: ''
      },
      {
        type: 'el-select',
        label: '地图名称',
        name: 'mapName',
        required: false,
        placeholder: '',
        selectOptions: [
          {code: 'world', name: '世界'},
          {code: 'china', name: '中国'},
          {code: '安徽', name: '安徽'},
          {code: '澳门', name: '澳门'},
          {code: '北京', name: '北京'},
          {code: '重庆', name: '重庆'},
          {code: '福建', name: '福建'},
          {code: '甘肃', name: '甘肃'},
          {code: '广东', name: '广东'},
          {code: '广西', name: '广西'},
          {code: '贵州', name: '贵州'},
          {code: '海南', name: '海南'},
          {code: '河北', name: '河北'},
          {code: '黑龙江', name: '黑龙江'},
          {code: '河南', name: '河南'},
          {code: '湖北', name: '湖北'},
          {code: '湖南', name: '湖南'},
          {code: '江苏', name: '江苏'},
          {code: '江西', name: '江西'},
          {code: '吉林', name: '吉林'},
          {code: '辽宁', name: '辽宁'},
          {code: '内蒙古', name: '内蒙古'},
          {code: '宁夏', name: '宁夏'},
          {code: '青海', name: '青海'},
          {code: '山东', name: '山东'},
          {code: '上海', name: '上海'},
          {code: '山西', name: '山西'},
          {code: '陕西', name: '陕西'},
          {code: '四川', name: '四川'},
          {code: '台湾', name: '台湾'},
          {code: '天津', name: '天津'},
          {code: '香港', name: '香港'},
          {code: '新疆', name: '新疆'},
          {code: '西藏', name: '西藏'},
          {code: '云南', name: '云南'},
          {code: '浙江', name: '浙江'},
        ],
        value: 'china'
      },
      [
        {
          name: '标题设置',
          list: [
            {
              type: 'el-switch',
              label: '标题显示',
              name: 'isShowTitle',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '标题名',
              name: 'text',
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
              label: '字体系列',
              name: 'textFontFamily',
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
              type: 'el-input-text',
              label: '副标题名',
              name: 'subtext',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'subtextColor',
              required: false,
              placeholder: '',
              value: 'rgba(30, 144, 255, 1)'
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'subtextFontSize',
              required: false,
              placeholder: '',
              value: 20
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'subtextFontWeight',
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
              name: 'subtextFontStyle',
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
              name: 'subtextFontFamily',
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
              type: 'el-select',
              label: '左右位置',
              name: 'titleLeft',
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
              type: 'el-slider',
              label: '上下间距',
              name: 'titleTop',
              required: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'el-input-number',
              label: '主副标题间距',
              name: 'titleItemGap',
              required: false,
              placeholder: '',
              value: 0
            },
          ],
        },
        {
          name: '地图设置',
          list: [
            {
              type: 'el-switch',
              label: '文字显示',
              name: 'isShowMap',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'fontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'fontColor',
              required: false,
              placeholder: '',
              value: '#D4EEFF'
            },
            {
              type: 'el-select',
              label: '文字粗细',
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
            {
              type: 'el-select',
              label: '文字风格',
              name: 'fontStyle',
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
              label: '文字字体',
              name: 'fontFamily',
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
              label: '0%渐变色',
              name: 'fontColor0',
              required: false,
              placeholder: '',
              value: '#073684'
            },
            {
              type: 'vue-color',
              label: '100%渐变色',
              name: 'fontColor100',
              required: false,
              placeholder: '',
              value: '#061E3D'
            },
            {
              type: 'el-input-number',
              label: '边界线宽度',
              name: 'borderWidth',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'vue-color',
              label: '边界线颜色',
              name: 'borderColor',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-select',
              label: '边界线类型',
              name: 'borderType',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'solid', name: '实线'},
                {code: 'dashed', name: '虚线'},
                {code: 'dotted', name: '斑点'},
              ],
              value: 'solid'
            },
            {
              type: 'vue-color',
              label: '阴影颜色',
              name: 'shadowColor',
              required: false,
              placeholder: '',
              value: 'rgba(10,76,139,1)'
            },
            {
              type: 'el-input-number',
              label: '阴影模糊系数',
              name: 'shadowBlur',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'el-slider',
              label: '透明度',
              name: 'opacity',
              required: false,
              placeholder: '',
              value: 100
            },
          ]
        },
        {
          name: '地图高亮设置',
          list: [
            {
              type: 'el-switch',
              label: '文字显示',
              name: 'isShowEmphasisLabel',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '文字大小',
              name: 'emphasisLabelFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'emphasisLabelFontColor',
              required: false,
              placeholder: '',
              value: '#D4EEFF'
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'emphasisLabelFontWeight',
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
              label: '文字风格',
              name: 'emphasisLabelFontStyle',
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
              label: '文字字体',
              name: 'emphasisLabelFontFamily',
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
              label: '0%渐变色',
              name: 'emphasisLabelFontColor0',
              required: false,
              placeholder: '',
              value: '#073684'
            },
            {
              type: 'vue-color',
              label: '100%渐变色',
              name: 'emphasisLabelFontColor100',
              required: false,
              placeholder: '',
              value: 'rgba(199, 21, 133, 1)'
            },
          ]
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
              value: 16,
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
              label: '文字风格',
              name: 'fontTextStyle',
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
              label: '文字字体',
              name: 'fontTextFamily',
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
              value: 16,
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
                {code: 'normal', name: '正常'},
                {code: 'italic', name: 'italic斜体'},
                {code: 'oblique', name: 'oblique斜体'},
              ],
              value: 'normal'
            },
            {
              type: 'el-select',
              label: '数值字体',
              name: 'fontDataFamily',
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
          name: '自定义配色',
          list: [
            {
              type: 'customColor',
              label: '',
              name: 'customColor',
              required: false,
              value: [{color: '#ff7f50'}, {color: '#87cefa'}, {color: '#da70d6'}, {color: '#32cd32'}, {color: '#6495ed'}],
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
        value: 450,
      },
    ]
  }
}
