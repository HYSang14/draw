<template>
  <div>
    <button @click="send">点击发送</button>
    <div id="main"></div>
  </div>
</template>
<script>
import "echarts/map/js/china.js";
export default {
  data() {
    return {
      data: [
        { name: "北京", value: Math.round(Math.random() * 500) },
        { name: "天津", value: Math.round(Math.random() * 500) },
        { name: "上海", value: Math.round(Math.random() * 500) },
        { name: "重庆", value: Math.round(Math.random() * 500) },
        { name: "河北", value: Math.round(Math.random() * 500) },
        { name: "河南", value: Math.round(Math.random() * 500) },
        { name: "云南", value: Math.round(Math.random() * 500) },
        { name: "辽宁", value: Math.round(Math.random() * 500) },
        { name: "黑龙江", value: Math.round(Math.random() * 500) },
        { name: "湖南", value: Math.round(Math.random() * 500) },
        { name: "安徽", value: Math.round(Math.random() * 500) },
        { name: "山东", value: Math.round(Math.random() * 500) },
        { name: "新疆", value: Math.round(Math.random() * 500) },
        { name: "江苏", value: Math.round(Math.random() * 500) },
        { name: "浙江", value: Math.round(Math.random() * 500) },
        { name: "江西", value: Math.round(Math.random() * 500) },
        { name: "湖北", value: Math.round(Math.random() * 500) },
        { name: "广西", value: Math.round(Math.random() * 500) },
        { name: "甘肃", value: Math.round(Math.random() * 500) },
        { name: "山西", value: Math.round(Math.random() * 500) },
        { name: "内蒙古", value: Math.round(Math.random() * 500) },
        { name: "陕西", value: Math.round(Math.random() * 500) },
        { name: "吉林", value: Math.round(Math.random() * 500) },
        { name: "福建", value: Math.round(Math.random() * 500) },
        { name: "贵州", value: Math.round(Math.random() * 500) },
        { name: "广东", value: Math.round(Math.random() * 500) },
        { name: "青海", value: Math.round(Math.random() * 500) },
        { name: "西藏", value: Math.round(Math.random() * 500) },
        { name: "四川", value: Math.round(Math.random() * 500) },
        { name: "宁夏", value: Math.round(Math.random() * 500) },
        { name: "海南", value: Math.round(Math.random() * 500) },
        { name: "台湾", value: Math.round(Math.random() * 500) },
        { name: "香港", value: Math.round(Math.random() * 500) },
        { name: "澳门", value: Math.round(Math.random() * 500) },
        { name: "南海诸岛", value: Math.round(Math.random() * 500) }
      ]
    };
  },
  mounted() {
    this.mapFn();
  },
  computed: {
    options() {
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
        max: 100,
        calculable: true,
        inRange: {
          color: ["#fb714c", "#70b4f4"]
        },
        textStyle: {
          color: "#fff"
        }
      };
    },
    tooltip() {
      return {
        show: true,
        type: "map",
        map: "china",
        data: this.data
      };
    },
    series() {
      return [
        {
          name: "地图",
          type: "map",
          roam: true,
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
        map: "china",
        label: {
          emphasis: {
            show: false
          }
        }
      };
    }
  },
  methods: {
    send() {
      this.ajax.get("http://localhost:3000/table/map").then(res => {
        console.log(res.data);
      });
    },
    mapFn() {
      let mapChart = this.$echarts.init(document.getElementById("main"));
      mapChart.setOption(this.options);
    }
  }
};
</script>
<style scoped>
#main {
  height: 800px;
  width: 1000px;
}
</style>
