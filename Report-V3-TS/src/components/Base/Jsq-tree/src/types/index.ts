import type { TreeProps } from 'naive-ui/lib/tree';
export type JsqTreeProps = {
  api?: () => Promise<any>; // api接口
};

// 对外暴露的方法
export interface TreeActionType {
  setProps: (treeProps: Partial<TreeProps>) => Promise<void>;
  loadData: (params: any) => Promise<void>;
}

export type TreeRegisterFn = (treeInstance: TreeActionType) => void

export type UseTreeReturnType = [TreeRegisterFn, TreeActionType]
