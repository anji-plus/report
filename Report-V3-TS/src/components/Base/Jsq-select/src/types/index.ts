import type { SelectProps } from 'naive-ui/lib/select';

type options = {
  [key: string]: string | number;
};

export type JsqSelectProps = {
  api?: () => Promise<any>; // api接口
  dictCode?: String; // 数字字典
  localOptions?: options[]; // 静态数据
};

// 对外暴露的方法
export interface selectActionType {
  setProps: (JsqSelectProps: Partial<SelectProps>) => Promise<void>;
}

export type selectRegisterFn = (treeInstance: selectActionType) => void;

export type UseSelectReturnType = [selectRegisterFn, selectActionType];
