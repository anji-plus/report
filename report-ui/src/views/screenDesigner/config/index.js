/*
 * @Descripttion: 
 * @version: 
 * @Author: qianlishi
 * @Date: 2022-03-14 14:05:15
 * @LastEditors: qianlishi
 * @LastEditTime: 2022-06-17 17:24:33
 */
import {converArr} from '../util/common'
import { widgetTool } from "./configs"

export const widgetTools =  converArr([...widgetTool])

export const getToolByCode = (code) => {
  return [...widgetTool].find((item) => {
    return item.code == code
  })
}
