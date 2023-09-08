/*
 * @Descripttion: 气泡地图json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:35:32
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2022-11-07 15:41:02
 */
export const widgetAirbubbleMap = {
  code: 'widgetAirBubbleMap',
  type: 'mapChart',
  tabName: '中国地图',
  label: '气泡地图',
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
        value: '中国地图-气泡图',
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
          name: '地图设置',
          list: [
            {
              type: 'el-switch',
              label: '文字显示',
              name: 'isShowMap',
              required: false,
              placeholder: '',
              value: true
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
              type: 'vue-color',
              label: '文字颜色',
              name: 'fontTextColor',
              required: false,
              placeholder: '',
              value: '#D4EEFF'
            },
            {
              type: 'el-select',
              label: '文字粗细',
              name: 'fontTextWeight',
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
              label: '数值大小',
              name: 'fontDataSize',
              required: false,
              placeholder: '',
              value: 15,
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'fontDataColor',
              required: false,
              placeholder: '',
              value: '#D4EEFF'
            },
            {
              type: 'el-select',
              label: '数值粗细',
              name: 'fontDataWeight',
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
          name: '气泡设置',
          list: [
            {
              type: 'el-input-number',
              label: '最小半径',
              name: 'fontminSize4Pin',
              required: false,
              placeholder: '',
              value: 20,
            },
            {
              type: 'el-input-number',
              label: '最大半径',
              name: 'fontmaxSize4Pin',
              required: false,
              placeholder: '',
              value: 100,
            },
            /*{
              type: 'vue-color',
              label: '气泡颜色',
              name: 'fontPieColor',
              required: false,
              placeholder: '',
              value: ''
            },*/
          ],
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
          { "name": "南海诸岛", "value": 1 },
          { "name": "北京市", "value": 524 },
          { "name": "天津市", "value": 14 },
          { "name": "上海市", "value": 150 },
          { "name": "重庆市", "value": 75 },
          { "name": "河北省", "value": 13 },
          { "name": "河南省", "value": 83 },
          { "name": "云南省", "value": 11 },
          { "name": "辽宁省", "value": 19 },
          { "name": "黑龙江省", "value": 15 },
          { "name": "湖南省", "value": 69 },
          { "name": "安徽省", "value": 260 },
          { "name": "山东省", "value": 39 },
          { "name": "新疆维吾尔自治区", "value": 4 },
          { "name": "江苏省", "value": 31 },
          { "name": "浙江省", "value": 104 },
          { "name": "江西省", "value": 36 },
          { "name": "湖北省", "value": 1052 },
          { "name": "广西壮族自治区", "value": 33 },
          { "name": "甘肃省", "value": 347 },
          { "name": "山西省", "value": 8 },
          { "name": "内蒙古自治区", "value": 157 },
          { "name": "陕西省", "value": 22 },
          { "name": "吉林省", "value": 4 },
          { "name": "福建省", "value": 36 },
          { "name": "贵州省", "value": 39 },
          { "name": "广东省", "value": 996 },
          { "name": "青海省", "value": 27 },
          { "name": "西藏自治区", "value": 31 },
          { "name": "四川省", "value": 46 },
          { "name": "宁夏回族自治区", "value": 16 },
          { "name": "海南省", "value": 22 },
          { "name": "台湾省", "value": 6 },
          { "name": "香港", "value": 2 },
          { "name": "澳门", "value": 9 }],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-piechart',
        dictKey: 'MAP_PROPERTIES',
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
