/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-10 16:47:20
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton, NTag } from 'naive-ui'
import { editFormShow, enable } from '@/enums/common'
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

// 新增表单数据
export const getDialogRecordingSchemas = () => {
  const schemas = [
    {
      label: '菜单代码',
      field: 'target',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "目标菜单必填", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '菜单名称',
      field: 'targetName',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "目标菜单名称必填", trigger: "blur" },
        { min: 1, max: 128, message: "不超过128个字符", trigger: "blur" }
      ],
    },
    {
      label: '按钮代码',
      field: 'action',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "目标必填", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '按钮名称',
      field: 'actionName',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "目标按钮名称必填", trigger: "blur" },
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
        { required: true, message: "启用状态必填", trigger: ['blur', 'change'] }
      ],
    },
    {
      label: '排序',
      field: "sort",
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [],
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
export const getTableColumns = ({ updateClick, removeSingle }) => {
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
      title: '菜单代码',
      key: 'target', // 表格展示字段
      align: 'center',
    },
    {
      title: '菜单名称',
      key: 'targetName',
      align: 'center',
    },
    {
      title: '按钮代码',
      key: 'action',
      align: 'center'
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
      render(row) {
        console.log('11', row)
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
      title: '排序',
      key: 'sort',
      align: 'center',
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
