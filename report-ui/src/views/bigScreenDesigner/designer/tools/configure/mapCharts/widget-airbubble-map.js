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
  tabName: '地图',
  label: '气泡地图',
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
        value: '气泡图',
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
          name: '数值设置',
          list: [
            {
              type: 'el-switch',
              label: '数值显示',
              name: 'isShowData',
              required: false,
              placeholder: '',
              value: true
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
                {code: 'normal', name: '正常'},
                {code: 'bold', name: '粗体'},
                {code: 'bolder', name: '特粗体'},
                {code: 'lighter', name: '细体'}
              ],
              value: 'normal'
            },
            {
              type: 'el-select',
              label: '数值风格',
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
          {"name": "南海诸岛", "value": 1},
          {"name": "北京市", "value": 524},
          {"name": "天津市", "value": 14},
          {"name": "上海市", "value": 150},
          {"name": "重庆市", "value": 75},
          {"name": "河北省", "value": 13},
          {"name": "河南省", "value": 83},
          {"name": "云南省", "value": 11},
          {"name": "辽宁省", "value": 19},
          {"name": "黑龙江省", "value": 15},
          {"name": "湖南省", "value": 69},
          {"name": "安徽省", "value": 260},
          {"name": "山东省", "value": 39},
          {"name": "新疆维吾尔自治区", "value": 4},
          {"name": "江苏省", "value": 31},
          {"name": "浙江省", "value": 104},
          {"name": "江西省", "value": 36},
          {"name": "湖北省", "value": 1052},
          {"name": "广西壮族自治区", "value": 33},
          {"name": "甘肃省", "value": 347},
          {"name": "山西省", "value": 8},
          {"name": "内蒙古自治区", "value": 157},
          {"name": "陕西省", "value": 22},
          {"name": "吉林省", "value": 4},
          {"name": "福建省", "value": 36},
          {"name": "贵州省", "value": 39},
          {"name": "广东省", "value": 996},
          {"name": "青海省", "value": 27},
          {"name": "西藏自治区", "value": 31},
          {"name": "四川省", "value": 46},
          {"name": "宁夏回族自治区", "value": 16},
          {"name": "海南省", "value": 22},
          {"name": "台湾省", "value": 6},
          {"name": "香港", "value": 2},
          {"name": "澳门", "value": 9}],
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
