/*
 * @Descripttion: 主线图
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:26:48
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-08-29 07:26:49
 */
export const widgetBarlinechart = {
    code: 'widget-barlinechart',
    type: 'chart',
    label: '柱线图',
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
          value: '柱线图',
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
                type: 'el-switch',
                label: '平滑曲线',
                name: 'smoothCurve',
                required: false,
                placeholder: '',
                value: true,
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
                value: 5,
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
            name: '柱体设置',
            list: [
              {
                type: 'el-slider',
                label: '最大宽度',
                name: 'maxWidth',
                required: false,
                placeholder: '',
                value: 10,
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
                label: '最小高度',
                name: 'minHeight',
                require: false,
                placeholder: '',
                value: 0,
              },
            ],
          },
          {
            name: '标题设置',
            list: [
              {
                type: 'el-switch',
                label: '标题',
                name: 'isNoTitle',
                required: false,
                placeholder: '',
                value: true
              },
              {
                type: 'el-input-text',
                label: '标题',
                name: 'titleText',
                required: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'vue-color',
                label: '字体颜色',
                name: 'textColor',
                required: false,
                placeholder: '',
                value: '#fff'
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
                type: 'el-input-number',
                label: '字体大小',
                name: 'textFontSize',
                required: false,
                placeholder: '',
                value: 20
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
                value: 'left'
              },
              {
                type: 'el-input-text',
                label: '副标题',
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
                value: '#fff'
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
                type: 'el-input-number',
                label: '字体大小',
                name: 'subTextFontSize',
                required: false,
                placeholder: '',
                value: 20
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
                name: 'xName',
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
                value: '#fff',
              },
              {
                type: 'el-input-number',
                label: '坐标字号',
                name: 'nameFontSizeX',
                required: false,
                placeholder: '',
                value: 14,
              },
              {
                type: 'vue-color',
                label: '数值颜色',
                name: 'Xcolor',
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
                type: 'el-slider',
                label: '数值角度',
                name: 'textAngle',
                required: false,
                placeholder: '',
                value: 0
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
                type: 'el-switch',
                label: '轴反转',
                name: 'reversalX',
                required: false,
                placeholder: '',
                value: false
              },
              {
                type: 'vue-color',
                label: '轴颜色',
                name: 'lineColorX',
                required: false,
                placeholder: '',
                value: '#fff',
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
              }
            ],
          },
          {
            name: 'Y轴设置',
            list: [
              {
                type: 'el-switch',
                label: '左显示',
                name: 'isShowYLeft',
                require: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'el-input-text',
                label: '左坐标名',
                name: 'textNameYLeft',
                require: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'vue-color',
                label: '左坐标名颜色',
                name: 'nameColorYLeft',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-input-number',
                label: '左坐标字号',
                name: 'namefontSizeYLeft',
                required: false,
                placeholder: '',
                value: 14,
              },
              {
                type: 'el-input-number',
                label: '左均分',
                name: 'splitNumberLeft',
                required: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'el-switch',
                label: '右显示',
                name: 'isShowYRight',
                require: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'el-input-text',
                label: '右坐标名',
                name: 'textNameYRight',
                require: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'vue-color',
                label: '右坐标名颜色',
                name: 'nameColorYRight',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-input-number',
                label: '右坐标字号',
                name: 'namefontSizeYRight',
                required: false,
                placeholder: '',
                value: 14,
              },
              {
                type: 'el-input-number',
                label: '右均分',
                name: 'splitNumberRight',
                required: false,
                placeholder: '',
                value: ''
              },
              {
                type: 'vue-color',
                label: '数值颜色',
                name: 'colorY',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-input-number',
                label: '数值字号',
                name: 'fontSizeY',
                required: false,
                placeholder: '',
                value: 14,
              },
              {
                type: 'el-switch',
                label: '轴反转',
                name: 'reversalY',
                required: false,
                placeholder: '',
                value: false
              },
              {
                type: 'vue-color',
                label: '轴颜色',
                name: 'lineColorY',
                required: false,
                placeholder: '',
                value: '#fff',
              },
            ],
          },
          {
            name: '提示语设置',
            list: [
              {
                type: 'el-input-number',
                label: '字体大小',
                name: 'fontSize',
                required: false,
                placeholder: '',
                value: 12
              },
              {
                type: 'vue-color',
                label: '字体颜色',
                name: 'lineColor',
                required: false,
                placeholder: '',
                value: '#fff'
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
            name: '图例操作',
            list: [
              {
                type: 'el-switch',
                label: '图例',
                name: 'isShowLegend',
                required: false,
                placeholder: '',
                value: true,
              },
              {
                type: 'vue-color',
                label: '字体颜色',
                name: 'lengedColor',
                required: false,
                placeholder: '',
                value: '#fff',
              },
              {
                type: 'el-input-text',
                label: '字体大小',
                name: 'lengedFontSize',
                required: false,
                placeholder: '',
                value: 16,
              },
              {
                type: 'el-input-number',
                label: '图例宽度',
                name: 'lengedWidth',
                required: false,
                placeholder: '',
                value: 15,
              },
              {
                type: 'el-select',
                label: '横向位置',
                name: 'lateralPosition',
                required: false,
                placeholder: '',
                selectOptions: [
                  {code: 'left', name: '左对齐'},
                  {code: 'right', name: '右对齐'},
                ],
                value: ''
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
                value: ''
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
                value: ''
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
                value: [{color: '#00F4FFFF'}, {color: '#e68b55'}],
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
          value: 5000
        },
        {
          type: 'el-button',
          label: '静态数据',
          name: 'staticData',
          required: false,
          placeholder: 'px',
          relactiveDom: 'dataType',
          relactiveDomValue: 'staticData',
          value: {"xAxis": ["1月", "2月", "3月", "4月", "5月","6月", "7月", "8月","9月","10月","11月","12月"],"series": [{"type": "bar","name": "货运量","data": [2.6,5.9,9,26.4,28.7,70.7,175.6,182.2,48.7,18.8,6,2.3]},{"type": "line","name": "货运总量","yAxisIndex": 1,"data": [2,2.2,3.3,4.5,6.3,10.2,20.3,23.4,23,16.5,12,6.2]}]},
        },
        {
          type: 'dycustComponents',
          label: '',
          name: 'dynamicData',
          required: false,
          placeholder: 'px',
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
          placeholder: 'px',
          value: 0,
        },
        {
          type: 'el-input-number',
          label: '上边距',
          name: 'top',
          required: false,
          placeholder: 'px',
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
          value: 200,
        },
      ],
    }
  }
