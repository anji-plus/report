/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-11 20:18:56
 */
import { selectProps } from 'naive-ui';

export const basicProps = {
  ...selectProps,
  labelField: {
    type: String,
    default: 'text',
  },
  valueField: {
    type: String,
    default: 'id',
  },
  clearable: {
    type: Boolean,
    default: true,
  },
  size: {
    type: String,
    default: 'small'
  },
};
