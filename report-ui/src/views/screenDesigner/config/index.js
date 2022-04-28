import {converArr} from '../util/common'
import { widgetTool } from "./configs"

export const widgetTools =  converArr([...widgetTool])

export const getToolByCode = (code) => {
  return [...widgetTool].find((item) => {
    return item.code == code
  })
}
