<template>
    <div id="main">

    </div>
</template>
<script>
import 'echarts/map/js/china.js'
import bus from '../assets/eventBus.js'
export default {
    data () {
        return {
            data: [],
            num: 0
        }
    },
    mounted () {
        this.ajax.get('http://localhost:3000/table/map').then(res => {
            let that = this
            that.data = res.data;
            that.data.forEach(function (item) {
                if (item.value > that.num) {
                    that.num = item.value
                }
            })
            this.mapFn();
        });
    },
    computed: {
        options () {
            return {
                visualMap: this.visualMap,
                tooltip: this.tooltip,
                series: this.series,
                geo: this.geo
            };
        },
        visualMap() {
            return {
                min: 0,
                max: this.num,
                calculable: true,
                singleModel: true,
                inRange: {
                    color: ['#fb714c', '#70b4f4']
                },
                textStyle: {
                    color: '#fff'
                }
            };
        },
        tooltip() {
            return {
                show: true,
                type: 'map',
                map: 'china',
                data: this.data,
                singleModel: true
            };
        },
        series() {
            return [
                {
                    name: '访问问题区域统计',
                    type: 'map',
                    roam: true,
                    selectedMode: true,
                    geoIndex: 0,
                    label: {
                        show: false
                    },
                    data: this.data
                }
            ];
        },
        geo() {
            return {
                roam: true,
                map: 'china',
                selectedMode: true,
                label: {
                    emphasis:{
                        show: false
                    }
                }
            };
        }
    },
    created () {

    },
    methods: {
        mapFn() {
            let mapChart = this.$echarts.init(document.getElementById("main"));
            mapChart.setOption(this.options)
            mapChart.on('mapselectchanged', function (param) {
                console.log(param)
                bus.$emit('sendMsg',param.name)
            })
        }
    }
}
</script>
<style scoped>
 #main {
     display: inline-block;
     height: 600px;
     width: 800px;
 }
</style>