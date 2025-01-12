/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 21:56:52
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import JsqTableAction from '@/components/Base/Jsq-crud/src/components/Jsq-tableActiion.vue';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '字典名称',
        field: 'dictName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入字典名称',
        },
      },
      {
        label: '字典编码',
        field: 'dictCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入字典编码',
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
export const getTableButtons = ({ toDictRefresh, addClick, removeAll }) => {
  const rowsButtons = computed(() => {
    return [
      {
        label: '刷新字典项',
        type: '',
        click: ({ selectSections }) => {
          toDictRefresh(selectSections)
        }
      },
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

// 新增表单数据
export const getDialogRecordingSchemas = () => {
  const schemas = [
    {
      label: '字典名称',
      field: 'dictName',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "字典名称不能为空", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '字典编码',
      field: 'dictCode',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "字典编码不能为空", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '描述',
      field: 'remark',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
  ]

  return schemas
}

// 表格
export const getTableColumns = ({ updateClick, removeSingle, toDictItem, toDictRefresh }) => {
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
      title: '字典名称',
      key: 'dictName', // 表格展示字段
      align: 'center',
    },
    {
      title: '字典编码',
      key: 'dictCode',
      align: 'center',
    },
    {
      title: '描述',
      key: 'remark',
      align: 'center'
    },
    {
      title: '创建时间',
      key: 'createTime',
      align: 'center',
    },
    {
      title: '创建人',
      key: 'createBy',
      align: 'center',
    },
    {
      title: '更新时间',
      key: 'updateTime',
      align: 'center',
    },
    {
      title: '更新人',
      key: 'updateBy',
      align: 'center',
    },
    {
      title: '操作',
      key: 'actions',
      align: 'center',
      width: "220px",
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
              label: '编辑字典项',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toDictItem(row)
              }
            },
            {
              label: '刷新字典项',
              type: '',
              onClick: () => {
                toDictRefresh(row)
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
