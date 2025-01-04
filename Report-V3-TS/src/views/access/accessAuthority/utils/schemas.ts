/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-04 18:17:52
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton } from 'naive-ui'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import { getAuthorityTree } from '@/api/access/accessAuthority';

// tree配置
export const getTreeOptions = () => {
  return {
    api: getAuthorityTree,
    field: "target",
    'key-field': 'id',
    'label-field': 'label',
  }
}

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
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


// 批量操作
export const getTableButtons = () => {
  return computed(() => {
    return [
      {
        label: '新增',
        type: '',
        permission: '', // 权限嘛
        plain: true,
        click: () => {
          console.log(11)
        }
      },
      {
        label: '删除',
        type: 'warning',
        permission: '', // 权限嘛
        plain: true,
        click: () => {}
      }
    ]
  })
}

// 表格
export const getTableColumns = () => {
  const columns = computed(() => {
    return [
      {
        type: 'selection',
        align: 'center'
      },
      {
        title: '序号',
        width: '60px',
        align: 'center',
        key: 'key',
        render: (_, index) => {
          return `${index + 1}`
        }
      },
      {
        type: 'expand',
        width: '40px',
        align: 'center',
        renderExpand: (rowData) => {
          return `${rowData.name} is a good guy.`
        }
      },
      {
        title: '菜单名称',
        key: 'checkInOrderNo',
        align: 'center',
      },
      {
        title: '按钮名称',
        key: 'roomNo',
        align: 'center',
      },
      {
        title: '启用状态',
        key: 'roomTypeName',
        align: 'center',
      },
      {
        title: '排序',
        key: 'customerTypeName',
        align: 'center',
      },
      {
        title: '操作',
        key: 'actions',
        align: 'center',
        width: "120px",
        render(row) {
          return [
            h(
              NButton,
              {
                size: 'small',
                quaternary: true,
                type:"primary",
                onClick: () => {}
              },
              { default: () => '编辑' }
            ),
            h(
              NButton,
              {
                size: 'small',
                quaternary: true,
                type:"primary",
                onClick: () => {}
              },
              { default: () => '删除' }
            )
          ]
        }
      }
    ];
  });
  return columns;
};
