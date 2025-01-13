/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-11 21:40:04
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton, NTag } from 'naive-ui'
import { enable } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import { getReportData } from '@/api/report/resultSet'
import JsqTableAction from '@/components/Base/Jsq-crud/src/components/Jsq-tableActiion.vue';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '数据集编码',
        field: 'setCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入数据源编码',
        },
      },
      {
        label: '数据集名称',
        field: 'setName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入数据源名称',
        },
      },
      {
        label: '数据源',
        component: 'JsqSelect',
        field: 'enableFlag',
        componentProps: {
          api: getReportData,
          labelField: "sourceName",
          valueField: "sourceCode",
        },
      },
      {
        label: '数据集类型',
        component: 'JsqSelect',
        field: 'setType',
        componentProps: {
          dictCode: "SET_TYPE"
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
export const getTableColumns = ({ updateClick, removeSingle, toLookData, toCopy }) => {
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
      key: 'setCode', // 表格展示字段
      align: 'center',
    },
    {
      title: '数据集名称',
      key: 'setName',
      align: 'center',
    },
    {
      title: '描述',
      key: 'setDesc',
      align: 'center'
    },
    {
      title: '数据源编码',
      key: 'sourceCode',
      align: 'center',
    },
    {
      title: '数据集类型',
      key: 'setType',
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
      width: "140px",
      editHide: true,
      render(row) {
        return h(JsqTableAction as any, {
          actions: [
            {
              label: '编辑',
              quaternary: true,
              type:"primary",
              onClick: () => {
                updateClick(row)
              }
            },
            {
              label: '数据预览',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toLookData(row)
              }
            },
            {
              label: '复制',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toCopy(row)
              }
            },
            {
              label: '删除',
              quaternary: true,
              type:"primary",
              onClick: () => {
                removeSingle(row)
              }
            },
          ],
          // select: (key) => {
          //   window['$message'].info(`您点击了，${key} 按钮`);
          // },
        })
      }
    }
  ];
  return { columns };
};
