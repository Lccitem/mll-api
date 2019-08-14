set names utf8;
drop database if exists mll;
create database mll charset=utf8;
use mll;

#用户信息表
create table mll_user(
	uid int primary key not null auto_increment,
	uname varchar(32) NOT NULL DEFAULT '',					
	upwd varchar(32) NOT NULL DEFAULT '',
	email varchar(64),
	phone varchar(16) not null unique, #手机号
	avatar varchar(128),               #头像图片路径
	user_name varchar(32),             #用户真实姓名
	gender boolean                     #性别
);
insert into mll_user values
	(null,'dangdang',md5('123'),'dangdang@qq.com','18111111111',null,'当当',1),
	(null,'ruiwen',md5('123'),'rw@qq.com','18111111113',null,'瑞文',0),
	(null,'liqing',md5('123'),'lq@qq.com','18111111114',null,'李青',1),
	(null,'gaojianli',md5('123'),'gjl@qq.com','18111111112',null,'高渐离',1),
	(null,'yasuo',md5('123'),'ys@qq.com','18111111115',null,'亚索',1);
#用户地址表
create table mll_receiver_address(
	aid int primary key auto_increment,
	user_id int,           #用户编号
	receiver varchar(16),  #接收人姓名
	province varchar(16),  #省
	city varchar(16),      #市
	county varchar(16),    #县
	address varchar(128),  #详细地址
	cellphone varchar(16), #手机
	fixedphone varchar(16), #固定电话
	postcode char(6),      #邮编
	tag varchar(16),       #标签名
	is_default boolean     #是否为当前用户的默认收货地址
);
#用户购物车表
CREATE TABLE `mll_shopping_cart` (
  cid Int PRIMARY KEY auto_increment,
  user_id INT,
  product_id INT,
  count INT,
  is_checked BOOLEAN
)

#用户订单表
create table mll_order(
	oid int primary key auto_increment,
	user_id int,          #用户编号
	address_id int,	      #地址编号
	status int,           #订单状态
	order_time bigint,    #下单时间
	pay_time bigint,      #付款时间
	deliver_time bigint,  #发货时间
	received_time bigint  #签收时间
);

#用户订单详情表
create table mll_order_detail(
	did int primary key auto_increment,
	order_id int,         #订单编号
	product_id int,       #产品编号
	count int             #购买数量
);

#首页轮播图表
create table mll_index_carousel(
	cid int primary key auto_increment,
	img varchar(128),        #图片路径
	title varchar(64),       #图片描述
	href varchar(128)        #点击图片链接
);

#首页商品栏目表
create table mll_index_product(
	pid int primary key auto_increment,
	title varchar(64),       #商品标题
	details varchar(128),    #详细描述
	pic varchar(128),        #图片
	price decimal(10,2),     #商品价格
	href varchar(128),	 #点击图片链接
	seq_recommended tinyint,
	seq_new_arrival tinyint,
	seq_top_sale tinyint
);
INSERT INTO `mll_index_product` VALUES (null, '进口乌金木  【浅秋系列】', null, 'img/product/lg/1_1.jpg', '11599.00', 'product_details.html?bid=1', '1', '1', '1');
INSERT INTO `mll_index_product` VALUES (null, '爆款中式床', null, 'img/product/lg/2_1.jpg', '2099.00', 'product_details.html?bid=2', '2', '2', '2');
INSERT INTO `mll_index_product` VALUES (null, '轻奢时尚', null, 'img/product/lg/4_1.jpg', '5499.00', 'product_details.html?bid=4', '3', '3', '3');
INSERT INTO `mll_index_product` VALUES (null, '欧式畅销经典款',null, 'img/product/md/6_1.jpg', '3150.00', 'product_details.html?bid=6', '6', '6', '6');
INSERT INTO `mll_index_product` VALUES (null, '高档提花布', null, 'img/product/md/7_1.jpg', '4199.00', 'product_details.html?bid=7', '7', '7', '7');
INSERT INTO `mll_index_product` VALUES (null, '时尚双人床 烤漆象牙白', null, 'img/product/md/9_1.jpg', '5360.00', 'product_details.html?bid=9', '9', '9', '9');



#商品风格表
create table mll_bed_family(
	fid int primary key auto_increment,
	name varchar(32)    #类别名称
);
insert into mll_bed_family values
	(1,'中式风格'),
	(2,'现代风格'),
	(3,'欧美风格'),
	(4,'欧式简约'),
	(5,'榻榻米床');

#商品表
create table mll_bed(
	bid int primary key auto_increment,
	family_id int,           #所属风格
	title varchar(128),      #主标题
	subtitle varchar(128),   #副标题
	model varchar(64),       #品牌型号
	price decimal(8,2),      #价格
	classify varchar(32),    #所属分类
	spec varchar(64),        #规格
	promise varchar(64),     #服务承诺
	field varchar(10),			 #产地
	details varchar(1024),   #商品详细说明
	sold_count int,          #已售出的数量
	is_onsale boolean,        #是否促销中
	pic_md varchar(120),			#商品图片
	old decimal(8,2)         #促销价
);
insert into mll_bed values
	(1,1,'[悦麓] 中式风格 进口乌金木 全实木 1.8米储物高箱床 浅秋系列','【浅秋系列】','YL-JHT-A1047B-18C-GX',11599,'实木床','宽1800*长2000mm','30天无忧退换货 质保三年','广东','<div><img src="img/product/lg/1_1.jpg"><img src="img/product/lg/1_2.jpg"><img src="img/product/lg/1_3.jpg"><img src="img/product/lg/1_4.jpg"><img src="img/product/lg/1_5.jpg"><img src="img/product/lg/1_6.jpg"><img src="img/product/lg/1_7.jpg"><img src="img/product/lg/1_8.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/1_1.jpg',10599),
	(10,1,'[悦麓] 中式风格 进口乌金木 全实木 1.5米储物高箱床 浅秋系列','【浅秋系列】','YL-JHT-A1047B-18C-GX',7100,'实木床','宽1500*长1800mm','30天无忧退换货 质保三年','广东',null,null,null,'http://127.0.0.1:3001/product/md/1_1.jpg',6500),
	(2,1,'[梵达思] 中式风格 超高性价比 天然清晰纹理 橡胶木实木边框 1.8米排骨架双人床','床体厚实稳重，床身光滑平整，木质纹理清晰富有美感，造型线条流畅；拐角处打磨圆滑，避免隐形伤害，细节彰显卓越品质。','FDS-DDX-DFB125-18-18C',2099,'实木床','宽1800*长2000mm','30天无忧退换货 质保三年','广东惠州','<div><img src="img/product/lg/2_1.jpg"><img src="img/product/lg/2_2.jpg"><img src="img/product/lg/2_3.jpg"><img src="img/product/lg/2_4.jpg"><img src="img/product/lg/2_5.jpg"><img src="img/product/lg/2_6.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/2_1.jpg',1888),
	(3,2,'[兰美特] 现代风格 头层黄牛真皮 床 储物功能双人1.8米齐边床（左抽屉）','指定款床垫两件享7.5折，搭配购买更省钱！立即去抢>>>','JZ-OS-308A-18C',3990,'皮艺床','宽1800*长2000mm','30天无忧退换货 质保三年','广东深圳','<div><img src="img/product/lg/3_1.jpg"><img src="img/product/lg/3_2.jpg"><img src="img/product/lg/3_3.jpg"><img src="img/product/lg/3_4.jpg"><img src="img/product/lg/3_5.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/3_1.jpg',3100),
	(4,2,'[浅山家居] 现代风格 轻奢时尚 清新简约1.8米床','轻奢时尚，精细做工，无缝对接，细节彰显品质；','QS-QS-DY085-18C',5499,'皮艺床','宽1800*长2020mm','30天无忧退换货 质保三年','广东佛山','<div><img src="img/product/lg/4_1.jpg"><img src="img/product/lg/4_2.jpg"><img src="img/product/lg/4_3.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/4_1.jpg',4999),
	(5,3,'[里斯卡·美尔] 欧式典范·优雅天成 环抱式头层牛皮软包背靠设计 精湛铆钉扪制工艺 1.8米床板床','独特环抱式床头设计，个性大气优雅，舒适依靠，与您深情相拥；精湛铆钉扪皮工艺，精细做工，无缝对接，细节彰显品质；高档头层牛皮软包，精致水晶镶钻，高贵雅致，让您青睐有加！','KLL-TY-MA-05-18C',7999,'木质床','宽1810*长2010mm','30天无忧退换货 质保三年','广东深圳','<div><img src="img/product/lg/5_1.jpg"><img src="img/product/lg/5_2.jpg"><img src="img/product/lg/5_3.jpg"><img src="img/product/lg/5_4.jpg"><img src="img/product/lg/5_5.jpg"><img src="img/product/lg/5_6.jpg"><img src="img/product/lg/5_7.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/5_1.jpg',6900),
	(6,3,'[凯撒豪庭] 欧式畅销经典款 高档水牛头层真皮床 对称式描金雕花 1.8米精致水晶拉扣床','独特环抱式床头设计，个性大气优雅，舒适依靠，与您深情相拥；精湛铆钉扪皮工艺，精细做工，无缝对接，细节彰显品质；高档头层牛皮软包，精致水晶镶钻，高贵雅致，让您青睐有加！','KSHT-KSH-A011-18C',3150,'皮艺床','宽1800*长2000mm','30天无忧退换货 质保三年','越南','<div><img src="img/product/lg/6_1.jpg"><img src="img/product/lg/6_2.jpg"><img src="img/product/lg/6_3.jpg"><img src="img/product/lg/6_4.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/6_1.jpg',2999),
	(7,4,'[卡夫] 欧式简约 高档提花布 1.8米布艺床','指定款床垫两件享7.5折，搭配购买更省钱！立即去抢>>>','KF-HS-B1108-18C',4199,'布艺床','宽1800*长2000mm','30天无忧退换货 质保三年','广东佛山','<div><img src="img/product/lg/7_1.jpg"><img src="img/product/lg/7_2.jpg"><img src="img/product/lg/7_3.jpg"><img src="img/product/lg/7_4.jpg"><img src="img/product/lg/7_5.jpg"><img src="img/product/lg/7_6.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/7_1.jpg',3500),
	(8,4,'[帕拉图] 欧式简约 宽大床头设计 释放疲劳1.8米双人床','清新明朗的色调，传递轻松愉悦；雍容大气的姿态，缔造优雅舒适；精心优质的选材，成就优越品质！','BLT-JX-T36-18C',5088,'皮艺床','宽1800*长2020mm','30天无忧退换货 质保三年','广东佛山','<div><img src="img/product/lg/8_1.jpg"><img src="img/product/lg/8_2.jpg"><img src="img/product/lg/8_3.jpg"><img src="img/product/lg/8_4.jpg"><img src="img/product/lg/8_5.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/8_1.jpg',4800),
	(9,4,'[卡夫] 欧式简约 时尚双人床 烤漆象牙白床1.8米','【同价12.12】宜华、顾家、喜临门床垫大促，低至5.6折！超值，看看去>>>','KF-HS-B1102-18C',5360,'布艺床','宽1800*长2010mm','30天无忧退换货 质保三年','广东佛山','<div><img src="img/product/lg/9_1.jpg"><img src="img/product/lg/9_2.jpg"><img src="img/product/lg/9_3.jpg"><img src="img/product/lg/9_4.jpg"><img src="img/product/lg/9_5.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/9_1.jpg',5100),
	(11,5,'[兰美特]	现代风格 款式新颖 头层黄牛皮左榻榻米软床 1.8米床','【同价12.12】宜华、顾家、喜临门床垫大促，低至5.6折！超值，看看去>>>','JZ-OS-307-18C',5150,'皮艺床','宽1800*长2000mm','30天无忧退换货 质保三年','广东佛山','<div><img src="img/product/lg/11_1.jpg"><img src="img/product/lg/11_2.jpg"><img src="img/product/lg/11_3.jpg"><img src="img/product/lg/11_4.jpg"><img src="img/product/lg/11_5.jpg"><img src="img/product/lg/11_6.jpg"><img src="img/product/lg/11_7.jpg"></div>',null,null,'http://127.0.0.1:3001/product/md/11_1.jpg',4999);

	

#商品详情图表
create table mll_bed_pic(
	pid int primary key auto_increment,
	bed_id int,               #床编号
	sm varchar(128),          #小图片路径
	md varchar(128),					#中图片路径
	lg varchar(128)           #大图片路径
);
insert into mll_bed_pic values
	(null,1,'img/product/sm/1_1.jpg','img/product/md/1_1.jpg','img/product/lg/1_1.jpg'),
	(null,1,'img/product/sm/1_2.jpg','img/product/md/1_2.jpg','img/product/lg/1_2.jpg'),
	(null,1,'img/product/sm/1_3.jpg','img/product/md/1_3.jpg','img/product/lg/1_3.jpg'),
	(null,1,'img/product/sm/1_4.jpg','img/product/md/1_4.jpg','img/product/lg/1_4.jpg'),
	(null,1,'img/product/sm/1_5.jpg','img/product/md/1_5.jpg','img/product/lg/1_5.jpg'),
	(null,1,'img/product/sm/1_6.jpg','img/product/md/1_6.jpg','img/product/lg/1_6.jpg'),
	(null,1,'img/product/sm/1_7.jpg','img/product/md/1_7.jpg','img/product/lg/1_7.jpg'),
	(null,1,'img/product/sm/1_8.jpg','img/product/md/1_8.jpg','img/product/lg/1_8.jpg'),
	(null,2,'img/product/sm/2_1.jpg','img/product/md/2_1.jpg','img/product/lg/2_1.jpg'),
	(null,2,'img/product/sm/2_2.jpg','img/product/md/2_2.jpg','img/product/lg/2_2.jpg'),
	(null,2,'img/product/sm/2_3.jpg','img/product/md/2_3.jpg','img/product/lg/2_3.jpg'),
	(null,2,'img/product/sm/2_4.jpg','img/product/md/2_4.jpg','img/product/lg/2_4.jpg'),
	(null,2,'img/product/sm/2_5.jpg','img/product/md/2_5.jpg','img/product/lg/2_5.jpg'),
	(null,2,'img/product/sm/2_6.jpg','img/product/md/2_6.jpg','img/product/lg/2_6.jpg'),
	(null,3,'img/product/sm/3_1.jpg','img/product/md/3_1.jpg','img/product/lg/3_1.jpg'),
	(null,3,'img/product/sm/3_2.jpg','img/product/md/3_2.jpg','img/product/lg/3_2.jpg'),
	(null,3,'img/product/sm/3_3.jpg','img/product/md/3_3.jpg','img/product/lg/3_3.jpg'),
	(null,3,'img/product/sm/3_4.jpg','img/product/md/3_4.jpg','img/product/lg/3_4.jpg'),
	(null,3,'img/product/sm/3_5.jpg','img/product/md/3_5.jpg','img/product/lg/3_5.jpg'),
	(null,4,'img/product/sm/4_1.jpg','img/product/md/4_1.jpg','img/product/lg/4_1.jpg'),
	(null,4,'img/product/sm/4_2.jpg','img/product/md/4_2.jpg','img/product/lg/4_2.jpg'),
	(null,4,'img/product/sm/4_3.jpg','img/product/md/4_3.jpg','img/product/lg/4_3.jpg'),
	(null,5,'img/product/sm/5_1.jpg','img/product/md/5_1.jpg','img/product/lg/5_1.jpg'),
	(null,5,'img/product/sm/5_2.jpg','img/product/md/5_2.jpg','img/product/lg/5_2.jpg'),
	(null,5,'img/product/sm/5_3.jpg','img/product/md/5_3.jpg','img/product/lg/5_3.jpg'),
	(null,5,'img/product/sm/5_4.jpg','img/product/md/5_4.jpg','img/product/lg/5_4.jpg'),
	(null,5,'img/product/sm/5_5.jpg','img/product/md/5_5.jpg','img/product/lg/5_5.jpg'),
	(null,5,'img/product/sm/5_6.jpg','img/product/md/5_6.jpg','img/product/lg/5_6.jpg'),
	(null,5,'img/product/sm/5_7.jpg','img/product/md/5_7.jpg','img/product/lg/5_7.jpg'),
	(null,6,'img/product/sm/6_1.jpg','img/product/md/6_1.jpg','img/product/lg/6_1.jpg'),
	(null,6,'img/product/sm/6_2.jpg','img/product/md/6_2.jpg','img/product/lg/6_2.jpg'),
	(null,6,'img/product/sm/6_3.jpg','img/product/md/6_3.jpg','img/product/lg/6_3.jpg'),
	(null,6,'img/product/sm/6_4.jpg','img/product/md/6_4.jpg','img/product/lg/6_4.jpg'),
	(null,7,'img/product/sm/7_1.jpg','img/product/md/7_1.jpg','img/product/lg/7_1.jpg'),
	(null,7,'img/product/sm/7_2.jpg','img/product/md/7_2.jpg','img/product/lg/7_2.jpg'),
	(null,7,'img/product/sm/7_3.jpg','img/product/md/7_3.jpg','img/product/lg/7_3.jpg'),
	(null,7,'img/product/sm/7_4.jpg','img/product/md/7_4.jpg','img/product/lg/7_4.jpg'),
	(null,7,'img/product/sm/7_5.jpg','img/product/md/7_5.jpg','img/product/lg/7_5.jpg'),
	(null,7,'img/product/sm/7_6.jpg','img/product/md/7_6.jpg','img/product/lg/7_6.jpg'),
	(null,8,'img/product/sm/8_1.jpg','img/product/md/8_1.jpg','img/product/lg/8_1.jpg'),
	(null,8,'img/product/sm/8_2.jpg','img/product/md/8_2.jpg','img/product/lg/8_2.jpg'),
	(null,8,'img/product/sm/8_3.jpg','img/product/md/8_3.jpg','img/product/lg/8_3.jpg'),
	(null,8,'img/product/sm/8_4.jpg','img/product/md/8_4.jpg','img/product/lg/8_4.jpg'),
	(null,8,'img/product/sm/8_5.jpg','img/product/md/8_5.jpg','img/product/lg/8_5.jpg'),
	(null,9,'img/product/sm/9_1.jpg','img/product/md/9_1.jpg','img/product/lg/9_1.jpg'),
	(null,9,'img/product/sm/9_2.jpg','img/product/md/9_2.jpg','img/product/lg/9_2.jpg'),
	(null,9,'img/product/sm/9_3.jpg','img/product/md/9_3.jpg','img/product/lg/9_3.jpg'),
	(null,9,'img/product/sm/9_4.jpg','img/product/md/9_4.jpg','img/product/lg/9_4.jpg'),
	(null,9,'img/product/sm/9_5.jpg','img/product/md/9_5.jpg','img/product/lg/9_5.jpg'),
	(null,10,'img/product/sm/1_1.jpg','img/product/md/1_1.jpg','img/product/lg/1_1.jpg'),
	(null,10,'img/product/sm/1_2.jpg','img/product/md/1_2.jpg','img/product/lg/1_2.jpg'),
	(null,10,'img/product/sm/1_3.jpg','img/product/md/1_3.jpg','img/product/lg/1_3.jpg'),
	(null,10,'img/product/sm/1_4.jpg','img/product/md/1_4.jpg','img/product/lg/1_4.jpg'),
	(null,10,'img/product/sm/1_5.jpg','img/product/md/1_5.jpg','img/product/lg/1_5.jpg'),
	(null,10,'img/product/sm/1_6.jpg','img/product/md/1_6.jpg','img/product/lg/1_6.jpg'),
	(null,10,'img/product/sm/1_7.jpg','img/product/md/1_7.jpg','img/product/lg/1_7.jpg'),
	(null,11,'img/product/sm/11_1.jpg','img/product/md/11_1.jpg','img/product/lg/11_1.jpg'),
	(null,11,'img/product/sm/11_2.jpg','img/product/md/11_2.jpg','img/product/lg/11_2.jpg'),
	(null,11,'img/product/sm/11_3.jpg','img/product/md/11_3.jpg','img/product/lg/11_3.jpg'),
	(null,11,'img/product/sm/11_4.jpg','img/product/md/11_4.jpg','img/product/lg/11_4.jpg'),
	(null,11,'img/product/sm/11_5.jpg','img/product/md/11_5.jpg','img/product/lg/11_5.jpg'),
	(null,11,'img/product/sm/11_6.jpg','img/product/md/11_6.jpg','img/product/lg/11_6.jpg'),
	(null,11,'img/product/sm/11_7.jpg','img/product/md/11_7.jpg','img/product/lg/11_7.jpg');


#vue_app_server/db.sql
#1:进入库  mll
USE mll;

#1:创建商品评论表 39
#   表名 几列 列名
#   mll_bed_comment
#   id        INT          评论编号
#   bid       INT          评论所属商品编号
#   user_name VARCHAR(25)   评论人名称
#   ctime     DATETIME      时间
#   content   VARCHAR(120)  内容

CREATE TABLE mll_bed_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  bid INT,
  user_name VARCHAR(25),
  ctime DATETIME,
  content VARCHAR(120)
);
#2:添加15条
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'111');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'112');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'113');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'114');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'115');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'116');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'117');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'118');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'119');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1110');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1111');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1112');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1113');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1114');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1115');
INSERT INTO mll_bed_comment VALUES(null,1,'dd',now(),'1116');

#1:创建商品详情图片表 39
#   表名 几列 列名
#   mll_bed_pic2
#   pid        INT          图片编号
#   bed_id       INT        所属商品编号
#   md VARCHAR(120)					中图片
#   lg VARCHAR(120)					大图片

CREATE TABLE mll_bed_pic2(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #图片编号   
  bed_id INT,       #所属商品编号
  md VARCHAR(120),	#中图片
	lg VARCHAR(120)		#大图片
);
#2:添加数据
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_1.jpg','http://127.0.0.1:3001/product/lg/1_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_2.jpg','http://127.0.0.1:3001/product/lg/1_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_3.jpg','http://127.0.0.1:3001/product/lg/1_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_4.jpg','http://127.0.0.1:3001/product/lg/1_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_5.jpg','http://127.0.0.1:3001/product/lg/1_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_6.jpg','http://127.0.0.1:3001/product/lg/1_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_7.jpg','http://127.0.0.1:3001/product/lg/1_7.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,1,'http://127.0.0.1:3001/product/md/1_8.jpg','http://127.0.0.1:3001/product/lg/1_8.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_1.jpg','http://127.0.0.1:3001/product/lg/2_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_2.jpg','http://127.0.0.1:3001/product/lg/2_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_3.jpg','http://127.0.0.1:3001/product/lg/2_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_4.jpg','http://127.0.0.1:3001/product/lg/2_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_5.jpg','http://127.0.0.1:3001/product/lg/2_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,2,'http://127.0.0.1:3001/product/md/2_6.jpg','http://127.0.0.1:3001/product/lg/2_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,3,'http://127.0.0.1:3001/product/md/3_1.jpg','http://127.0.0.1:3001/product/lg/3_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,3,'http://127.0.0.1:3001/product/md/3_2.jpg','http://127.0.0.1:3001/product/lg/3_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,3,'http://127.0.0.1:3001/product/md/3_3.jpg','http://127.0.0.1:3001/product/lg/3_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,3,'http://127.0.0.1:3001/product/md/3_4.jpg','http://127.0.0.1:3001/product/lg/3_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,3,'http://127.0.0.1:3001/product/md/3_5.jpg','http://127.0.0.1:3001/product/lg/3_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,4,'http://127.0.0.1:3001/product/md/4_1.jpg','http://127.0.0.1:3001/product/lg/4_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,4,'http://127.0.0.1:3001/product/md/4_2.jpg','http://127.0.0.1:3001/product/lg/4_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,4,'http://127.0.0.1:3001/product/md/4_3.jpg','http://127.0.0.1:3001/product/lg/4_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_1.jpg','http://127.0.0.1:3001/product/lg/5_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_2.jpg','http://127.0.0.1:3001/product/lg/5_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_3.jpg','http://127.0.0.1:3001/product/lg/5_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_4.jpg','http://127.0.0.1:3001/product/lg/5_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_5.jpg','http://127.0.0.1:3001/product/lg/5_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_6.jpg','http://127.0.0.1:3001/product/lg/5_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,5,'http://127.0.0.1:3001/product/md/5_7.jpg','http://127.0.0.1:3001/product/lg/5_7.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,6,'http://127.0.0.1:3001/product/md/6_1.jpg','http://127.0.0.1:3001/product/lg/6_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,6,'http://127.0.0.1:3001/product/md/6_2.jpg','http://127.0.0.1:3001/product/lg/6_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,6,'http://127.0.0.1:3001/product/md/6_3.jpg','http://127.0.0.1:3001/product/lg/6_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,6,'http://127.0.0.1:3001/product/md/6_4.jpg','http://127.0.0.1:3001/product/lg/6_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_1.jpg','http://127.0.0.1:3001/product/lg/7_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_2.jpg','http://127.0.0.1:3001/product/lg/7_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_3.jpg','http://127.0.0.1:3001/product/lg/7_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_4.jpg','http://127.0.0.1:3001/product/lg/7_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_5.jpg','http://127.0.0.1:3001/product/lg/7_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,7,'http://127.0.0.1:3001/product/md/7_6.jpg','http://127.0.0.1:3001/product/lg/7_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,8,'http://127.0.0.1:3001/product/md/8_1.jpg','http://127.0.0.1:3001/product/lg/8_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,8,'http://127.0.0.1:3001/product/md/8_2.jpg','http://127.0.0.1:3001/product/lg/8_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,8,'http://127.0.0.1:3001/product/md/8_3.jpg','http://127.0.0.1:3001/product/lg/8_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,8,'http://127.0.0.1:3001/product/md/8_4.jpg','http://127.0.0.1:3001/product/lg/8_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,8,'http://127.0.0.1:3001/product/md/8_5.jpg','http://127.0.0.1:3001/product/lg/8_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,9,'http://127.0.0.1:3001/product/md/9_1.jpg','http://127.0.0.1:3001/product/lg/9_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,9,'http://127.0.0.1:3001/product/md/9_2.jpg','http://127.0.0.1:3001/product/lg/9_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,9,'http://127.0.0.1:3001/product/md/9_3.jpg','http://127.0.0.1:3001/product/lg/9_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,9,'http://127.0.0.1:3001/product/md/9_4.jpg','http://127.0.0.1:3001/product/lg/9_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,9,'http://127.0.0.1:3001/product/md/9_5.jpg','http://127.0.0.1:3001/product/lg/9_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_1.jpg','http://127.0.0.1:3001/product/lg/1_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_2.jpg','http://127.0.0.1:3001/product/lg/1_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_3.jpg','http://127.0.0.1:3001/product/lg/1_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_4.jpg','http://127.0.0.1:3001/product/lg/1_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_5.jpg','http://127.0.0.1:3001/product/lg/1_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_6.jpg','http://127.0.0.1:3001/product/lg/1_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_7.jpg','http://127.0.0.1:3001/product/lg/1_7.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,10,'http://127.0.0.1:3001/product/md/1_8.jpg','http://127.0.0.1:3001/product/lg/1_8.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_1.jpg','http://127.0.0.1:3001/product/lg/11_1.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_2.jpg','http://127.0.0.1:3001/product/lg/11_2.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_3.jpg','http://127.0.0.1:3001/product/lg/11_3.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_4.jpg','http://127.0.0.1:3001/product/lg/11_4.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_5.jpg','http://127.0.0.1:3001/product/lg/11_5.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_6.jpg','http://127.0.0.1:3001/product/lg/11_6.jpg');
INSERT INTO mll_bed_pic2 VALUES(null,11,'http://127.0.0.1:3001/product/md/11_7.jpg','http://127.0.0.1:3001/product/lg/11_7.jpg');

#用户登录表
CREATE TABLE mll_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25) ,
  upwd VARCHAR(32) NOT NULL DEFAULT ''
);
INSERT INTO mll_login VALUES(null,'ddd',md5('123'));
INSERT INTO mll_login VALUES(null,'aaa',md5('123'));
INSERT INTO mll_login VALUES(null,'www',md5('123'));



