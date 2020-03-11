import Vue from 'vue'
import VRouter from "vue-router"
import index from '../components/index.vue'
import getMsg from '../components/getMsg.vue'
import pie from '../components/pie.vue'
import map from '../components/map.vue'
import table from '../components/table.vue'
import test from '../components/test.vue'
Vue.use(VRouter)

export default new VRouter ({
    routes: [
        {
            path: '/',
            name: 'index',
            component: index
        },
        {
            path: '/getMsg',
            name: 'getMsg',
            component: getMsg
        },
        {
            path: '/pie',
            name: 'pie',
            component: pie
        },
        {
            path: '/map',
            name: 'map',
            component: map
        },
        {
            path: '/table',
            name: 'table',
            component: table
        },
        {
            path: '/test',
            name: 'test',
            component: test
        }
    ]
})