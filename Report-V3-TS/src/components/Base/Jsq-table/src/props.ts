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
  },
  singleLine: { // 表格线
    type: Boolean,
    default: false
  },
  maxHeight: {
    type: Number,
    default: 300
  },
  // 分页配置
  displayOrder: { // 分页顺序
    type: Array,
    default: ['pages', 'quick-jumper', 'size-picker']
  },
  pageSizes: { // 分页条数
    type: Array,
    default: [10, 50, 100, 200, 500]
  },
  showQuickJumper: { // 是否显示快速跳转
    type: Boolean,
    default: true
  },
  showSizePicker: { // 是否显示每页条数的选择器
    type: Boolean,
    default: true
  }
}

