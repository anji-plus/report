/**
 *  文本栏：{type: 'text',tabName: '文本栏'}
 *  柱状图：{type: 'barChart',tabName: '柱状图'}
 * **/ 

import {widgetHref} from "./texts/widget-href"
import {widgetIframe} from "./texts/widget-iframe"
import {widgetImage} from "./texts/widget-image"
import {widgetMarquee} from "./texts/widget-marquee"
import {widgetSliders} from "./texts/widget-slider"
import {widgetTable} from "./texts/widget-table"
import {widgetText} from "./texts/widget-text"
import { widgetTime } from "./texts/widget-time"
import {widgetVideo} from "./texts/widget-video"
import {widgetBarchart} from './barCharts/widget-barchart'



export const widgetTool = [
    widgetHref,
    widgetIframe,
    widgetImage,
    widgetMarquee,
    // widgetSliders,
    widgetTable,
    widgetText,
    widgetTime,
    widgetVideo,
    widgetBarchart
]
