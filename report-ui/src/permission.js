import router from './router'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import { getToken, getAccessUser } from "@/utils/auth";
export default router
const whiteList = ['/login', '/aj/**', '/el/**', '/bigscreen/viewer', '/excelreport/viewer']
//  判断是否需要登录权限 以及是否登录
router.beforeEach((to, from, next) => {

  NProgress.start()
  let token = getToken();
  let gaeaUser = getAccessUser();
  if (token) {
    if (to.path == '/login') {
      next('/index')
      NProgress.done()
    }else{
      next()
    }
  }else {
    if (whiteList.includes(to.path)) {
      next()
    }else {
      if ((token == null || token == '' || token ==undefined || gaeaUser == {}) && (to.meta != null && to.meta.requireAuth == true)) {
        next(`/login?redirect=${to.path}`);
        NProgress.done();
      } else {
        next();
      }
    }

  }
})

router.afterEach(() => {
  NProgress.done()
})
