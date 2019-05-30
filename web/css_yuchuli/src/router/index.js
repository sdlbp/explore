import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import less from '@/components/less.vue'
import sass from '@/components/sass.vue'
import scss from '@/components/scss.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }, {
      path: '/scss',
      component: scss
    }, {
      path: '/less',
      component: less
    }, {
      path: '/sass',
      component: sass
    }
  ]
})
