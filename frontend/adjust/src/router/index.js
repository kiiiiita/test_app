import Vue from 'vue'
import Router from 'vue-router'
import Top from '@/pages/top'
import Adjust from '@/pages/adjust'
import AddMember from '@/pages/addMember'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Top',
      component: Top
    },
    {
      path: '/adjust',
      name: 'Adjust',
      component: Adjust
    },
    {
      path: '/adjust/add-member',
      name: 'AddMember',
      component: AddMember
    }
  ]
})
