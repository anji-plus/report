/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 00:00:55
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NTag } from 'naive-ui'
import { editFormShow, enable } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import JsqTableAction from '@/components/Base/Jsq-crud/src/components/Jsq-tableActiion.vue';
// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '角色编码',
        field: 'roleCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入角色编码',
        },
      },
      {
        label: '角色名称',
        field: 'roleName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入角色名称',
        },
      },
      {
        label: '启用状态',
        component: 'JsqSelect',
        field: 'enableFlag',
        componentProps: {
          dictCode: 'ENABLE_FLAG',
          defaultValue: 1
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

// 新增表单数据
export const getDialogRecordingSchemas = () => {
  const schemas = [
    {
      label: '角色编码',
      field: 'roleCode',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "角色编码必填", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '角色名称',
      field: 'roleName',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "角色名称必填", trigger: "blur" },
        { min: 1, max: 128, message: "不超过128个字符", trigger: "blur" }
      ],
    },
    {
      label: '启用状态',
      field: "enableFlag",
      component: 'JsqSelect',
      componentProps: {  // 组件配置
        placeholder: '',
        dictCode: 'ENABLE_FLAG',
      },
      rules: [
        { required: true, type: 'number', message: "启用状态必填", trigger: ['blur', 'change'] }
      ],
    },
    {
      label: '创建人',
      field: 'createBy',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    },
    {
      label: '创建时间',
      field: 'createTime',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    },
    {
      label: '修改人',
      field: 'updateBy',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    },
    {
      label: '修改时间',
      field: 'updateTime',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    },
  ]

  return schemas
}

// 表格
export const getTableColumns = ({ updateClick, removeSingle, toSetPermission }) => {
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
      title: '角色名称',
      key: 'roleName', // 表格展示字段
      align: 'center',
      render(row) {
        return `${row["roleName"]}[${row["roleCode"]}]`
      }
    },
    {
      title: '启用状态',
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
      title: '创建人',
      key: 'createBy',
      align: 'center'
    },
    {
      title: '创建时间',
      key: 'createTime',
      align: 'center',
    },
    {
      title: '修改人',
      key: 'updateBy',
      align: 'center',
    },
    {
      title: '修改时间',
      key: 'updateTime',
      align: 'center',
    },
    {
      title: '操作',
      key: 'actions',
      align: 'center',
      width: "120px",
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
              label: '分配权限',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toSetPermission(row)
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
