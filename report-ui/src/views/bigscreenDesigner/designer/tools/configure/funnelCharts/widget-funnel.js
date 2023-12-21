/*
 * @Descripttion: 漏斗图 json
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:29:23
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-10 14:05:07
 */
export const widgetFunnel = {
  code: 'widget-funnel',
  type: 'funnel',
  tabName: '漏斗图',
  label: '漏斗图',
  icon: 'iconloudoutu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '漏斗图',
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
        type: 'el-switch',
        label: '翻转',
        name: 'ending',
        require: false,
        placeholder: '',
        value: false,
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
              placeholder: '',
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
              type: 'el-select',
              label: '字体粗细',
              name: 'legendFontWeight',
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
              name: 'legendFontStyle',
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
              name: 'legendFontFamily',
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
                {code: 'center', name: '居中'},
                {code: 'left', name: '左对齐'},
                {code: 'right', name: '右对齐'},
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
                {code: 'top', name: '顶部'},
                {code: 'bottom', name: '底部'},
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
                {code: 'vertical', name: '竖排'},
                {code: 'horizontal', name: '横排'},
              ],
              value: 'horizontal'
            },
          ],
        },
        {
          name: '数值设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShow',
              require: false,
              placeholder: '',
              value: true,
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
              type: 'el-select',
              label: '位置',
              name: 'fontPosition',
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
              label: '距离',
              name: 'fontDistance',
              required: false,
              placeholder: '',
              value: 0
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
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSize',
              required: false,
              placeholder: '',
              value: 12
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
            {
              type: 'el-select',
              label: '数值风格',
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
              label: '数值字体',
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
        {
          name: '自定义配色',
          list: [
            {
              type: 'customColor',
              label: '',
              name: 'customColor',
              required: false,
              value: [{color: '#0CD2E6'}, {color: '#00BFA5'}, {color: '#FFC722'}, {color: '#886EFF'}, {color: '#008DEC'}],
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
          {"value": 2, "name": "访问"},
          {"value": 5, "name": "咨询"},
          {"value": 20, "name": "订单"},
          {"value": 40, "name": "点击"},
          {"value": 125, "name": "展现"}
        ],
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-funnel',
        relactiveDomValue: 'dynamicData',
        dictKey: 'PIE_PROPERTIES',
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
        value: 500,
      },
    ],
  }
}
