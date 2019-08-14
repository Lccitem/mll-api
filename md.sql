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

