/*
 * @Descripttion: 中国地图 json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:31:21
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-10 14:06:32
 */
export const widgetLineMap = {
  code: 'widgetLineMap',
  type: 'mapChart',
  tabName: '地图',
  label: '路线地图',
  icon: 'icon-ditu1',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '路线图',
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
          name: '路线设置',
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
              type: 'el-select',
              label: '位置',
              name: 'sourceFontPosition',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'top', name: '上'},
                {code: 'left', name: '左'},
                {code: 'right', name: '右'},
                {code: 'inside', name: '里'},
                {code: 'insideTop', name: '里顶'},
                {code: 'insideLeft', name: '里左'},
                {code: 'insideRight', name: '里右'},
                {code: 'insideBottom', name: '里底'},
              ],
              value: 'top'
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
              label: '文字字号',
              name: 'sourceFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'sourceFontColor',
              required: false,
              placeholder: '',
              value: '#ff7f50'
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
            {
              type: 'el-select',
              label: '文字风格',
              name: 'sourceFontStyle',
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
              name: 'sourceFontFamily',
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
              type: 'el-select',
              label: '位置',
              name: 'targetFontPosition',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'top', name: '上'},
                {code: 'left', name: '左'},
                {code: 'right', name: '右'},
                {code: 'inside', name: '里'},
                {code: 'insideTop', name: '里顶'},
                {code: 'insideLeft', name: '里左'},
                {code: 'insideRight', name: '里右'},
                {code: 'insideBottom', name: '里底'},
              ],
              value: 'inside'
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
              name: 'targetFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '文字颜色',
              name: 'targetFontColor',
              required: false,
              placeholder: '',
              value: '#46bee9'
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'targetFontWeight',
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
              name: 'targetFontStyle',
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
              name: 'targetFontFamily',
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
          name: '提示语设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowTooltip',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'tooltipFontSize',
              required: false,
              placeholder: '',
              value: 16
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'tooltipColor',
              required: false,
              placeholder: '',
              value: '#00FEFF'
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'tooltipFontWeight',
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
              name: 'tooltipFontStyle',
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
              name: 'tooltipFontFamily',
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
