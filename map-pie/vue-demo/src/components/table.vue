<template>
        <table cellpadding='5px'>
            <thead>
                <tr style="background:#e2e7eb">
                    <th>序号</th>
                    <th>省份</th>
                    <th>渠道</th>
                    <th style="width:50%;">问题</th>
                </tr>
            </thead>
            <tbody>
                <tr v-if="data.length === 0">
                    <td colspan="4" style="text-align:center;">暂无数据</td>
                </tr>
                <tr v-else v-for="(item, index) in data" :key="index">
                    <td>{{index+1}}</td>
                    <td>{{item.pric}}</td>
                    <td>{{item.channel}}</td>
                    <td>{{item.question}}</td>
                </tr>
            </tbody>
        </table>
</template>
<script>
import bus from '../assets/eventBus.js'
export default {
    data () {
        return {
            data: [],
            pric: ''
        }
    },
    created () {

    },
    mounted() {
        this.ajax.get('http://localhost:3000/table/table').then(res => {
            this.data = res.data;
        }); 
        let that = this;
        bus.$on('sendMsg', function (msg) {
            that.ajax.get('http://localhost:3000/table/search?msg=' + msg).then(res => {
                that.data = res.data;
                that.reload();
            })
        })
    },
    methods: {
        getData: function (msg) {
            this.ajax.get('http://localhost:3000/table/search?msg=' + msg).then(res => {
                this.data = res.data;
            })
        },
        reload: function () {
            this.$forceUpdate();
        }
    },
    watch: {
        pric: function (val) {

        }
    }

}
</script>
<style scoped>
    table {
        border-spacing: 0px;
        width: 100%;
        margin-top:30px;
    }
    thead{
        font-size: 20px;
        text-align: left;
    }
    tbody{
        font-size: 18px;
    }
    th {
        margin: 0px;
        padding: 10px 15px;
    }
</style>