/**
 * @Author: foming
 */
export const widgetRadar = {
  code: 'widget-radar',
  type: 'radarCharts',
  tabName: '雷达图',
  label: '雷达图',
  icon: 'iconleidatu',
  options: {
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '雷达图',
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
          name: '雷达设置',
          list: [
            {
              type: 'el-select',
              label: '雷达样式',
              name: 'radarShape',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'line', name: '线型' },
                { code: 'circle', name: '圆型' },
              ],
              value: 'line'
            },
            {
              type: 'el-input-number',
              label: '均分数量',
              name: 'splitNumber',
              require: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'el-switch',
              label: '坐标轴显示',
              name: 'axisLineShow',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'axisLineColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-slider',
              label: '坐标轴透明度',
              name: 'axisLineOpacity',
              required: false,
              placeholder: '',
              value: 50
            },
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'splitLineShow',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColor',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-slider',
              label: '分割线透明度',
              name: 'splitLineOpacity',
              required: false,
              placeholder: '',
              value: 50
            },
          ],
        },
        {
          name: '顶点设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'axisNameShow',
              required: false,
              placeholder: '',
              value: true
            },
            {
              type: 'el-input-number',
              label: '名称大小',
              name: 'axisNameFontSize',
              required: false,
              placeholder: '',
              value: 12,
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'axisNameColor',
              required: false,
              placeholder: '',
              value: '#87cefa',
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'axisNamFontWeight',
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
              name: 'axisNamFontStyle',
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
              type: 'el-select',
              label: '字体粗细',
              name: 'legendFontWeight',
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
              name: 'legendFontStyle',
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
              name: 'legendFontFamily',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'Microsoft YaHei', name: '微软雅黑' },
                { code: 'serif', name: 'serif字体' },
                { code: 'Arial', name: 'Arial字体' },
                { code: 'Courier New', name: 'Courier New字体' },
              ],
              value: 'Microsoft YaHei'
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
              type: 'el-input-number',
              label: '图例高度',
              name: 'legendHeight',
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
              type: 'el-select',
              label: '位置',
              name: 'fontPosition',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'top', name: '上' },
                { code: 'left', name: '左' },
                { code: 'right', name: '右' },
                { code: 'inside', name: '里' },
                { code: 'insideTop', name: '里顶' },
                { code: 'insideLeft', name: '里左' },
                { code: 'insideRight', name: '里右' },
                { code: 'insideBottom', name: '里底' },
              ],
              value: 'insideTop'
            },
            {
              type: 'el-input-number',
              label: '距离',
              name: 'fontDistance',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSize',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'fontColor',
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
            {
              type: 'el-select',
              label: '字体风格',
              name: 'fontStyle',
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
              name: 'fontFamily',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'Microsoft YaHei', name: '微软雅黑' },
                { code: 'serif', name: 'serif字体' },
                { code: 'Arial', name: 'Arial字体' },
                { code: 'Courier New', name: 'Courier New字体' },
              ],
              value: 'Microsoft YaHei'
            },
            {
              type: 'el-input-number',
              label: '点大小',
              name: 'symbolSize',
              required: false,
              placeholder: '',
              value: 5
            },
            {
              type: 'el-input-number',
              label: '线条宽度',
              name: 'lineWidth',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-select',
              label: '线型效果',
              name: 'lineType',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'solid', name: '实线' },
                { code: 'dashed', name: '虚线' },
                { code: 'dotted', name: '斑点' },
              ],
              value: 'solid'
            },
            {
              type: 'el-slider',
              label: '透明度',
              name: 'opacity',
              required: false,
              placeholder: '',
              value: 50
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
              value: true,
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
              name: 'tooltipFontStyle',
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
              name: 'tooltipFontFamily',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'Microsoft YaHei', name: '微软雅黑' },
                { code: 'serif', name: 'serif字体' },
                { code: 'Arial', name: 'Arial字体' },
                { code: 'Courier New', name: 'Courier New字体' },
              ],
              value: 'Microsoft YaHei'
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
      {
        type: 'dynamic-add-radar',
        label: '',
        name: 'dynamicAddRadar',
        required: false,
        placeholder: '',
        value: [
          { name: 'SA', key: 'Sales', max: 6500 },
          { name: 'Admin', key: 'Admin', max: 16000 },
          { name: 'Information', key: 'Information', max: 30000 },
          { name: 'Customer', key: 'Customer', max: 38000 },
          { name: 'Develop', key: 'Develop', max: 52000 },
        ]
      }
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
          { name: '2016', Sales: 4200, Admin: 3000, Information: 20000, Customer: 35000, Develop: 50000 },
          { name: '2017', Sales: 5000, Admin: 14000, Information: 28000, Customer: 26000, Develop: 42000 },
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
        chartType: 'widget-radar',
        dictKey: 'RADAR_PROPERTIES',
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
    ]
  }
}
