import { FormProps } from '../components/Jsq-searchForm';
import { JsqTreeProps } from '@/components/Base/Jsq-tree'

export type serachFormProps = {
  [key: string]: any
} 

export type ApiProps = {
  queryApi?: (params: any) => Promise<void>; // 查询表格
  addApi?: (params: any) => Promise<void>; // 新增表格
  removeApi?: (params: any) => Promise<void>; // 删除表格
  updateApi?: (params: any) => Promise<void>; // 更改表格
  getDataByIdApi?: (params: any) => Promise<void>; // 详情页查询
}

// crud配置项
export type CurdProps = {
  treeOptions: JsqTreeProps; // tree配置
  searchFormOption: FormProps; // 搜索表单配置项
  tableButtonsOptions: any; // 批量操作按钮
  dialogRecordingData: any; // 新增编辑查看弹框配置
  tableOptions: any; // 表格配置项
  apiOptions: ApiProps
};

export interface CrudActionType {
  setProps: (curdProps: Partial<CurdProps>) => Promise<void>;
  toAdd: (row?: any) => void
  toUpdate: (row: any) => void
  toRemoveAll: (row?: any) => void
  toRemove: (row?: any) => void
}

export type crudRegisterFn = (treeInstance: CrudActionType) => void;

export type UseCrudReturnType = [crudRegisterFn, CrudActionType];
