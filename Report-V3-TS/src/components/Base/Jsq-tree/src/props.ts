import { treeProps } from 'naive-ui';
export const basicProps = {
  ...treeProps,
  inputShow: {
    type: Boolean,
    default: true
  },
  treeTitle: {
    type: String,
    default: '所属菜单',
  },
};
