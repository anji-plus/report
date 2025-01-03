/*
 * @Description:
 * @Author: qianlishi
 * @Date: 2024-12-30 20:45:42
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-03 00:59:59
 */
import { ref, unref, nextTick, onUnmounted, watch } from 'vue';
import { FormProps, FormActionType, UseFormReturnType } from '../types/searchForm';
import type { DynamicProps } from '/#/utils';
import { isProdMode } from '@/utils/env';
import { getDynamicProps } from '@/utils';

type Props = Partial<DynamicProps<FormProps>>;
export const useJsqSearchForm = (props: Props): UseFormReturnType => {
  const searchFormRef = ref<Nullable<FormActionType>>(null);

  const getForm = async () => {
    const form = unref(searchFormRef);
    if (!form) {
      console.error('节点尚未挂载错误');
    }
    await nextTick();
    return form as FormActionType;
  };

  const register = (instance) => {
    isProdMode() &&
      onUnmounted(() => {
        searchFormRef.value = null;
      });
    if (unref(searchFormRef) && isProdMode() && instance === unref(searchFormRef)) return;
    searchFormRef.value = instance;

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

  const methods = {
    setProps: async (formProps: Partial<FormProps>) => {
      const form = await getForm();
      await form.setProps(formProps);
    },
    setSchema: async (values) => {
      const form = await getForm();
      form.setSchema(values);
    },
  };

  return [register, methods];
};
