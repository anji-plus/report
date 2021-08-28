import { widgetText } from "./componentsJSON/widget-text"
import { widgetMarquee } from "./componentsJSON/widget-marquee"
import { widgetHref } from "./componentsJSON/widget-href"
import { widgetTime } from "./componentsJSON/widget-time"
import { widgetImage } from "./componentsJSON/widget-image"
import { widgetSliders } from "./componentsJSON/widget-slider"
import { widgetVideo } from "./componentsJSON/widget-video"
import { widgetTable } from "./componentsJSON/widget-table"
import { widgetIframe } from "./componentsJSON/widget-iframe"
import { widgetUniversal } from "./componentsJSON/widget-universal"
import { widgetBarchart } from "./componentsJSON/widget-barchart"
import { widgetGradientBarchart } from "./componentsJSON/widget-gradient-barchart"
import { widgetLinechart } from "./componentsJSON/widget-linechart"
import { widgetBarlinechart } from "./componentsJSON/widget-barlinechart"
import { widgetPiechart } from "./componentsJSON/widget-piechart"
import { widgetFunnel } from "./componentsJSON/widget-funnel"
import { widgetGauge } from "./componentsJSON/widget-gauge"
import { widgetMap } from "./componentsJSON/widget-map"
import { WidgetPieNightingale } from "./componentsJSON/widget-pie-nightingale"
import { widgetPiePercentage } from "./componentsJSON/widget-pie-percentage"
import { widgetAirbubbleMap } from "./componentsJSON/widget-airbubble-map"
import { widgetBarStack } from "./componentsJSON/widget-bar-stack"
import { widgetLineStack } from "./componentsJSON/widget-line-stack"
import { widgetBarCompare } from "./componentsJSON/widget-bar-compare"
const screenConfig = {
  code: 'screen',
  type: 'screen',
  label: '大屏设置',
  icon: '',
  options: {
    setup: [
      {
        type: 'el-input-number',
        label: '大屏宽度',
        name: 'width',
        required: false,
        placeholder: 'px',
        value: '1920',
      },
      {
        type: 'el-input-number',
        label: '大屏高度',
        name: 'height',
        required: false,
        placeholder: 'px',
        value: '1080',
      },
      {
        type: 'el-input-text',
        label: '标题',
        name: 'title',
        require: false,
        placeholder: '',
        value: '大屏',
      },
      {
        type: 'el-input-textarea',
        label: '大屏简介',
        name: 'description',
        required: false,
        placeholder: '',
      },
      {
        type: 'vue-color',
        label: '背景颜色',
        name: 'backgroundColor',
        required: false,
        placeholder: '',
        value: '#000',
      },
      {
        type: 'custom-upload',
        label: '图片地址',
        name: 'backgroundImage',
        required: false,
        placeholder: '',
        value: 'https://report.anji-plus.com/file/download/bf566e48-ccad-40e1-8ee9-228427e5466b',
      },
    ],
    data: [],
    position: [],
  },
}

const widgetTools = [
  // type=html类型的组件
  widgetText,
  widgetMarquee,
  widgetHref,
  widgetTime,
  widgetImage,
  //  widgetSliders,
  widgetVideo,
  widgetTable,
  widgetIframe,
  //  widgetUniversal,
  widgetBarchart,
  widgetGradientBarchart,
  widgetLinechart,
  widgetBarlinechart,
  widgetPiechart,
  widgetFunnel,
  widgetGauge,
  widgetMap,
  WidgetPieNightingale,
  widgetPiePercentage,
  widgetAirbubbleMap,
  widgetBarStack,
  widgetLineStack,
  widgetBarCompare
]

const getToolByCode = function (code) {
  // 获取大屏底层设置属性
  if (code == 'screen') {
    return screenConfig
  }
  // 获取组件
  var item = widgetTools.find(function (item, index, arrs) {
    return item.code === code
  })
  return item
}

export {widgetTools, getToolByCode}
