/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-30 18:16:00
 * @LastEditors: qianlishi
 * @LastEditTime: 2024-12-30 20:55:07
 */
import type { PropType } from 'vue';
import { FormSchema } from './types/searchForm';
import { formProps } from 'naive-ui';

export const basicProps = {
  ...formProps,
  // 表单配置规则
  schemas: {
    type: [Array] as PropType<FormSchema[]>,
    default: () => [],
  },
};
