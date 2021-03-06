import Vue from 'vue'
import './plugins/vuetify'
import './plugins/vue-class-component'
import App from './App.vue'
import router from './router'
import store from './store'
// import './registerServiceWorker'
import 'roboto-fontface/css/roboto/roboto-fontface.css'

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
