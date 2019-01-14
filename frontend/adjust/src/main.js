// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import firebase from 'firebase'
import router from './router'

Vue.config.productionTip = false

console.log(process.env);

var config = {
        apiKey: process.env.FIRE_BASE.API_KEY,
        authDomain: process.env.AUTH_DOMAIN,
        databaseURL: process.env.FIRE_BASE.DATABASE_URL,
        projectId: process.env.FIRE_BASE.PROJECT_ID,
        storageBucket: process.env.STORAGE_BUCKET,
        messagingSenderId: process.env.MESSAGING_SENDERID,
};
firebase.initializeApp(config);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
