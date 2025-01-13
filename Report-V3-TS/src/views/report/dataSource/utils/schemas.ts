/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-11 21:38:32
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton, NTag } from 'naive-ui'
import { enable } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '数据源编码',
        field: 'sourceCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入数据源编码',
        },
      },
      {
        label: '数据源名称',
        field: 'sourceName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入数据源名称',
        },
      },
      {
        label: '数据源类型',
        component: 'JsqSelect',
        field: 'enableFlag',
        componentProps: {
          dictCode: 'SOURCE_TYPE'
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
  const columns= [
    {
      type: 'selection',
      align: 'center',
    },
    {
      title: '序号',
      width: '60px',
      align: 'center',
      key: 'key',
      render: (_, index) => {
        return `${index + 1}`
      },
    },
    {
      title: '数据源编码',
      key: 'sourceCode', // 表格展示字段
      align: 'center',
    },
    {
      title: '数据源名称',
      key: 'sourceName',
      align: 'center',
    },
    {
      title: '数据源描述',
      key: 'sourceDesc',
      align: 'center'
    },
    {
      title: '数据源类型',
      key: 'sourceType',
      align: 'center',
    },
    {
      title: '状态',
      key: 'enableFlag',
      align: 'center',
      render(row) {
        return h(
          NTag,
          {
            style: {
              marginRight: '6px'
            },
            type: row.enableFlag ? 'success' : 'error',
            bordered: false
          },
          {
            default: () => enable[row.enableFlag]
          }
        )
      }
    },
    {
      title: '操作',
      key: 'actions',
      align: 'center',
      width: "120px",
      editHide: true,
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
  return { columns };
};
