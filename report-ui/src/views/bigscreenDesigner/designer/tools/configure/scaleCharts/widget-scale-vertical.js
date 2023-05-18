
export const widgetScaleVertical = {
  code: 'widget-scale-vertical',
  type: 'scaleCharts',
  tabName: '刻度尺',
  label: '竖刻度尺',
  icon: 'iconjindutiao',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '竖刻度尺',
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
          name: '刻度设定',
          list: [
            {
              type: 'el-switch',
              label: '刻度显示',
              name: 'isShowScale',
              required: false,
              placeholder: '',
              value: true,
            },
            {
              type: 'el-input-number',
              label: '最大刻度',
              name: 'maxScale',
              require: false,
              placeholder: '',
              value: 100,
            },
            {
              type: 'vue-color',
              label: '刻度颜色',
              name: 'scaleColor',
              required: false,
              placeholder: '',
              value: 'rgba(56, 128, 138,1)'
            },
            {
              type: 'el-input-number',
              label: '刻度宽度',
              name: 'scaleBarWidth',
              required: false,
              placeholder: '',
              value: 2,
            },
            {
              type: 'el-input-number',
              label: '刻度值字号',
              name: 'scaleFontSize',
              required: false,
              placeholder: '',
              value: 16,
            },
            {
              type: 'vue-color',
              label: '刻度值颜色',
              name: 'scaleDataColor',
              required: false,
              placeholder: '',
              value: 'rgba(56, 128, 138,1)'
            },
            {
              type: 'el-select',
              label: '刻度值粗细',
              name: 'scaleFontWeight',
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
          name: '外框设置',
          list: [
            {
              type: 'el-input-number',
              label: '宽度',
              name: 'outBarWidth',
              required: false,
              placeholder: '',
              value: 45,
            },
            {
              type: 'vue-color',
              label: '颜色',
              name: 'outBarColor',
              require: false,
              placeholder: '',
              value: '#00FEFF',
            },
            {
              type: 'el-slider',
              label: '圆角',
              name: 'outBarRadius',
              require: false,
              placeholder: '',
              value: 50,
            },
          ],
        },
        {
          name: '内框设置',
          list: [
            {
              type: 'el-input-number',
              label: '宽度',
              name: 'inBarWidth',
              required: false,
              placeholder: '',
              value: 35,
            },
            {
              type: 'vue-color',
              label: '空白区颜色',
              name: 'inBarColor',
              require: false,
              placeholder: '',
              value: 'rgba(56, 128, 138,1)',
            },
            {
              type: 'el-slider',
              label: '圆角',
              name: 'inBarRadius',
              require: false,
              placeholder: '',
              value: 50,
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
              value: true,
            },
            {
              type: 'el-input-number',
              label: '位置',
              name: 'fontDistance',
              required: false,
              placeholder: '',
              value: 0,
            },
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'fontSize',
              required: false,
              placeholder: '',
              value: 16,
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
          ],
        },
        {
          name: '渐变色',
          list: [
            {
              type: 'vue-color',
              label: '0%',
              name: 'bar0Color',
              required: false,
              placeholder: '',
              value: '#00FEFF'
            },
            {
              type: 'vue-color',
              label: '30%',
              name: 'bar30Color',
              required: false,
              placeholder: '',
              value: '#93FE94'
            },
            {
              type: 'vue-color',
              label: '70%',
              name: 'bar70Color',
              required: false,
              placeholder: '',
              value: '#E4D225'
            },
            {
              type: 'vue-color',
              label: '100%',
              name: 'bar100Color',
              required: false,
              placeholder: '',
              value: '#E01F28'
            },
          ],
        },
        {
          name: '提示语设置',
          list: [
            {
              type: 'el-input-number',
              label: '字体字号',
              name: 'tipFontSize',
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
              value: 60,
            }, {
              type: 'el-slider',
              label: '顶边距(像素)',
              name: 'marginTop',
              required: false,
              placeholder: '',
              value: 20,
            }, {
              type: 'el-slider',
              label: '右边距(像素)',
              name: 'marginRight',
              required: false,
              placeholder: '',
              value: 30,
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
        value: [{"num": 50 }]
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        chartType: 'widget-scale',
        relactiveDomValue: 'dynamicData',
        dictKey: 'TEXT_PROPERTIES',
        value: null,
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
        value: 250,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 400,
      },
    ],
  }
}
