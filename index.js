//引入模块
const express=require('express');
const pool=require('./pool');
const cors=require('cors');
//创建express对象
var app=express();
//指定监听端口
// app.listen(3001);
app.listen(5050);
//指定静态目录 pulic
//__dirname 当前程序所受目录绝对路径
app.use(express.static(__dirname+'/pulic'));
//配置允许程序跨域访问
app.use(cors({
	origin:'*',
	credentials:true
}));

//7.1:加载第三方模块  express-session
const session=require("express-session");
//7.2:对模块配置
app.use(session({
  secret:"128位随机字符",      //安全字符串
  resave:false,               //请求保存
  saveUninitialized:true,      //初始化保存
  cookie:{
    maxAge:1000 * 60 * 60 * 24
  }
}));
//轮播图
//请求 /imageslist
  app.get('/imagelist',(req,res)=>{
    // var obj=[{id:1,img_url:"http://127.0.0.1:3001/img/banner1.jpg"},
    //   {id:2,img_url:"http://127.0.0.1:3001/img/banner2.jpg"},
    //   {id:3,img_url:"http://127.0.0.1:3001/img/banner3.jpg"},
    //   {id:4,img_url:"http://127.0.0.1:3001/img/banner4.jpg"}
    // ]
    var obj=[{id:1,img_url:"http://mllapi.applinzi.com/img/banner1.jpg"},
      {id:2,img_url:"http://mllapi.applinzi.com/img/banner2.jpg"},
      {id:3,img_url:"http://mllapi.applinzi.com/img/banner3.jpg"},
      {id:4,img_url:"http://mllapi.applinzi.com/img/banner4.jpg"}
    ]
    res.send(obj);
  });
// 功能一:搜索商品
// 如果参数很多，用另一种方法
// 判断当传的参数不为undefined时，进行sql语句的AND拼接
  app.get("/search",(req,res)=>{
    //1:获取参数  商品名称关键字
    var keyword=req.query.keyword;
        var low=req.query.low;    //最低价
        var high=req.query.high;  //最高价
        var sql="SELECT bid,title,price,old,pic_md FROM mll_bed WHERE title LIKE ?"
        sql+=" AND price >= ?";
        sql+=" AND price <= ?";
        low=parseInt(low);
        high=parseInt(high);
        pool.query(sql,[`%${keyword}%`,low,high],(err,result)=>{
        if(err)throw err;
        if(result.length==0){
          res.send({code:-1,msg:"您搜索的商品不存在噢！"})
        }else{
          res.send({code:1,data:result});
        }
    })
  });
//功能二：查询商品列表
  app.get("/products",(req,res)=>{
    var sql="SELECT bid,title,price,old,pic_md FROM mll_bed"
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send(result);
        // res.setHeader(200,{"Content-Type":"application/json,charset=utf-8","Access-Control-Allow-Origin":"*"});
    });
  });
//功能三：查询商品详情图片列表
  app.get("/details",(req,res)=>{
    var bid=req.query.bid;
    var output={
          pics:[/*图片*/],
          content:{/*信息*/},
          specs:[/*规格*/]
      };
    var sql="SELECT md,lg FROM mll_bed_pic2 WHERE bed_id=?";
    bid=parseInt(bid);
    pool.query(sql,[bid],(err,result)=>{
      if(err)throw err;
      output.pics=result;
        var sql="SELECT * FROM mll_bed WHERE bid=?"
        pool.query(sql,[bid],(err,result)=>{
          if(err)throw err;
        //  res.setHeader(200,{"Content-Type":"application/json,charset=utf-8","Access-Control-Allow-Origin":"*"});
          output.content=result[0];
            var model=output.content.model;
            var sql="select bid,spec from mll_bed where model=?";
            pool.query(sql,[model],(err,result)=>{
              if(err) console.log(err);
              output.specs=result;
              res.send(output);
          });
        });
      });
    });
//功能四：用户登录
  app.get("/login",(req,res)=>{
    //1.获取参数uname,upwd
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //2:创建正则表达式
    //3:创建sql语句
    var sql="SELECT count(uid) as c,uid FROM mll_user WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err)throw err;
      var obj=result[0].c;
      if(obj==1){
        req.session.uname = uname;
        req.session.uid=result[0].uid;
        res.send({code:1,uname:uname});
      }else{
        res.send({code:-1,msg:"用户名或密码有误"});
      }
    });
  });
//功能五：添加购物车
  app.get("/addCart",(req,res)=>{
    //1:获取3个参数
    //需要第三方模块支持 bodyParser
    var uid=req.session.uid;
    if(!uid){
      res.send({code:-1,msg:"请先登录"});
      return;
    }
    var bid = req.query.bid;
    var c = req.query.count;
    //2:创建sql语句
    var sql  =" INSERT INTO `mll_shopping_cart`(`cid`, `user_id`, `product_id`, `count`, `is_checked`) VALUES (null,?,?,?,0)"

    pool.query(sql,[uid,bid,c],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"购物车添加成功"});
    });
    //3:返回添加结果
  });

//功能六：查询购物车详细信息
  app.get("/getCarts",(req,res)=>{
  //1:获取参数  uname upwd
  var uid = req.session.uid;
  console.log(uid)
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }
  //2:创建sql
  var sql="SELECT c.cid,c.user_id,c.count";
    sql+=" ,b.price,b.title,b.pic_md";
    sql+=" FROM mll_bed b,";
    sql+=" mll_shopping_cart c";
    sql+=" WHERE b.bid = c.product_id";
    sql+=" AND c.user_id = ?";
    uid=parseInt(uid);
  //3:获取数据库数据
    pool.query(sql,[uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result});
    });
  });
//功能七:更新购物车数量
  app.get("/updateCart",(req,res)=>{
    //1:获取参数 iid/count
    var cid=req.query.cid;
    var count=req.query.count;
    //2:sql
    var sql="UPDATE mll_shopping_cart SET count=? WHERE cid=?";
    cid=parseInt(cid);
    //3:json
    pool.query(sql,[count,cid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"数量修改成功"});
      }else{
        res.send({code:-1,msg:"数量修改失败"})
      }
    });
  });
//引入第三方模块：bodyParser处理post请求
  const bodyParser=require("body-parser");
  app.use(bodyParser.urlencoded({
    //true  任意数据类型
    //false   string/array
    extended:false
  }));
//功能八:发表评论
  app.post("/addcomment",(req,res)=>{
    //1:获取三个参数
    var uid = req.session.uid;
    if(!uid){
      res.send({code:-1,msg:"请先登录"});
      return;
    }
    var bid=req.body.bid;
    var content=req.body.content;
    var uname=req.session.uname;
    //2:穿件sql语句
    var sql="INSERT INTO `mll_bed_comment`(`id`, `bid`, `user_name`, `ctime`, `content`) VALUES (null,?,?,now(),?) ";
    bid=parseInt(bid);
    pool.query(sql,[bid,uname,content],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"评论发表成功"});
    });
    //3:返回添加结果
  });

//功能九：分页查询特定商品下评论列表
  app.get("/getcomments",(req,res)=>{
    //1:获取参数
  var pno = req.query.pno;  //页码
  var pageSize = req.query.pageSize;  //页大小
  var bid=req.query.bid;  //商品bid
  //2:设置默认值 1 7
  if(!pno){pno = 1}
  if(!pageSize){pageSize=7}
  //3:创建正则表达式验证用户输入验证
  var reg = /^[0-9]{1,3}$/;
  //4:如果错出停止函数运行
  if(!reg.test(pno)){
      res.send({code:-1,msg:"页编格式不正确"});
      return;
  }
  if(!reg.test(pageSize)){
      res.send({code:-2,msg:"页大小格式不正确"});
      return;
  }

  var progress = 0;
  var obj = {code:1};
  //5:创建sql1 查询总记录数   严格区分大小写
  var sql = "SELECT count(id) AS c FROM mll_bed_comment WHERE bid=?";
  bid=parseInt(bid);
  pool.query(sql,[bid],(err,result)=>{
    if(err)throw err;
    var pageCount = Math.ceil(result[0].c/pageSize);
    var count=result[0].c;
    progress+=50;
    obj.pageCount = pageCount;
    obj.count=count;
    if(progress==100){
      res.send(obj);
    }
  });
  //6:创建sql2 查询当前页内容 严格区分大小写
  var sql =" SELECT id,user_name,ctime,";
      sql+=" content";
      sql+=" FROM mll_bed_comment";
      sql+=" WHERE bid=?";
      sql+=" ORDER BY id DESC";
      sql+=" LIMIT ?,?";
  var offset = parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    pool.query(sql,[bid,offset,pageSize],(err,result)=>{
    if(err)throw err;
    progress+=50;
    obj.data=result;
    if(progress==100){
      res.send(obj);
    }
   });
  });
//判断是否登录
  app.get("/islogin",(req,res)=>{
  var uid= req.session.uid
    if(!uid){
      res.send({code:0,msg:"没有登录"});
    }else
      res.send({code:1,msg:"已登录"});
  })
//注销
  app.get("/signouts",(req,res)=>{
    req.session.uid=undefined;
    res.send();
  })