/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-10 17:20:47
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NButton, NTag } from 'naive-ui'
import { enable } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import { getDictLabelByCode } from '@/utils'
import { useRoute } from 'vue-router';


// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const route = useRoute();
  const { query } = route
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '字典编码',
        field: 'dictCode',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入字典编码',
          defaultValue: query.dictCode,
          disabled: true
        },
      },
      {
        label: '显示文字',
        field: 'itemLabel',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入显示文字',
        },
      },
      {
        label: '提交值',
        field: 'itemValue',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入提交值',
        },
      },
      {
        label: '备注',
        field: 'remark',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入备注',
        },
      },
      {
        label: '语言标识',
        field: 'locale',
        component: 'JsqSelect',
        componentProps: {
          dictCode: "LOCALE"
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
      label: '字典编码',
      field: 'dictCode',
      component: "NInput", // 表单类型
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "字典编码不能为空", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '字典项名称',
      field: 'itemName',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        {
          required: true,
          message: "字典项名称不能为空",
          trigger: "blur"
        },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '提交值',
      field: 'itemValue',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [
        { required: true, message: "提交值不能为空", trigger: "blur" },
        { min: 1, max: 64, message: "不超过64个字符", trigger: "blur" }
      ],
    },
    {
      label: '语言标识',
      field: 'locale',
      component: 'JsqSelect',
      componentProps: {  // 组件配置
        dictCode: "LOCALE"
      },
      rules: [
        { required: true, message: "语言标识不能为空", trigger: "blur" }
      ],
    },
    {
      label: '状态',
      field: 'enabled',
      component: 'JsqSelect',
      componentProps: {  // 组件配置
        dictCode: "ENABLE_FLAG"
      },
      rules: [
        { required: true, message: "状态不能为空", trigger: "blur" }
      ],
    },
    {
      label: '排序',
      field: 'sort',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [],
    },
    {
      label: '描述',
      field: 'remark',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [],
    },
    {
      label: '扩展项',
      field: 'itemExtend',
      component: 'NInput',
      componentProps: {  // 组件配置
        placeholder: '',
      },
      rules: [],
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
      title: '字典编码',
      key: 'dictCode',
      align: 'center',
    },
    {
      title: '字典项名称',
      key: 'itemName', // 表格展示字段
      align: 'center',
    },
    {
      title: '提交值',
      key: 'itemValue',
      align: 'center'
    },
    {
      title: '语言标识',
      key: 'locale',
      align: 'center',
      render(row) {
        return getDictLabelByCode("LOCALE", row["locale"]);
      }
    },
    {
      title: '状态',
      key: 'enabled',
      align: 'center',
      render(row) {
        return h(
          NTag,
          {
            style: {
              marginRight: '6px'
            },
            type: row.enabled ? 'success' : 'error',
            bordered: false
          },
          {
            default: () => enable[row.enabled]
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
      title: '创建人',
      key: 'updateBy',
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
