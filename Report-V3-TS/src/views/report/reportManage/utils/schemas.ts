/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-10 15:35:28
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton } from 'naive-ui'
import { editFormShow } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '报表类型',
        field: 'reportType',
        component: 'JsqSelect',
        componentProps: {
          dictCode: "REPORT_TYPE"
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
        label: '报表编码',
        field: 'reportCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入报表编码',
        },
      },
      {
        label: '制作人',
        field: 'reportAuthor',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入制作人',
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
      label: '报表名称',
      field: 'reportName',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "请输入报表名称", trigger: "blur" },
        { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" }
      ],
    },
    {
      label: '报表编码',
      field: 'reportCode',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "请输入报表编码", trigger: "blur" },
        { min: 1, max: 100, message: "不超过100个字符", trigger: "blur" },
      ],
    },
    {
      label: '报表类型',
      field: "reportType",
      component: 'JsqSelect',
      componentProps: {  // 组件配置
        placeholder: '',
        dictCode: 'REPORT_TYPE',
      },
      rules: [
        { required: true, message: "请输入报表类型", trigger: "blur" },
        { min: 1, max: 20, message: "不超过20个字符", trigger: "blur" }
      ],
    },
    {
      label: '制作人',
      field: 'reportDesc',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
      },
    },
    {
      label: '描述',
      field: 'createTime',
      component: "NInput",
      componentProps: {  // 组件配置
        placeholder: '',
      },
    },
    {
      label: '状态',
      field: 'enableFlag',
      component: "JsqSelect",
      componentProps: {  // 组件配置
        dictCode: "ENABLE_FLAG"
      },
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
      title: '报表名称',
      key: 'reportName', // 表格展示字段
      align: 'center',
    },
    {
      title: '报表编码',
      key: 'reportCode',
      align: 'center',
    },
    {
      title: '报表类型',
      key: 'reportType',
      align: 'center'
    },
    {
      title: '制作人',
      key: 'reportAuthor',
      align: 'center',
    },
    {
      title: '描述',
      key: 'reportDesc',
      align: 'center',
    },
    {
      title: '状态',
      key: 'enableFlag',
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
