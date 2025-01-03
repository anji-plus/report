/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2025-01-03 13:57:12
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-03 15:40:12
 */
import { ref, unref, nextTick, onUnmounted, watch } from 'vue';
import { getDynamicProps } from '@/utils';
import { isProdMode } from '@/utils/env';
import { CurdProps, CrudActionType, UseCrudReturnType } from '../types';
import type { DynamicProps } from '/#/utils';

type props = Partial<DynamicProps<CurdProps>>;
export const useCrud = (props?: props): UseCrudReturnType => {
  const crudRef = ref<Nullable<CrudActionType>>(null);

  const getCurd = async () => {
    const crud = unref(crudRef);
    if (!crud) {
      console.error('crud节点尚未获取');
    }
    await nextTick();
    return crud as CrudActionType;
  };

  const register = (instance: CrudActionType) => {
    isProdMode() &&
      onUnmounted(() => {
        crudRef.value = null;
      });
    if (unref(crudRef) && isProdMode() && instance === unref(crudRef)) return;

    crudRef.value = instance;

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

  const methods: CrudActionType = {
    setProps: async (crudProps: any) => {
      const crud = await getCurd();
      await crud.setProps(crudProps);
    },
  };

  return [register, methods];
};
