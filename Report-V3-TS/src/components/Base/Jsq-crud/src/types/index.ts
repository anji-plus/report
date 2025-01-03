import { FormProps } from '../../components/Jsq-searchForm';
import { JsqTreeProps } from '@/components/Base/Jsq-tree'

// crud配置项
export type CurdProps = {
  treeOptions: JsqTreeProps; // tree配置
  searchFormOption: FormProps; // 搜索表单配置项
  tableButtons: any; // 批量操作按钮
  rowButtons: any; // 行操作按钮
  tableOptions: any; // 表格配置项
  queryApi: () => Promise<void>; // 查询表格
  addApi: () => Promise<void>; // 新增表格
  removeApi: () => Promise<void>; // 删除表格
  updateApi: () => Promise<void>; // 更改表格
  getDataByIdApi: () => Promise<void>; // 详情页查询
};

export interface CrudActionType {
  setProps: (curdProps: Partial<CurdProps>) => Promise<void>;
}

export type crudRegisterFn = (treeInstance: CrudActionType) => void;

export type UseCrudReturnType = [crudRegisterFn, CrudActionType];
