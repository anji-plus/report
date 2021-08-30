/*
 * @Descripttion: json 入口文件
 * @version:
 * @Author: qianlishi
 * @Date: 2021-08-29 07:46:46
 * @LastEditors: qianlishi
 * @LastEditTime: 2021-08-29 07:54:41
 */

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
import { widgetLineCompare } from "./componentsJSON/widget-line-compare"

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
  WidgetPieNightingale,
  widgetPiePercentage,
  widgetAirbubbleMap,
  widgetBarStack,
  widgetLineStack,
  widgetBarCompare,
  widgetLineCompare
]
