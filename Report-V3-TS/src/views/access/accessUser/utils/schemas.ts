/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-11 21:37:45
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
        label: '启用状态',
        component: 'JsqSelect',
        field: 'enableFlag',
        componentProps: {
          dictCode: 'ENABLE_FLAG',
          defaultValue: 1
        },
      },
      {
        label: '登录名',
        field: 'loginName',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入登录名',
        },
      },
      {
        label: '真实姓名',
        component: 'NInput',
        field: 'realName',
        componentProps: {
          placeholder: '请输入真实姓名',
        },
      },
      {
        label: '手机号',
        field: 'phone',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入手机号',
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
      label: '登录名',
      field: 'loginName',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "登录名必填", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '真实姓名',
      field: 'realName',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "真实姓名必填", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '手机号码',
      field: 'phone',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { min: 1, max: 16, message: "不超过16个字符", trigger: "blur" }
      ],
    },
    {
      label: '用户邮箱',
      field: 'email',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '备注',
      field: 'remark',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { min: 1, max: 512, message: "不超过512个字符", trigger: "blur" }
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
      label: '最后一次登陆时间',
      field: 'lastLoginTime',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    },
    {
      label: '最后一次登录IP',
      field: 'lastLoginIp',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
        disabled: true
      },
      editHide: editFormShow.HIDE_ON_ADD,
    }
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
      },
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
      title: '真实姓名',
      key: 'realName', // 表格展示字段
      align: 'center',
    },
    {
      title: '手机号码',
      key: 'phone',
      align: 'center',
    },
    {
      title: '用户邮箱',
      key: 'email',
      align: 'center'
    },
    {
      title: '备注',
      key: 'remark',
      align: 'center',
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
      title: '最后一次登陆时间',
      key: 'lastLoginTime',
      align: 'center',
    },
    {
      title: '最后一次登录IP',
      key: 'lastLoginIp',
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
