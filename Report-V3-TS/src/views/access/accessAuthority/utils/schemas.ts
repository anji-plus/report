/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-05 01:40:39
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
    keyField: 'id',
    labelField: 'label',
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
          defaultValue: 1
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
export const getTableButtons = ({ addClick, removeAll }) => {
  const rowsButtons = computed(() => {
    return [
      {
        label: '新增',
        type: '',
        permission: 'asd', // 权限嘛
        plain: true,
        click: () => {
          addClick()
        }
      },
      {
        label: '删除',
        type: 'warning',
        permission: '', // 权限嘛
        plain: true,
        click: () => {
          removeAll()
        }
      }
    ]
  })
  return {rowsButtons}
}

// 表格
export const getTableColumns = ({ updateClick, removeSingle }) => {
  const columns = computed(() => {
    return [
      {
        type: 'selection',
        align: 'center'
      },
      {
        type: 'expand',
        width: '40px',
        align: 'center',
        renderExpand: (rowData) => {
          const { createBy, createTime, updateBy, updateTime } = rowData
          return `
            创建人： ${createBy}
            创建时间：${createTime}
            修改人：${updateBy}
            修改时间：${updateTime}
          `
        }
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
        title: '菜单代码',
        key: 'target', // 字段名称
        align: 'center',
        editKey: 'target', // 编辑展示的字段
        tableHide: true, // 表格不显示
        inputType: "input", // 表单类型
        editHide: true, // 编辑不显示
        rules: [
          { required: true, message: "目标菜单必填", trigger: "blur" },
          { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
        ],
        disabled: false
      },
      {
        title: '菜单名称',
        key: 'targetName',
        align: 'center', 
      },
      {
        title: '按钮名称',
        key: 'actionName',
        align: 'center',
      },
      {
        title: '启用状态',
        key: 'enableFlag',
        align: 'center',
      },
      {
        title: '排序',
        key: 'sort',
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
                onClick: () => {
                  updateClick(row)
                }
              },
              { default: () => '编辑' }
            ),
            h(
              NButton,
              {
                size: 'small',
                quaternary: true,
                'v-permission': 'asd',
                type:"primary",
                onClick: () => {
                  removeSingle(row)
                }
              },
              { default: () => '删除' }
            )
          ]
        }
      }
    ];
  });
  return { columns };
};
