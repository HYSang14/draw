<template>
    <div>
        <input type="text" v-model="msg">
        <button @click="sendMsg">确定</button>
        <div>{{msg}}</div>
    </div>
</template>
<script>
export default {
    data (){
        return {
            data: 'hello',
            msg: ''
        }
    },
    methods: {
        sendMsg: function(){
            this.data = this.msg
        }
    },
    watch: {
        msg: function (newVal, oldVal) {
            console.log(newVal)
        }
    }
}
</script>
<style scoped>

</style>