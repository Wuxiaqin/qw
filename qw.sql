SET NAMES UTF8;
DROP DATABASE IF EXISTS qw;
CREATE DATABASE qw CHARSET=UTF8;
USE qw;

/*
用户模块
1、用户信息表
*/
CREATE TABLE qw_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR (32),
    upwd VARCHAR(32),
    gender INT,
    birthday DATE ,
    email VARCHAR(64),
    avater VARCHAR(128)#头像图片路径
    
);
/*2、用户收件地址表*/
CREATE TABLE qw_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    receiver VARCHAR(16),
    cellphone VARCHAR(16),
    country VARCHAR(16),
    province VARCHAR(16),
    city VARCHAR(16),
    address VARCHAR(128),
    second_phone VARCHAR(16),
    postcode VARCHAR(6) #邮政编码
);
/*商品模块
1、商品类别表
*/
CREATE TABLE qw_products_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(32)
);
/*2、商品信息表*/
CREATE TABLE qw_products(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,
    product_code VARCHAR(16),#商品货号
    title VARCHAR(64),
    price DECIMAL(10,2),
    service VARCHAR(64),#服务和积分
    spec VARCHAR(64),#规格
    product_brand VARCHAR(64)#产品品牌
);
/*3、商品详情图表*/
CREATE TABLE qw_products_pic(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,#商品编号
    sm VARCHAR(128),#大图片
    md VARCHAR(128),#中图片
    lg VARCHAR(128)#小图片
);
/*首页模块
1、首页轮播图表
*/
CREATE TABLE qw_index_carouse(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),#图片路径
    title VARCHAR(64),#图片描述
    href VARCHAR(128)#图片跳转链接
);
/*首页展示产品表*/
CREATE TABLE qw_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),#商品标题
    pic VARCHAR(128),#商品图片
    href VARCHAR(128)#跳转链接
);
/*购物车模块*/
CREATE TABLE qw_shopping_cart(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, #用户编号
    product_id INT,#商品编号
    count INT#购买数量
);
/*订单模块
1、订单表
*/
CREATE TABLE qw_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,#用户编号
    address_id INT,#收货地址编号
    status INT,#订单状态 1-未确认2-未付款3-未发货4-运输中5-已签收6-以取消
    order_time DATETIME,
    pay_time DATETIME,
    deliver_time DATETIME,
    receiver_time DATETIME
);
/*2、订单详情表*/
CREATE TABLE qw_order_detail(
    did INT,
    order_id INT,
    product_id INT,
    count INT
);
/****数据导入
用户信息表
****/
INSERT INTO qw_user VALUES
(NULL,'夏雨','123456','1','1998-5-1','123456@qq.com','img/avater/default.png'),
(NULL,'夏沁','123456','1','1998-5-1','123456@qq.com','img/avater/default.png'),
(NULL,'李宇','123456','1','1998-5-1','123456@qq.com','img/avater/default.png'),
(NULL,'黄龙','123456','1','1998-5-1','123456@qq.com','img/avater/default.png');
/*用户收件地址表*/
INSERT INTO qw_receiver_address VALUES
(NULL,1,'夏雨','18890056780','中国','湖南','长沙','雨花区东塘','12345678911','414000'),
(NULL,2,'夏沁','18890056780','中国','湖南','长沙','雨花区东塘','12345678911','414000'),
(NULL,3,'李宇','18890056780','中国','湖南','长沙','雨花区东塘','12345678911','414000'),
(NULL,4,'黄龙','18890056780','中国','湖南','长沙','雨花区东塘','12345678911','414000');
/*商品模块
商品类别表*/
INSERT INTO qw_products_family VALUES
(NULL,'数码家电'),
(NULL,'居家生活'),
(NULL,'个人护理'),
(NULL,'时尚轻奢'),
(NULL,'网红食品');
/*商品信息表*/
INSERT INTO qw_products VALUES
(NULL,1,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,2,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,3,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,4,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,5,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,6,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,7,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,8,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,9,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,10,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房'),
(NULL,11,'ECS000554','麦子厨房多功能三明治早餐机SW-005',219.00,'使用零积分','绿色白色红色','麦子厨房');
/*商品详情图表*/
INSERT INTO qw_products_pic VALUES
(NULL,1,'img/avater/default.png','img/avater/default.png','img/avater/default.png'),
(NULL,2,'img/avater/default.png','img/avater/default.png','img/avater/default.png'),
(NULL,3,'img/avater/default.png','img/avater/default.png','img/avater/default.png'),
(NULL,4,'img/avater/default.png','img/avater/default.png','img/avater/default.png');
/*首页模块
首页轮播图表
*/
INSERT INTO qw_index_carouse VALUES
(NULL,'./image/index/1.jpg','烤盘款式任选','../趣玩.html'),
(NULL,'./image/index/1.jpg','烤盘款式任选','../趣玩.html'),
(NULL,'./image/index/1.jpg','烤盘款式任选','../趣玩.html'),
(NULL,'./image/index/1.jpg','烤盘款式任选','../趣玩.html');
/*首页展示产品表*/
INSERT INTO qw_index_product VALUES
(NULL,'享受洗护健康','img/avater/default.png','../趣玩.html'),
(NULL,'享受洗护健康','img/avater/default.png','../趣玩.html'),
(NULL,'享受洗护健康','img/avater/default.png','../趣玩.html'),
(NULL,'享受洗护健康','img/avater/default.png','../趣玩.html');
/*购物车模块*/
INSERT INTO qw_shopping_cart VALUES
(NULL,1,1,2),
(NULL,2,2,2),
(NULL,3,3,2),
(NULL,4,4,2);
/*订单模块
1、订单表
*/
INSERT INTO qw_order VALUES
(NULL,1,1,1,'2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15'),
(NULL,2,2,1,'2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15'),
(NULL,3,3,1,'2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15'),
(NULL,4,4,1,'2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15','2020-08-08 20:15:15');






