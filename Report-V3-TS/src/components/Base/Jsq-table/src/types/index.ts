import { ComponentType } from '@/components/Base/Jsq-crud/src/components/Jsq-searchForm';
import { DataTableColumns } from 'naive-ui';

type isTableAndEditShow = Boolean | 'hideOnAdd' | 'hideOnView' | 'hideOnEdit'

export interface TableColumns extends DataTableColumns {
  editKey?: String; // 新增、编辑、查看展示的字段
  editHide?: isTableAndEditShow; // 编辑字段是否显示
  tableHide?: Boolean; // 表格是否显示
  component?: ComponentType; // 新增、编辑、查看展示的表单组件
  componentProps?: Object; // 表单组件的配置，支持navite表单配置项
}
