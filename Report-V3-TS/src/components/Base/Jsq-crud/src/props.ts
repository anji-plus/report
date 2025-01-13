/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 13:15:19
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 20:09:32
 */
import type { PropType } from 'vue'
import { JsqTreeProps } from '@/components/Base/Jsq-tree'
import { FormProps } from './components/Jsq-searchForm';
import { ApiProps } from './types'

export const basicProps = {
  // 是否自动加载 (可手动调用toQuery方法)
  autoLoad: {
    type: Boolean,
    default: true,
  },
  treeOptions: {
    type: Object as PropType<JsqTreeProps>
  },
  searchFormOption: {
    type: Object as PropType<FormProps>
  },
  tableButtonsOptions: {
    type: Object
  },
  dialogRecordingData: {
    type: Object
  },
  tableOptions: {
    type: Object
  },
  apiOptions: {
    type: Object as PropType<ApiProps>
  }
};
