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
import { editFormShow, enable } from '@/enums/common'
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
