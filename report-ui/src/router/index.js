import Vue from 'vue'
import Router from 'vue-router'

// in development-env not use lazy-loading, because lazy-loading too many pages will cause webpack hot update too slow. so only in production use lazy-loading;
// detail: https://panjiachen.github.io/vue-element-admin-site/#/lazy-loading

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
*                                if not set alwaysShow, only more than one route under the children
*                                it will becomes nested mode, otherwise not show the root menu
* redirect: noredirect           if `redirect:noredirect` will no redirect in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
    AuthKey: 'roleManage:find',      该页面进入的权限码
    keepAlive: true,                  该页面需要缓存(注意: name值必须设置 与组件内部name 一致 配合isback属性)
    isback :  false
  }
* AuthKey: 'roleManage:find'      该页面进入的权限码
**/
export const constantRouterMap = [
  { path: '/login', component: () => import('@/views/login'), hidden: true },
  {
    path: '/index', component: Layout, redirect: '/access/accessAuthority', name: '首页', meta: { title: '首页', icon: 'iconhome2' },
    children: [
      { path: '', name: 'accessUser', component: () => import('@/views/home/index'), meta: { title: '首页', icon: 'iconhome2', keepAlive: true, isBack: true, requireAuth: true } },
    ]
  },
  {
    path: '/access', component: Layout, name: 'access', meta: { title: '用户权限', icon: 'icondfzq-' },
    children: [
      { path: 'authority', name: 'authority', component: () => import('@/views/accessAuthority/index'), meta: { title: '权限管理', icon: 'iconquanxian', keepAlive: true, isBack: true } },
      { path: 'role', name: 'role', component: () => import('@/views/accessRole/index'), meta: { title: '角色管理', icon: 'iconjiaose1', keepAlive: true, isBack: true } },
      { path: 'user', name: 'user', component: () => import('@/views/accessUser/index'), meta: { title: '用户管理', icon: 'iconyonghu', keepAlive: true, isBack: true } },
    ]
  },
  {
    path: '/report', component: Layout, name: '报表设计', meta: { title: '报表设计', icon: 'iconnavicon-ywcs' },
    children: [
      { path: 'datasource', name: 'datasource', component: () => import('@/views/report/datasource/index'), meta: { title: '数据源', icon: 'iconeventbridgexiaoxishijianzongxian', keepAlive: true, isBack: true } },
      { path: 'resultset', name: 'resultset', component: () => import('@/views/report/resultset/index'), meta: { title: '数据集', icon: 'iconalikafkaxiaoxiduilieKafka', keepAlive: true, isBack: true } },
      { path: 'report', name: 'reportIndex', component: () => import('@/views/report/report/index'), meta: { title: '报表管理', icon: 'iconnavicon-ywcs', keepAlive: true, isBack: true } },
      { path: 'bigscreen', name: 'bigscreen', component: () => import('@/views/report/bigscreen/index'), meta: { title: '大屏报表', icon: 'iconchufaqipeizhi-hui', keepAlive: true, isBack: true },       },
      //{ path: 'excelreport', name: 'excelreport', component: () => import('@/views/report/excelreport/index'), meta: { title: '表格报表', icon: 'iconliebiao', keepAlive: true, isBack: true } },
    ]
  },
  { path: '/bigscreen/viewer', component: () => import('@/views/report/bigscreen/viewer'), hidden: true },
  { path: '/bigscreen/designer', component: () => import('@/views/report/bigscreen/designer'), hidden: true },
  { path: '/404', component: () => import('@/views/404'), hidden: true },
  { path: '*', redirect: '/login', hidden: true },
  /*
  {
    path: '/helpCenList', component: () => import('@/views/helpCenList/list'), hidden: true,
    children: [
      { path: 'list', component: () => import('@/views/helpCenList/list-title'), hidden: true },
      { path: 'detail', component: () => import('@/views/helpCenList/list-detail'), hidden: true },
      { path: 'search', component: () => import('@/views/helpCenList/list-search'), hidden: true }
    ]
  },
  */
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})