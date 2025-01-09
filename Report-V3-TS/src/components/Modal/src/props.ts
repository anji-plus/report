import { modalProps } from 'naive-ui';

export const basicProps = {
  ...modalProps,
  subBtnText: {
    type: String,
    default: '确认',
  },
  cancelBtnText: {
    type: String,
    default: '取消',
  },
  showIcon: {
    type: Boolean,
    default: false,
  },
  width: {
    type: Number,
    default: 446,
  },
  title: {
    type: String,
    default: '',
  },
  maskClosable: {
    type: Boolean,
    default: false,
  },
  preset: {
    type: String,
    default: 'dialog',
  },
  isDraggable: {
    type: Boolean,
    default: true,
  },
  // 只支持直接绑定在 basicModal 组件上
  showAction: {
    type: Boolean,
    default: true,
  },
};
