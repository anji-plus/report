import { ref, unref, nextTick, onUnmounted, watch } from 'vue';
import type { SelectProps } from 'naive-ui/lib/select';
import { getDynamicProps } from '@/utils';
import { isProdMode } from '@/utils/env';
import { JsqSelectProps, UseSelectReturnType, selectActionType } from '../types';
import type { DynamicProps } from '/#/utils';

type props = Partial<DynamicProps<JsqSelectProps>>;
export const useSelect = (props?: props): UseSelectReturnType => {
  const selectRef = ref<Nullable<selectActionType>>(null);

  const getSelect = async () => {
    const select = unref(selectRef);
    if (!select) {
      console.error('tree节点尚未获取');
    }
    await nextTick();
    return select as selectActionType;
  };

  const register = (instance: selectActionType) => {
    isProdMode() &&
      onUnmounted(() => {
        selectRef.value = null;
      });
    if (unref(selectRef) && isProdMode() && instance === unref(selectRef)) return;

    selectRef.value = instance;

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

  const methods: selectActionType = {
    setProps: async (selectProps: Partial<SelectProps>) => {
      const select = await getSelect();
      await select.setProps(selectProps);
    },
  };

  return [register, methods];
};
