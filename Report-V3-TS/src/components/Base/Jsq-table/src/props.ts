import { tableProps } from 'naive-ui';

export const basicProps = {
  ...tableProps,
  data: {
    type: Array,
    default: []
  },
  columns: {
    type: Array,
    default: []
  }
}

