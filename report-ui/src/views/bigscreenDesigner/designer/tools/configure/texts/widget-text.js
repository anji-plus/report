/*
 * @Descripttion: 文本json文件
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 06:52:13
 * @LastEditors: qianlishi qianlishi@anji-plus.com
 * @LastEditTime: 2023-01-11 13:18:36
 */
export const widgetText = {
  code: 'widget-text',
  type: 'text',
  tabName: '文本栏',
  label: '文本',
  icon: 'iconziyuan',
  options: {
    // 配置
    setup: [
      {
        type: 'el-input-text',
        label: '图层名称',
        name: 'layerName',
        required: false,
        placeholder: '',
        value: '文本框',
      },
      {
        type: 'el-input-textarea',
        label: '文本内容',
        name: 'text',
        required: false,
        placeholder: '',
        value: '文本框',
      },
      {
        type: 'el-input-text',
        label: '拼接内容',
        name: 'joinText',
        required: false,
        placeholder: '',
        value: "",
      },
      {
        type: 'el-input-number',
        label: '字体字号',
        name: 'fontSize',
        required: false,
        placeholder: '',
        value: '26',
      },
      {
        type: 'vue-color',
        label: '字体颜色',
        name: 'color',
        required: false,
        placeholder: '',
        value: '#FAD400',
      },
      {
        type: 'el-input-number',
        label: '字体间距',
        name: 'letterSpacing',
        required: false,
        placeholder: '',
        value: '0',
      },
      {
        type: 'vue-color',
        label: '字体背景',
        name: 'background',
        required: false,
        placeholder: '',
        value: 'rgba(115,170,229,.0)',
      },
      {
        type: 'el-select',
        label: '文字粗细',
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
        label: '对齐方式',
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
        type: 'el-input-number',
        label: '行高',
        name: 'lineHeight',
        required: false,
        placeholder: '',
        value: '40',
      },
      {
        type: 'el-input-number',
        label: '边框宽度',
        name: 'borderWidth',
        required: false,
        placeholder: '',
        value: '0',
      },
      {
        type: 'vue-color',
        label: '边框颜色',
        name: 'borderColor',
        required: false,
        placeholder: '',
        value: 'rgba(255,255,255,0)',
      },
      {
        type: 'el-select',
        label: '边框类型',
        name: 'borderStyle',
        required: false,
        placeholder: '',
        selectOptions: [
          { code: 'solid', name: '实线' },
          { code: 'dashed', name: '虚线' },
        ],
        value: 'solid',
      },
      {
        type: 'el-input-number',
        label: '边框圆角',
        name: 'borderRadius',
        required: false,
        placeholder: '',
        value: '0',
      },
      {
        type: 'el-switch',
        label: '识别换行符',
        name: 'whiteSpace',
        required: false,
        placeholder: '',
        value: false,
      },
      [
        {
          name: '自定义样式设置',
          list: [
            {
              type: 'el-switch',
              label: '启用条件样式',
              name: 'useCondition',
              required: false,
              placeholder: '',
              value: false,
            },
            {
              type: 'el-select',
              label: '条件类型',
              name: 'conditionOperator',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: '>', name: '大于' },
                { code: '<', name: '小于' },
                { code: '=', name: '等于' },
                { code: '>=', name: '大于等于' },
                { code: '<=', name: '小于等于' },
                { code: 'includes', name: '包含' },
              ],
              value: '=',
            },
            {
              type: 'el-input-text',
              label: '条件值',
              name: 'conditionValue',
              required: false,
              placeholder: '输入数值或文本',
              value: '',
            },
            {
              type: 'vue-color',
              label: '条件文本颜色',
              name: 'conditionTextColor',
              required: false,
              placeholder: '',
              value: '#FF0000',
            },
            {
              type: 'vue-color',
              label: '条件背景色',
              name: 'conditionBgColor',
              required: false,
              placeholder: '',
              value: 'rgba(255,255,255,0)',
            },
            {
              type: 'el-select',
              label: '条件文字粗细',
              name: 'conditionFontWeight',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'normal', name: '正常' },
                { code: 'bold', name: '粗体' },
                { code: 'bolder', name: '特粗体' },
                { code: 'lighter', name: '细体' }
              ],
              value: 'bold'
            },
            {
              type: 'el-select',
              label: '条件字体样式',
              name: 'conditionFontStyle',
              required: false,
              placeholder: '',
              selectOptions: [
                { code: 'normal', name: '正常' },
                { code: 'italic', name: '斜体' }
              ],
              value: 'normal'
            }
          ]
        }
      ]
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
        value: '文本框',
      },
      {
        type: 'dycustComponents',
        label: '',
        name: 'dynamicData',
        required: false,
        placeholder: '',
        relactiveDom: 'dataType',
        relactiveDomValue: 'dynamicData',
        chartType: 'widget-text',
        dictKey: 'TEXT_PROPERTIES',
        value: '',
      }
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
        value: 100,
      },
      {
        type: 'el-input-number',
        label: '高度',
        name: 'height',
        required: false,
        placeholder: '该容器在1080px大屏中的高度',
        value: 40
      },
    ],
  }
}
