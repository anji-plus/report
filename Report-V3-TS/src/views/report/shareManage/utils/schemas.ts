/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-13 20:27:11
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import { getDictLabelByCode } from '@/utils';
import JsqTableAction from '@/components/Base/Jsq-crud/src/components/Jsq-tableActiion.vue';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '分享编码',
        field: 'shareCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入分享编码',
        },
      },
      {
        label: '报表编码',
        field: 'reportCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入报表编码',
        },
      },
      {
        label: '报表名称',
        field: 'reportName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入报表名称',
        },
      },
      {
        label: '分享类型',
        field: 'shareValidType',
        component: 'JsqSelect',
        componentProps: {
          dictCode: "SHARE_VAILD"
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
export const getTableButtons = ({ removeAll }) => {
  const rowsButtons = computed(() => {
    return [
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
  return { rowsButtons }
}

// 表格
export const getTableColumns = ({ toCopyUrl, toShareDelay, removeSingle }) => {
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
      title: '报表编码',
      key: 'reportCode', // 表格展示字段
      align: 'center',
    },
    {
      title: '报表名称',
      key: 'reportName',
      align: 'center',
    },
    {
      title: '分享编码',
      key: 'shareCode',
      align: 'center'
    },
    {
      title: '分享类型',
      key: 'shareValidType',
      align: 'center',
      render(row) {
        return getDictLabelByCode("SHARE_VAILD", row["shareValidType"]);
      }
    },
    {
      title: '分享过期时间',
      key: 'shareValidTime',
      align: 'center',
    },
    {
      title: '分享url',
      key: 'shareUrl',
      align: 'center',
      ellipsis: {
        tooltip: true
      }
    },
    {
      title: '分享码',
      key: 'sharePassword',
      align: 'center',
    },
    {
      title: '操作',
      key: 'actions',
      align: 'center',
      width: "160px",
      editHide: true,
      render(row) {
        return h(JsqTableAction as any, {
          actions: [
            {
              label: '复制url',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toCopyUrl(row)
              }
            },
            {
              label: '延期1天',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toShareDelay(row, 1)
              }
            },
            {
              label: '延期1周',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toShareDelay(row, 7)
              }
            },
            {
              label: '延期1月',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toShareDelay(row, 30)
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
