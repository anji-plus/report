import { RouteRecordRaw } from 'vue-router';
import { Layout } from '@/router/base/index';

/**
 * @descript 没有权限露路由
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
export const constRoutes: Array<RouteRecordRaw> = [
  {
    path: '/404',
    name: 'Exception',
    component: Layout,
    meta: {
      title: '异常页面',
      sort: 10,
    },
    children: [
      {
        path: '404',
        name: 'exception-404',
        meta: {
          title: '404',
        },
        component: () => import('@/views/exception/404.vue'),
      },
    ],
  },
  {
    path: '/',
    name: 'other',
    component: Layout,
    meta: {},
    children: [
      {
        path: 'dictItem',
        name: 'dictItem',
        component: () => import('@/views/system/dictItem/index.vue'),
        meta: {
          title: '字典项',
        },
      },
    ],
  },
];
