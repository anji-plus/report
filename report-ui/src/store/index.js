import Vue from 'vue'
import Vuex from 'vuex'
import actions from './actions'
import getters from './getters'
import mutations from './mutations'
import app from './modules/app'
import user from './modules/user'
import cacheView from './modules/cachaView'
import help from './modules/help'
import designer from './modules/designer'

Vue.use(Vuex)

const initPlugin = store => {
}

const store = new Vuex.Store({
  modules: {
    app,
    user,
    cacheView,
    help,
    designer
  },
  state: { },
  plugins: [initPlugin],
  actions,
  mutations,
  getters
})

export default store
