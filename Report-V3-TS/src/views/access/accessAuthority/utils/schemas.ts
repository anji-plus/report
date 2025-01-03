import { computed } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { FormSchema } from '@/components/Base/Jsq-crud/components/Jsq-searchForm';
import { getAuthorityTree } from '@/api/access/accessAuthority';

// tree配置
export const treeOptions = () => {
  return {
    api: getAuthorityTree,
    'key-field': 'id',
    'label-field': 'label',
  }
}

// 表单配置
export const formSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '启用状态',
        component: 'JsqSelect',
        field: 'enableFlag',
        componentProps: {
          dictCode: 'ENABLE_FLAG',
        },
      },
      {
        label: '菜单名称',
        field: 'targetName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入菜单名称',
        },
      },
      {
        label: '按钮代码',
        component: 'NInput',
        field: 'action',
        componentProps: {
          placeholder: '请输入按钮代码',
        },
      },
      {
        label: '按钮名称',
        field: 'actionName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入按钮名称',
        },
      },
    ].map((item: any) => {
      const tempObj = cloneDeep(item);
      for (const key in params) {
        if (tempObj.field == key) {
          for (const n in params[key]) {
            if (isObject(params[key][n])) {
              tempObj[n] = { ...params[key][n], ...tempObj[n] };
            } else {
              tempObj[n] = params[key][n];
            }
          }
        }
      }
      return tempObj;
    });
    return formItems;
  });
  return schemas;
};

