/*
 * @Descripttion: 仪表盘 json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:30:25
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-10 14:06:52
 */
export const widgetGauge = {
  code: 'widget-gauge',
  type: 'percent',
  tabName: '百分比',
  label: '仪表盘',
  icon: 'iconyibiaopan',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '仪表盘',
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
              value: 0,
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
          name: "仪表盘设置",
          list: [
            {
              type: 'el-switch',
              label: '顺时针渲染',
              name: 'clockwise',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '起始角度',
              name: 'startAngle',
              required: false,
              placeholder: '',
              selectOptions: '',
              value: 225
            },
            {
              type: 'el-input-number',
              label: '结束角度',
              name: 'endAngle',
              required: false,
              placeholder: '',
              selectOptions: '',
              value: -45
            },
            {
              type: 'el-input-number',
              label: '最大值',
              name: 'maxValue',
              require: false,
              placeholder: '',
              value: 100,
            },
          ]
        },
        {
          name: "圆环设置",
          list: [
            {
              type: 'el-switch',
              label: '圆环显示',
              name: 'ringShow',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '圆环宽度',
              name: 'pieWeight',
              require: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'el-switch',
              label: '刻度线显示',
              name: 'tickShow',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '刻度数',
              name: 'tickSplitNumber',
              required: false,
              placeholder: '',
              value: 5,
            },
            /*            {
              type: 'el-input-number',
              label: '距离',
              name: 'tickDistance',
              require: false,
              placeholder: '',
              value: 0,
            },*/
            {
              type: 'el-input-number',
              label: '长度',
              name: 'tickLength',
              require: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'el-input-number',
              label: '宽度',
              name: 'tickWidth',
              require: false,
              placeholder: '',
              value: 2,
            },
            {
              type: 'el-select',
              label: '刻度线类型',
              name: 'tickType',
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
              type: 'el-switch',
              label: '指标线显示',
              name: 'splitShow',
              required: false,
              placeholder: '',
              value: true,
            },
/*            {
              type: 'el-input-number',
              label: '距离',
              name: 'splitDistance',
              require: false,
              placeholder: '',
              value: 0,
            },*/
            {
              type: 'el-input-number',
              label: '长度',
              name: 'splitLength',
              require: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-input-number',
              label: '宽度',
              name: 'splitWidth',
              require: false,
              placeholder: '',
              value: 4,
            },
            {
              type: 'el-select',
              label: '指标线类型',
              name: 'splitType',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'solid', name: '实线'},
                {code: 'dashed', name: '虚线'},
                {code: 'dotted', name: '斑点'},
              ],
              value: 'solid'
            },
          ]
        },
        {
          name: "数值设定",
          list: [
            {
              type: 'el-switch',
              label: '数值显示',
              name: 'isShow',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-switch',
              label: '百分比显示',
              name: 'percentage',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'detailFontSize',
              require: false,
              placeholder: '',
              value: 24,
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'detailColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'detailFontWeight',
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
              name: 'detailFontStyle',
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
              label: '字体系列',
              name: 'detailFontFamily',
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
              label: '指标显示',
              name: 'labelShow',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '距离',
              name: 'labelDistance',
              require: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'vue-color',
              label: '指标颜色',
              name: 'labelColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '指标字号',
              name: 'labelFontSize',
              require: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'labelFontWeight',
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
              name: 'labelFontStyle',
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
              label: '字体系列',
              name: 'labelFontFamily',
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
          ]
        },
        {
          name: '0%~30%渐变色',
          list: [
            {
              type: 'vue-color',
              label: '0处颜色',
              name: 'color30p0',
              required: false,
              placeholder: '',
              value: 'rgba(0, 237, 3,0.1)'
            },
            {
              type: 'vue-color',
              label: '0.5处颜色',
              name: 'color30p5',
              required: false,
              placeholder: '',
              value: 'rgba(0, 237, 3,0.6)'
            },
            {
              type: 'vue-color',
              label: '1处颜色',
              name: 'color30p10',
              required: false,
              placeholder: '',
              value: 'rgba(0, 237, 3,1)'
            },
          ]
        },
        {
          name: '30%~70%渐变色',
          list: [
            {
              type: 'vue-color',
              label: '0处颜色',
              name: 'color70p0',
              required: false,
              placeholder: '',
              value: 'rgba(255, 184, 0,0.1)'
            },
            {
              type: 'vue-color',
              label: '0.5处颜色',
              name: 'color70p5',
              required: false,
              placeholder: '',
              value: 'rgba(255, 184, 0,0.6)'
            },
            {
              type: 'vue-color',
              label: '1处颜色',
              name: 'color70p10',
              required: false,
              placeholder: '',
              value: 'rgba(255, 184, 0,1)'
            },
          ]
        },
        {
          name: '70%~100%渐变色',
          list: [
            {
              type: 'vue-color',
              label: '0处颜色',
              name: 'color100p0',
              required: false,
              placeholder: '',
              value: 'rgba(175, 36, 74,0.1)'
            },
            {
              type: 'vue-color',
              label: '0.5处颜色',
              name: 'color100p5',
              required: false,
              placeholder: '',
              value: 'rgba(255, 36, 74,0.6)'
            },
            {
              type: 'vue-color',
              label: '1处颜色',
              name: 'color100p10',
              required: false,
              placeholder: '',
              value: 'rgba(255, 36, 74,1)'
            },
          ]
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
          { "num": 50 }
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-text',
        dictKey: 'TEXT_PROPERTIES',
        relactiveDomValue: 'dynamicData',
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
        value: 300,
      },
    ],
  }
}
