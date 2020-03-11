const express = require('express')
const router = express.Router()
const pool = require('../pool.js')

// 地图数据
router.get('/map', (req, res) => {
    var sql = 'SELECT * FROM tables';
    pool.query(sql, [], (err,result) => {
        if (err) console.log(err)
        let arr = [];
        result.forEach(function(item) {
            let obj = {};
            obj.name = item.pric;
            obj.value = 1;
            arr.push(obj);
        })
        let newArr = [];
        arr.forEach(el=>{
            const result = newArr.findIndex(ol=>{
                return el.name === ol.name;
            })
            if (result !== -1){
                newArr[result].value += 1;
            } else{
                newArr.push(el)
            }
        })
        res.send(newArr)
    })
});
// 表格数据
router.get('/table', (req, res) => {
    let sql = "select * from tables order by pric "
    pool.query(sql, [], (err, result) => {
        if (err) console.log(err);
        res.send(result)
    })
});
// 地图点击数据
router.get('/search', (req, res) => {
    pool.query(`select * from tables where pric=?`, [req.query.msg], (err, result) => {
        if (err) console.log(err);
        res.send(result);
    })
});
// 默认饼状图数据
router.get('/pie', (req, res) => {
    pool.query('select * from tables', [], (err, result) => {
        if (err) console.log(err);
        let arr = [];
        result.forEach(function(item) {
            let obj = {};
            obj.name = item.source;
            obj.value = 1;
            arr.push(obj);
        })
        let newArr = [];
        arr.forEach(el=>{
            const result = newArr.findIndex(ol=>{
                return el.name === ol.name;
            })
            if (result !== -1){
                newArr[result].value += 1;
            } else{
                newArr.push(el)
            }
        })
        res.send(newArr);
    })
});
// 地图点击后饼状图数据
router.get('/pieSearch', (req, res) => {
    pool.query(`select * from tables where pric=?`, [req.query.pric], (err, result) => {
        if (err) console.log(err);
        let arr = [];
        result.forEach(function(item) {
            let obj = {};
            obj.name = item.source;
            obj.value = 1;
            arr.push(obj);
        })
        let newArr = [];
        arr.forEach(el=>{
            const result = newArr.findIndex(ol=>{
                return el.name === ol.name;
            })
            if (result !== -1){
                newArr[result].value += 1;
            } else{
                newArr.push(el)
            }
        })
        res.send(newArr);
    })
});
// 饼状图下钻数据
router.get('/pieChart', (req, res) => {
    pool.query(`select * from tables where source=?`, [req.query.source], (err, result) => {
        if (err) console.log(err)
        let arr = [];
        result.forEach(function(item) {
            let obj = {};
            obj.name = item.channel;
            obj.value = 1;
            arr.push(obj);
        })
        let newArr = [];
        arr.forEach(el=>{
            const result = newArr.findIndex(ol=>{
                return el.name === ol.name;
            })
            if (result !== -1){
                newArr[result].value += 1;
            } else{
                newArr.push(el)
            }
        })
        res.send(newArr)
    })
})
module.exports = router