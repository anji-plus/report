import { RouteRecordRaw } from 'vue-router';
import { Layout } from '@/router/base/index';
import { DatabaseOutlined } from '@vicons/antd';
import { renderIcon } from '@/utils/index';

/**
 * @descript 报表设计
 * @param name 路由名称, 必须设置,且不能重名
 * @param meta 路由元信息（路由附带扩展信息）
 * @param redirect 重定向地址, 访问这个路由时,自定进行重定向
 * @param meta.disabled 禁用整个菜单
 * @param meta.title 菜单名称
 * @param meta.icon 菜单图标
 * @param meta.keepAlive 缓存该路由
 * @param meta.sort 排序越小越排前
 *
 * */
const routes: Array<RouteRecordRaw> = [
  {
    path: '/report',
    name: 'report',
    component: Layout,
    meta: {
      title: '报表设计',
      icon: renderIcon(DatabaseOutlined),
      sort: 3,
      permission: 'datasourceManage|resultsetManage|reportManage|bigScreenManage|excelManage'
    },
    children: [
      {
        path: 'dataSource',
        name: 'dataSource',
        meta: {
          title: '数据源',
          permission: 'datasourceManage'
        },
        component: () => import('@/views/report/dataSource/index.vue'),
      },
      {
        path: 'resultSet',
        name: 'resultSet',
        meta: {
          title: '数据集',
          permission: 'resultsetManage'
        },
        component: () => import('@/views/report/resultSet/index.vue'),
      },
      {
        path: 'reportManage',
        name: 'reportManage',
        meta: {
          title: '报表管理',
          permission: 'reportManage'
        },
        component: () => import('@/views/report/reportManage/index.vue'),
      },
      {
        path: 'bigScreen',
        name: 'bigScreen',
        meta: {
          title: '大屏报表',
          permission: 'bigScreenManage'
        },
        component: () => import('@/views/report/bigScreen/index.vue'),
      },
      {
        path: 'excelReport',
        name: 'excelReport',
        meta: {
          title: '表格报表',
          permission: 'excelManage'
        },
        component: () => import('@/views/report/excelReport/index.vue'),
      },
      {
        path: 'shareManage',
        name: 'shareManage',
        meta: {
          title: '报表分享',
          permission: 'reportShareManage'
        },
        component: () => import('@/views/report/shareManage/index.vue'),
      },
    ],
  },
];

export default routes;
