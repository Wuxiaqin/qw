//引入express模块
const e = require('express');
const express=require('express');
//利用router方法创建一个路由器
let r=express.Router();
//引入mysql连接池
const pool = require('../pool.js');

r.get('/v1/login1', (req, res) => { 
    res.send('这是测试接口')
})
//用户登录接口
r.get('/v1/login/:uname&:upwd',(req,res)=>{
    var _uname=req.params.uname;
    var _upwd=req.params.upwd;
    // console.log(req.params)
    var sql='select * from  qw_user where uname=? and upwd=?'
    pool.query(sql,[_uname,_upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send("1")
        }else {
            res.send("0")
        }
    })
})
//用户名重复验证接口
r.get('/v1/reg_uname/:uname',(req,res)=>{
    var sql='select * from qw_user where uname=?'
    pool.query(sql,[req.params.uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send("1")
        }else {
            res.send("0")
        }
    })
})
//忘记密码接口
r.get('/v1/forget/:uname&:email',(req,res)=>{
    var _uname=req.params.uname;
    var _email=req.params.email;
    // console.log(req.params)
    var sql='select * from qw_user where uname=? and email=?'
    pool.query(sql,[_uname,_email],(err,result)=>{
        if(err) throw err;
        if(result.length >0){
            res.send('登录成功')
        }else {
            res.send('登陆失败')
        }
    })
})
//注册接口
r.post('/v1/reg',(req,res)=>{
    var obj=req.body;
    var sql='insert into qw_user set ?'
    pool.query(sql,[obj],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows==1){
            res.send("1")
        }else{
            res.send("0")
        }
    })
})
//轮播图接口
r.get('/v1/carousel',(req,res)=>{
    // var obj = req.query;
    // console.log(obj);
    var sql='select * from qw_index_carouse';
    pool.query(sql,(err, result)=>{
        if(err) throw err;
        if(result.length>0){
            console.log(result)
            res.send(result);
            
        }else {
            res.send("0")
        }
    })
})



//导出路由器
module.exports=r;