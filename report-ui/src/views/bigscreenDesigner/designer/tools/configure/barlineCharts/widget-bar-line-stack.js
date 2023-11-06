/*
 * @Descripttion: 柱线堆叠图
 * @Author: foming
 */
export const widgetBarLineStack = {
  code: 'widgetBarLineStackChart',
  type: 'barlineCharts',
  tabName: '柱线图',
  label: '柱线堆叠图',
  icon: 'iconzhuxiantu',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '柱线堆叠图',
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
              label: '宽度',
              name: 'maxWidth',
              required: false,
              placeholder: '',
              value: 20,
            },
            {
              type: 'el-slider',
              label: '圆角',
              name: 'radius',
              require: false,
              placeholder: '',
              value: 5,
            },
            {
              type: 'el-select',
              label: '堆叠样式',
              name: 'stackStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'leftRight', name: '左右堆叠' },
                { code: 'upDown', name: '上下堆叠' },
              ],
              value: 'leftRight'
            },
          ],
        },
        {
          name: '折线设置',
          list: [
            {
              type: 'el-switch',
              label: '标记点',
              name: 'markPoint',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-slider',
              label: '点大小',
              name: 'pointSize',
              required: false,
              placeholder: '',
              value: 3,
            },
            {
              type: 'el-select',
              label: '点样式',
              name: 'symbol',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'circle', name: '实心点' },
                { code: 'emptyCircle', name: '空心点' },
              ],
              value: 'circle'
            },
            {
              type: 'el-switch',
              label: '平滑曲线',
              name: 'smoothCurve',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-slider',
              label: '线条宽度',
              name: 'lineWidth',
              required: false,
              placeholder: '',
              value: 3,
            },
          ],
        },
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
              placeholder: '多值以' | '隔开',
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
              type: 'el-input-number',
              label: '图例宽度',
              name: 'legendWidth',
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
          name: 'X轴设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'hideX',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '坐标名',
              name: 'nameX',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorX',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeX',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'colorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'fontSizeX',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-switch',
              label: '数值自动换行',
              name: 'textRowsBreakAuto',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-text',
              label: '数值行数',
              name: 'textRowsNum',
              required: false,
              placeholder: '',
              value: '',
            },
            {
              type: 'el-input-number',
              label: '数值间隔',
              name: 'textInterval',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-slider',
              label: '数值角度',
              name: 'textAngleX',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '坐标轴反转',
              name: 'reversalX',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthX',
              required: false,
              placeholder: '',
              value: 1,
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
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineWidthX',
              required: false,
              placeholder: '',
              value: 1,
            },
          ],
        },
        {
          name: '左Y轴设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowYLeft',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '坐标名',
              name: 'textNameYLeft',
              require: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorYLeft',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeYLeft',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'colorYLeft',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'fontSizeYLeft',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-input-number',
              label: '均分',
              name: 'splitNumberLeft',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-slider',
              label: '数值角度',
              name: 'textAngleYLeft',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '刻度线显示',
              name: 'tickLineYLeft',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-switch',
              label: '坐标轴显示',
              name: 'lineYLeft',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorYLeft',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthYLeft',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'isShowSplitLineYLeft',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColorYLeft',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineFontWidthYLeft',
              required: false,
              placeholder: '',
              value: 1,
            },
          ],
        },
        {
          name: '右Y轴设置',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowYRight',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '坐标名',
              name: 'textNameYRight',
              require: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorYRight',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeYRight',
              required: false,
              placeholder: '',
              value: 14,
            }, {
              type: 'vue-color',
              label: '数值颜色',
              name: 'colorYRight',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'fontSizeYRight',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-input-number',
              label: '均分',
              name: 'splitNumberRight',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-slider',
              label: '数值角度',
              name: 'textAngleYRight',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '刻度线显示',
              name: 'tickLineYRight',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-switch',
              label: '坐标轴显示',
              name: 'lineYRight',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorYRight',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthYRight',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'isShowSplitLineYRight',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColorYRight',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineFontWidthYRight',
              required: false,
              placeholder: '',
              value: 1,
            },
          ],
        },
        {
          name: '柱体数值设定',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowBar',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-switch',
              label: '百分比符号显示',
              name: 'percentSignBar',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-input-number',
              label: '距离',
              name: 'distanceBar',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSizeBar',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'subTextColorBar',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'fontWeightBar',
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
          name: '折线数值设定',
          list: [
            {
              type: 'el-switch',
              label: '显示',
              name: 'isShowLine',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-switch',
              label: '百分比符号显示',
              name: 'percentSignLine',
              required: false,
              placeholder: '',
              value: false
            },
            {
              type: 'el-input-number',
              label: '距离',
              name: 'distanceLine',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSizeLine',
              required: false,
              placeholder: '',
              value: 14
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'subTextColorLine',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'fontWeightLine',
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
              type: 'el-select',
              label: '触发类型',
              name: 'tooltipTrigger',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'item', name: '数据项' },
                { code: 'axis', name: '坐标轴' },
              ],
              value: 'axis'
            },
            {
              type: 'el-select',
              label: '指示器类型',
              name: 'tooltipAxisPointerType',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'none', name: '无' },
                { code: 'line', name: '直线' },
                { code: 'shadow', name: '阴影' },
                { code: 'cross', name: '十字准星' },
              ],
              value: 'shadow'
            },
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
          { "axis": "2021-07", "name": "A", "bar": "12", "line": "20" },
          { "axis": "2021-07", "name": "B", "bar": "20", "line": "12" },
          { "axis": "2021-08", "name": "A", "bar": "0", "line": "8" },
          { "axis": "2021-08", "name": "B", "bar": "5", "line": "3" },
          { "axis": "2021-09", "name": "A", "bar": "15", "line": "9" },
          { "axis": "2021-09", "name": "B", "bar": "30", "line": "19" },
          { "axis": "2021-10", "name": "A", "bar": "10", "line": "27" },
          { "axis": "2021-10", "name": "B", "bar": "24", "line": "6" },
          { "axis": "2021-11", "name": "A", "bar": "23", "line": "29" },
          { "axis": "2021-11", "name": "B", "bar": "8", "line": "9" },
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
        chartType: 'widget-stackchart',
        dictKey: 'STACK_PROPERTIES',
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
        value: 500,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 250,
      },
    ],
  }
}
