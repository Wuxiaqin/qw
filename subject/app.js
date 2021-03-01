//导入express包
const express=require('express');
//引入user路由
const userRouter=require('./routes/user.js');

//引入body中间件
const bodyParser=require('body-parser');

let app = express();

//给与一个8080端口
app.listen(1024);


//静态资源托管到public目录
app.use(express.static('public'));
//使用body-parser中间件，在路由之前用，利用urlencoded方法，将POST请求的数据转换为对象
app.use(bodyParser.urlencoded({
    extended: false  //表示不使用扩展的qs模块，而是querystring模块
}))



//路由挂载
app.use('/user',userRouter);
