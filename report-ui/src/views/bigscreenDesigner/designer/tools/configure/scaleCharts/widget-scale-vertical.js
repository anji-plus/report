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
              label: '刻度值距离',
              name: 'scaleDistance',
              required: false,
              placeholder: '',
              value: 10
            },
            {
              type: 'vue-color',
              label: '刻度值颜色',
              name: 'scaleFontColor',
              required: false,
              placeholder: '',
              value: 'rgba(56, 128, 138,1)'
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
              type: 'el-select',
              label: '刻度值粗细',
              name: 'scaleFontWeight',
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
              label: '刻度值风格',
              name: 'scaleFontStyle',
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
              label: '刻度值字体',
              name: 'scaleFontFamily',
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
              value: 'top'
            },
            {
              type: 'el-input-number',
              label: '距离',
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
              label: '字体系列',
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
          name: '坐标轴边距设置',
          list: [
            {
              type: 'el-slider',
              label: '左边距(像素)',
              name: 'marginLeft',
              required: false,
              placeholder: '',
              value: 50,
            },
            {
              type: 'el-slider',
              label: '右边距(像素)',
              name: 'marginRight',
              required: false,
              placeholder: '',
              value: 10,
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
        value: [{"num": 50}]
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
