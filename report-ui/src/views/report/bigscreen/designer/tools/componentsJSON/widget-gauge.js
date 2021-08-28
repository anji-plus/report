/*
 * @Descripttion: 仪表盘 json
 * @version: 
 * @Author: qianlishi
 * @Date: 2021-08-29 07:30:25
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-08-29 07:30:25
 */
export const widgetGauge = {
    code: 'widget-gauge',
    type: 'chart',
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
          type: 'el-input-number',
          label: '刻度线粗度',
          name: 'tickMarkWeight',
          require: false,
          placeholder: '',
          value: 10,
        },
        {
          type: 'el-switch',
          label: '显示刻度值',
          name: 'showScaleValue',
          require: false,
          placeholder: '',
          value: true,
        },
        {
          type: 'el-switch',
          label: '显示刻度线',
          name: 'showTickMarks',
          require: false,
          placeholder: '',
          value: true,
        },
        {
          type: 'el-input-number',
          label: '刻度字号',
          name: 'scaleFontSize',
          require: false,
          placeholder: '',
          value: 16,
        },
        {
          type: 'el-input-number',
          label: '指标字号',
          name: 'targetFontSize',
          require: false,
          placeholder: '',
          value: 20,
        },
        {
          type: 'vue-color',
          label: '背景颜色',
          name: 'background',
          required: false,
          placeholder: '',
          value: ''
        },
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
          value: {value: 50, name: "名称", unit: "%"},
        },
        {
          type: 'dycustComponents',
          label: '',
          name: 'dynamicData',
          required: false,
          placeholder: 'px',
          relactiveDom: 'dataType',
          chartType: 'widget-gauge',
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
