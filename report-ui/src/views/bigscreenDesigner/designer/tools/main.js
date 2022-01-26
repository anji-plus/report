/*
 * @Descripttion: json 入口文件
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:46:46
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-12-13 14:23:59
 */

import {widgetText} from "./configure/widget-text"
import {widgetMarquee} from "./configure/widget-marquee"
import {widgetHref} from "./configure/widget-href"
import {widgetTime} from "./configure/widget-time"
import {widgetImage} from "./configure/widget-image"
import {widgetSliders} from "./configure/widget-slider"
import {widgetVideo} from "./configure/widget-video"
import {widgetTable} from "./configure/widget-table"
import {widgetIframe} from "./configure/widget-iframe"
import {widgetUniversal} from "./configure/widget-universal"
import {widgetBarchart} from "./configure/widget-barchart"
import {widgetGradientBarchart} from "./configure/widget-gradient-barchart"
import {widgetLinechart} from "./configure/widget-linechart"
import {widgetBarlinechart} from "./configure/widget-barlinechart"
import {widgetPiechart} from "./configure/widget-piechart"
import {widgetFunnel} from "./configure/widget-funnel"
import {widgetGauge} from "./configure/widget-gauge"
import {widgetMap} from "./configure/widget-map"
import {widgetPieNightingale} from "./configure/widget-pie-nightingale"
import {widgetPiePercentage} from "./configure/widget-pie-percentage"
import {widgetAirbubbleMap} from "./configure/widget-airbubble-map"
import {widgetBarStack} from "./configure/widget-bar-stack"
import {widgetLineStack} from "./configure/widget-line-stack"
import {widgetBarCompare} from "./configure/widget-bar-compare"
import {widgetLineCompare} from "./configure/widget-line-compare"
import {widgetDecoratePie} from "./configure/widget-decorate-pie";
import {widgetMoreBarLine} from "./configure/widget-more-bar-line";
import {widgetWordCloud} from "./configure/widget-word-cloud";

export const widgetTool = [
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
  widgetPieNightingale,
  widgetPiePercentage,
  widgetAirbubbleMap,
  widgetBarStack,
  widgetLineStack,
  widgetBarCompare,
  widgetLineCompare,
  widgetDecoratePie,
  widgetMoreBarLine,
  widgetWordCloud
]
