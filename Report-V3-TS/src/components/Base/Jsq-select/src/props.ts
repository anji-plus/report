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
};
