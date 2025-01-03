import { ComponentType } from './index';
// 动态表单schemas类型
export interface FormSchema {
  label: string; // 表单文本
  field: string; // 表单字段
  component: ComponentType; // 表单类型
  componentProps?: Object;
}

// 动态表单hooks参数类型
export interface FormProps {
  schemas?: FormSchema[];
}

export interface FormActionType {
  setProps: (formProps: Partial<FormProps>) => Promise<void>;
  setSchema: (schemaProps: Partial<FormSchema[]>) => Promise<void>;
}

export type RegisterFn = (fromInstance: FormActionType) => void;

export type UseFormReturnType = [RegisterFn, FormActionType];
