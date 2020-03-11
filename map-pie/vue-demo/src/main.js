import Vue from "vue"
import App from './app.vue'
import router from "./router/router.js"
import axios from 'axios'
import echarts from 'echarts'


Vue.prototype.ajax = axios
Vue.prototype.$echarts = echarts


const root = document.createElement('div')
document.body.appendChild(root);

new Vue({
    router,
    render: (h)=>h(App)
}).$mount(root)