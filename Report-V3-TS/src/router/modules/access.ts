import { RouteRecordRaw } from 'vue-router';
import { Layout } from '@/router/base/index';
import { AccountBookFilled } from '@vicons/antd';
import { renderIcon } from '@/utils/index';

/**
 * @descript 用户权限
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
    path: '/access',
    name: 'access',
    component: Layout,
    meta: {
      title: '用户权限',
      icon: renderIcon(AccountBookFilled),
      sort: 2,
    },
    children: [
      {
        path: 'authority',
        name: 'authority',
        meta: {
          title: '权限管理',
        },
        component: () => import('@/views/access/accessAuthority/index.vue'),
      },
      {
        path: 'role',
        name: 'role',
        meta: {
          title: '角色管理',
        },
        component: () => import('@/views/access/accessRole/index.vue'),
      },
      {
        path: 'user',
        name: 'user',
        meta: {
          title: '用户管理',
        },
        component: () => import('@/views/access/accessUser/index.vue'),
      },
    ],
  },
];

export default routes;
