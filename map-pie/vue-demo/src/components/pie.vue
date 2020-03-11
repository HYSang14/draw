<template>
    <div style="display:inline-block; position: relative" >
        <div id="pie" v-if="data.length >= 0">
        </div>
        <button id="btn" @click="goBack">返回上一级</button>
    </div>

    
</template>
<script>
import bus from '../assets/eventBus.js'
export default {
    data () {
        return {
            data: [],
            subtitle: [],
            isShow: 0
        }
    },
    mounted () {
        let that = this;
        that.ajax('http://localhost:3000/table/pie').then(res => {
            that.data = res.data;   
            res.data.forEach( item => {
                that.subtitle.push(item.name)   
            })  
            that.pieFn();
        })
        bus.$on('sendMsg', function(msg){
            that.ajax.get('http://localhost:3000/table/pieSearch?pric=' + msg).then(res => {
                if (!res.data.length) {
                    res.data.push({name:'暂无数据', value: 0})
                }
                that.data = res.data;
                res.data.forEach( item => {
                    that.subtitle.push(item.name)   
                })
                that.pieFn();   
            })
        })
        this.pieClick()
    },
    computed: {
        options () {
            return {
                title: this.title,
                tooltip: this.tooltip,
                legend: this.legend,
                series: this.series
            }
        },
        title () {
            return {
                title:'访问问题区域统计',
                left: 'center'
            }
        },
        tooltip () {
            return {
                trigger: 'item',
                foramtter: '{a}<br/>{b}:{c}({d}%)'
            }
        },
        legend () {
            return {
                orient: 'vertical',
                left: 'left',
                data: this.subtitle
            }
        },
        series () {
            return [
                {
                    name: '访问问题区域统计',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: this.data,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        }
    },
    methods: {
        reload () {
            
        },
        pieFn () {
            let pieChart = this.$echarts.init(document.getElementById('pie'));
            pieChart.setOption(this.options);
        },
        pieClick () {
            var that = this;
            let chart = this.$echarts.init(document.getElementById('pie'));
            chart.on('click', msg => {
                that.ajax.get('http://localhost:3000/table/pieChart?source='+ msg.name).then( res => {
                    that.data = res.data;
                    that.isShow++;
                    if (res.data.length) {
                        that.pieFn();
                    } else {
                        return false
                    }
                    
                })
            })
        },
        goBack () {
            var that = this
            that.ajax('http://localhost:3000/table/pie').then(res => {
                that.data = res.data;   
                res.data.forEach( item => {
                    that.subtitle.push(item.name)   
                })  
                that.pieFn();
                that.isShow--;
            })
        }
    },
    created () {

    },
    watch: {
        isShow (v) {
            let btn = document.getElementById('btn');
            if (v === 0) {
                this.$nextTick(_ => {
                    btn.style.display = 'none'
                })
            } else {
                this.$nextTick(_ => {
                    btn.style.display = 'inline-block'
                })
            }
        }
    }
}
</script>
<style scoped>
#pie{   
    display: inline-block;
    height:600px;
    width:800px;
}
#btn{
    display:none;
    position:absolute;
    top: 50px;
    right: 10px;
    z-index: 1000;
}
</style>