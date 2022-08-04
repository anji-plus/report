/**
 *  文本栏：{type: 'text',tabName: '文本栏'}
 *  柱状图：{type: 'barChart',tabName: '柱状图'}
 *  柱线图：{type: 'barlineChart',tabName: '柱线图'}
 *  装饰图：{type: 'decorate',tabName: '装饰图'}
 *  漏斗图：{type: 'funnel',tabName: '漏斗图'}
 *  热力图：{type: 'heatmap',tabName: '热力图'}
 *  折线图：{type: 'lineChart',tabName: '折线图'}
 *  地图：{type: 'mapChart',tabName: '地图'}
 *  百分比图：{type: 'percent',tabName: '百分比图'}
 *  饼图：{type: 'pieChart',tabName: '饼图'}
 *  词云图：{type: 'wordCloud',tabName: '词云图'}
 * **/

import { screenConfig } from './texts/screenConfig'
import {widgetHref} from "./texts/widget-href"
import {widgetIframe} from "./texts/widget-iframe"
import {widgetImage} from "./texts/widget-image"
import {widgetMarquee} from "./texts/widget-marquee"
import {widgetSliders} from "./texts/widget-slider"
import {widgetTable} from "./texts/widget-table"
import {widgetText} from "./texts/widget-text"
import {widgetTime} from "./texts/widget-time"
import {widgetVideo} from "./texts/widget-video"
import {widgetBarchart} from './barCharts/widget-barchart'
import {widgetGradientBarchart} from "./barCharts/widget-gradient-barchart"
import {widgetLinechart} from "./lineCharts/widget-linechart"
import {widgetBarlinechart} from "./barlineCharts/widget-barlinechart"
import {widgetPiechart} from "./pieCharts/widget-piechart"
import {widgetFunnel} from "./funnelCharts/widget-funnel"
import {widgetGauge} from "./percentCharts/widget-gauge"
import {widgetLineMap} from "./mapCharts/widget-line-map"
import {widgetPieNightingale} from "./pieCharts/widget-pie-nightingale"
import {widgetPiePercentage} from "./percentCharts/widget-pie-percentage"
import {widgetAirbubbleMap} from "./mapCharts/widget-airbubble-map"
import {widgetBarStack} from "./barCharts/widget-bar-stack"
import {widgetLineStack} from "./lineCharts/widget-line-stack"
import {widgetBarCompare} from "./barCharts/widget-bar-compare"
import {widgetLineCompare} from "./lineCharts/widget-line-compare"
import {widgetDecoratePie} from "./decorateCharts/widget-decorate-pie";
import {widgetMoreBarLine} from "./barlineCharts/widget-more-bar-line";
import {widgetWordCloud} from "./wordcloudCharts/widget-word-cloud";
import {widgetHeatmap} from "./heatmap/widget-heatmap";


export const widgetTool = [
  screenConfig,
  widgetHref,
  widgetIframe,
  widgetImage,
  widgetMarquee,
  // widgetSliders,
  widgetTable,
  widgetText,
  widgetTime,
  widgetVideo,
  widgetBarchart,
  widgetGradientBarchart,
  widgetLinechart,
  widgetBarlinechart,
  widgetPiechart,
  widgetFunnel,
  widgetGauge,
  widgetLineMap,
  widgetPieNightingale,
  widgetPiePercentage,
  widgetAirbubbleMap,
  widgetBarStack,
  widgetLineStack,
  widgetBarCompare,
  widgetLineCompare,
  widgetDecoratePie,
  widgetMoreBarLine,
  widgetWordCloud,
  widgetHeatmap
]
