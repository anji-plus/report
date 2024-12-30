/*
 * @Descripttion: 柱线图
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:26:48
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-10 14:04:14
 */
export const widgetBarLineSingle = {
  code: 'widgetBarLineSingleChart',
  type: 'barlineCharts',
  tabName: '柱线图',
  label: '柱线图-单坐标',
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
        value: '柱线图-单坐标',
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
          name: '柱体设置',
          list: [
            {
              type: 'el-slider',
              label: '最大宽度',
              name: 'maxWidth',
              required: false,
              placeholder: '',
              value: 15,
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
              type: 'el-slider',
              label: '间距',
              name: 'barGap',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'el-slider',
              label: '最小高度',
              name: 'minHeight',
              require: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-switch',
              label: '背景显示',
              name: 'isShowBackground',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'vue-color',
              label: '背景颜色',
              name: 'backgroundStyleColor',
              required: false,
              placeholder: '',
              value: 'rgba(180, 180, 180, 0.2)',
            },
            {
              type: 'vue-color',
              label: '描边颜色',
              name: 'backgroundStyleBorderColor',
              required: false,
              placeholder: '',
              value: '#000',
            },
            {
              type: 'el-input-number',
              label: '描边宽度',
              name: 'backgroundStyleBorderWidth',
              required: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-select',
              label: '描边类型',
              name: 'backgroundStyleBorderType',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'solid', name: '实线'},
                {code: 'dashed', name: '虚线'},
                {code: 'dotted', name: '斑点'},
              ],
              value: 'dashed'
            },
            {
              type: 'el-input-number',
              label: '阴影模糊',
              name: 'backgroundStyleShadowBlur',
              required: false,
              placeholder: '',
              value: 10,
            },
            {
              type: 'vue-color',
              label: '阴影颜色',
              name: 'backgroundStyleShadowColor',
              required: false,
              placeholder: '',
              value: 'rgba(0, 0, 0, 0.5)',
            },
            {
              type: 'el-slider',
              label: '透明度',
              name: 'backgroundStyleOpacity',
              require: false,
              placeholder: '',
              value: 100,
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
              value: 5,
            },
            {
              type: 'el-select',
              label: '点样式',
              name: 'symbol',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'circle', name: '实心点'},
                {code: 'emptyCircle', name: '空心点'},
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
              value: 5,
            },
            {
              type: 'el-switch',
              label: '面积堆积',
              name: 'area',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-slider',
              label: '面积厚度',
              name: 'areaThickness',
              required: false,
              placeholder: '',
              value: 15,
            },
          ],
        },
        {
          name: 'X轴设置',
          list: [
            {
              type: 'el-switch',
              label: 'X轴显示',
              name: 'isShowX',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-switch',
              label: '数值显示',
              name: 'isShowAxisLabelX',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-select',
              label: '数值位置',
              name: 'positionX',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'top', name: '顶'},
                {code: 'bottom', name: '底'},
              ],
              value: 'bottom'
            },
            {
              type: 'el-input-number',
              label: '数值距离',
              name: 'offsetX',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'textColorX',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'textFontSizeX',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-select',
              label: '数值粗细',
              name: 'textFontWeightX',
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
              name: 'textFontStyleX',
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
              name: 'textFontFamilyX',
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
              name: 'textIntervalX',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-input-number',
              label: '数值角度',
              name: 'textAngleX',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '坐标轴显示',
              name: 'isShowAxisLineX',
              require: false,
              placeholder: '',
              value: true,
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
              type: 'el-input-text',
              label: '坐标名',
              name: 'nameX',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-select',
              label: '坐标名位置',
              name: 'nameLocationX',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'start', name: '起点'},
                {code: 'center', name: '中间'},
                {code: 'end', name: '终点'},
              ],
              value: 'end'
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
              type: 'el-select',
              label: '坐标名粗细',
              name: 'nameFontWeightX',
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
              label: '坐标名风格',
              name: 'nameFontStyleX',
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
              label: '坐标名字体',
              name: 'nameFontFamilyX',
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
          name: 'Y轴设置',
          list: [
            {
              type: 'el-switch',
              label: '左Y轴显示',
              name: 'isShowY',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-switch',
              label: '数值显示',
              name: 'isShowAxisLabelY',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-text',
              label: '最大值',
              name: 'maxY',
              required: false,
              placeholder: '',
              value: '',
            },
            {
              type: 'el-select',
              label: '数值位置',
              name: 'positionY',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'left', name: '左'},
                {code: 'right', name: '右'},
              ],
              value: 'left'
            },
            {
              type: 'el-input-number',
              label: '数值距离',
              name: 'offsetY',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'vue-color',
              label: '数值颜色',
              name: 'textColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '数值字号',
              name: 'textFontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-select',
              label: '数值粗细',
              name: 'textFontWeightY',
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
              name: 'textFontStyleY',
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
              name: 'textFontFamilyY',
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
            /*            {
                          type: 'el-input-number',
                          label: '数值间隔',
                          name: 'textIntervalY',
                          required: false,
                          placeholder: '',
                          value: 0
                        },*/
            {
              type: 'el-switch',
              label: '缩放',
              name: 'scaleY',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-input-number',
              label: '均分',
              name: 'splitNumberY',
              required: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-input-number',
              label: '数值角度',
              name: 'textAngleY',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'el-switch',
              label: '坐标轴显示',
              name: 'isShowAxisLineY',
              require: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'vue-color',
              label: '坐标轴颜色',
              name: 'lineColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标轴宽度',
              name: 'lineWidthY',
              required: false,
              placeholder: '',
              value: 1,
            },
            {
              type: 'el-input-text',
              label: '坐标名',
              name: 'textNameY',
              require: false,
              placeholder: '',
              value: ''
            },
            {
              type: 'el-select',
              label: '坐标名位置',
              name: 'nameLocationY',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'start', name: '起点'},
                {code: 'center', name: '中间'},
                {code: 'end', name: '终点'},
              ],
              value: 'end'
            },
            {
              type: 'vue-color',
              label: '坐标名颜色',
              name: 'nameColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '坐标名字号',
              name: 'nameFontSizeY',
              required: false,
              placeholder: '',
              value: 14,
            },
            {
              type: 'el-select',
              label: '坐标名粗细',
              name: 'nameFontWeightY',
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
              label: '坐标名风格',
              name: 'nameFontStyleY',
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
              label: '坐标名字体',
              name: 'nameFontFamilyY',
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
            /*            {
                          type: 'el-switch',
                          label: '刻度线显示',
                          name: 'tickLineY',
                          require: false,
                          placeholder: '',
                          value: true,
                        },*/
            {
              type: 'el-switch',
              label: '分割线显示',
              name: 'isShowSplitLineY',
              require: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'vue-color',
              label: '分割线颜色',
              name: 'splitLineColorY',
              required: false,
              placeholder: '',
              value: '#fff',
            },
            {
              type: 'el-input-number',
              label: '分割线宽度',
              name: 'splitLineFontWidthY',
              required: false,
              placeholder: '',
              value: 1,
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
              type: 'el-select',
              label: '位置',
              name: 'fontPositionBar',
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
              label: '距离',
              name: 'fontDistanceBar',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'fontColorBar',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSizeBar',
              required: false,
              placeholder: '',
              value: 12
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'fontWeightBar',
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
              name: 'fontStyleBar',
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
              name: 'fontFamilyBar',
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
              type: 'el-select',
              label: '位置',
              name: 'fontPositionLine',
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
              label: '距离',
              name: 'fontDistanceLine',
              required: false,
              placeholder: '',
              value: 0
            },
            {
              type: 'vue-color',
              label: '字体颜色',
              name: 'fontColorLine',
              required: false,
              placeholder: '',
              value: '#fff'
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSizeLine',
              required: false,
              placeholder: '',
              value: 12
            },
            {
              type: 'el-select',
              label: '字体粗细',
              name: 'fontWeightLine',
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
              name: 'fontStyleLine',
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
              name: 'fontFamilyLine',
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
              type: 'el-select',
              label: '触发类型',
              name: 'tooltipTrigger',
              required: false,
              placeholder: '',
              selectOptions: [
                {code: 'item', name: '数据项'},
                {code: 'axis', name: '坐标轴'},
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
                {code: 'none', name: '无'},
                {code: 'line', name: '直线'},
                {code: 'shadow', name: '阴影'},
                {code: 'cross', name: '十字准星'},
              ],
              value: 'shadow'
            },
            {
              type: 'vue-color',
              label: '背景颜色',
              name: 'tooltipBackgroundColor',
              required: false,
              placeholder: '',
              value: '#333'
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
            {
              type: 'vue-color',
              label: '边框颜色',
              name: 'tooltipBorderColor',
              required: false,
              placeholder: '',
              value: '#333'
            },
            {
              type: 'el-input-number',
              label: '边框宽度',
              name: 'tooltipBorderWidth',
              required: false,
              placeholder: '',
              value: 0
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
            },
            {
              type: 'el-slider',
              label: '右边距(像素)',
              name: 'marginRight',
              required: false,
              placeholder: '',
              value: 50,
            },
            {
              type: 'el-slider',
              label: '顶边距(像素)',
              name: 'marginTop',
              required: false,
              placeholder: '',
              value: 50,
            },
            {
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
              value: [{color: '#ff7f50'}, {color: '#87cefa'}, {color: '#da70d6'}, {color: '#32cd32'}, {color: '#6495ed'}],
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
          {"axis": "1月", "bar": 2.6, "line": 2},
          {"axis": "2月", "bar": 5.9, "line": 2.2},
          {"axis": "3月", "bar": 9, "line": 3.3},
          {"axis": "4月", "bar": 26.4, "line": 4.5},
          {"axis": "5月", "bar": 28.7, "line": 6.3},
          {"axis": "6月", "bar": 70.7, "line": 10.2},
          {"axis": "7月", "bar": 175.6, "line": 20.3},
          {"axis": "8月", "bar": 182.2, "line": 23.4},
          {"axis": "9月", "bar": 48.7, "line": 23},
          {"axis": "10月", "bar": 18.8, "line": 16.5},
          {"axis": "11月", "bar": 6, "line": 12},
          {"axis": "12月", "bar": 2.3, "line": 6.2},
        ]
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-barlinechart',
        dictKey: 'BAR_LINE_PROPERTIES',
        relactiveDomValue: 'dynamicData',
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