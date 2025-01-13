/*
 * @Description: 
 * @Author: qianlishi
 * @Date: 2025-01-03 01:01:14
 * @LastEditors: qianlishi
 * @LastEditTime: 2025-01-12 22:23:35
 */
import { computed, h } from 'vue';
import { cloneDeep } from 'lodash-es';
import { isObject } from '@/utils/is';
import { NImage } from 'naive-ui'
import { editFormShow } from '@/enums/common'
import { FormSchema } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import JsqTableAction from '@/components/Base/Jsq-crud/src/components/Jsq-tableActiion.vue';

// 表单配置
export const getFormSchemas = ({ params }: Record<string, any>) => {
  const schemas = computed<FormSchema[]>(() => {
    const formItems: FormSchema[] = [
      {
        label: '文件路径',
        field: 'filePath',
        component: 'NInput',
        componentProps: {
          placeholder: '请输入文件路径',
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
        slotName: 'tabBtn-fileUpload'
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
        { required: true, type: 'number', message: "启用状态必填", trigger: ['blur', 'change'] }
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
export const getTableColumns = ({ removeSingle, toCopyUrl, toDownLoad }) => {
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
        const { createBy, createTime } = rowData
        return `
          创建人： ${createBy}
          创建时间：${createTime}
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
      title: '图片缩略图',
      key: 'urlPath', // 表格展示字段
      align: 'center',
      render(row) {
        return h(NImage, {
          height: 48,
          src: row.urlPath,
        });
      },
      ellipsis: {
        tooltip: true
      }
    },
    {
      title: '文件类型',
      key: 'fileType',
      align: 'center',
    },
    {
      title: '文件路径',
      key: 'filePath',
      align: 'center',
      ellipsis: {
        tooltip: true
      }
    },
    {
      title: 'url路径',
      key: 'urlPath',
      align: 'center',
      ellipsis: {
        tooltip: true
      }
    },
    {
      title: '内容说明',
      key: 'fileInstruction',
      align: 'center',
      ellipsis: {
        tooltip: true
      }
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
              label: '下载',
              quaternary: true,
              type:"primary",
              onClick: () => {
                toDownLoad(row)
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
