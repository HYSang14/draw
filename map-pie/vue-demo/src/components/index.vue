<template>
    <div>
        <a-map></a-map>
        <a-pie></a-pie>
        <a-table></a-table>
    </div>
</template>
<script>
import map from './map.vue'
import table from './table.vue'
import pie from './pie.vue'
export default {
    data () {
        return {
            
        }
    },
    methods: {
    },
    components: {
        'a-map': map,
        'a-table': table,
        'a-pie': pie
    }
}
</script>


