import { ref, unref, nextTick, onUnmounted, watch } from 'vue';
import { getDynamicProps } from '@/utils';
import { isProdMode } from '@/utils/env';
import type { JsqTreeProps, TreeActionType, UseTreeReturnType } from '../types/index';
import type { DynamicProps } from '/#/utils';
import type { TreeProps } from 'naive-ui/lib/tree';

type Props = Partial<DynamicProps<JsqTreeProps>>;
export const useTree = (props?: Props): UseTreeReturnType => {
  const treeRef = ref<Nullable<TreeActionType>>(null);

  const getTree = async () => {
    const tree = unref(treeRef);
    if (!tree) {
      console.error('tree节点尚未获取');
    }
    await nextTick();
    return tree as TreeActionType;
  };

  const register = (instance: TreeActionType) => {
    isProdMode() &&
      onUnmounted(() => {
        treeRef.value = null;
      });
    if (unref(treeRef) && isProdMode() && instance === unref(treeRef)) return;

    treeRef.value = instance;

    watch(
      () => props,
      () => {
        props && instance.setProps(getDynamicProps(props));
      },
      {
        immediate: true,
        deep: true,
      },
    );
  };

  const methods: TreeActionType = {
    setProps: async (treeProps: Partial<TreeProps>) => {
      const tree = await getTree();
      await tree.setProps(treeProps);
    },
    loadData: async (params) => {
      const tree = await getTree();
      await tree.loadData(params);
    },
  };

  return [register, methods];
};
