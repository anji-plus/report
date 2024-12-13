import { RouteRecordRaw } from 'vue-router';
import { Layout } from '@/router/base/index';
import { SettingOutlined } from '@vicons/antd';
import { renderIcon } from '@/utils/index';

/**
 * @descript 系统设置
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
    path: '/system',
    name: 'system',
    component: Layout,
    meta: {
      title: '系统设置',
      icon: renderIcon(SettingOutlined),
      sort: 4,
      permission: 'fileManage|dictManage|dictItemManage',
    },
    children: [
      {
        path: 'fileManage',
        name: 'fileManage',
        meta: {
          title: '文件管理',
          permission: 'fileManage',
        },
        component: () => import('@/views/system/fileManage/index.vue'),
      },
      {
        path: 'dictManage',
        name: 'dictManage',
        meta: {
          title: '数据字典',
          permission: 'dictManage',
        },
        component: () => import('@/views/system/dictManage/index.vue'),
      },
    ],
  },
];

export default routes;
