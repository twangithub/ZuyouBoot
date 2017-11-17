--用户
if not exists(select 1 from sysobjects where name = 'zyuser' and type = 'U')
begin
    create table zyuser
    (
        id   int  identity  NOT NULL ,  
        phone varchar(30) null,--电话/登录账号
        password varchar(20) null,--密码
        name varchar(100) null,--姓名
        flag tinyint null default 1,--是否启用改员工
        signature varchar(200) null default 'No description',--个性签名
        type varchar(100) null,--门店职位类型
        sex tinyint null default 1,--性别
        idcard varchar(50) null,--身份证
        qq varchar(50) null,--qq
        wechat varchar(50) null,--微信
        deviceid varchar(100) null,--设备id
        shopid varchar(50) null,--门店id
        rank varchar(50) null,--门店身份
        addr varchar(200) null,--住址
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_user_id PRIMARY KEY (id)
    )
end
GO

insert into zyuser VALUES ('13112345671','','1号技师',1,'个性签名','足浴师',1,'421182199011113131','599054901','tuhuan32001','deviceid1','shop#1','manager','上海',getdate(),getdate())
insert into zyuser VALUES ('13112345672','','2号技师',1,'个性签名','足浴师',0,'421182199011123131','599054902','tuhuan32002','deviceid2','shop#1','techicine','上海',getdate(),getdate())
insert into zyuser VALUES ('13112345673','','3号技师',1,'个性签名','养生师',1,'421182199011133131','599054903','tuhuan32003','deviceid3','shop#1','techicine','上海',getdate(),getdate())
insert into zyuser VALUES ('13112345674','','4号技师',1,'个性签名','养生师',0,'421182199011143131','599054904','tuhuan32004','deviceid4','shop#1','techicine','上海',getdate(),getdate())

--门店
if not exists(select 1 from sysobjects where name = 'zyshop' and type = 'U')
begin
    create table zyshop
    (
        id   int  identity  NOT NULL ,  
        shopid varchar(50) not null,--门店id
        shopname varchar(100) null,--门店名称
        shopphone varchar(50) null,--门店电话
        shopdec varchar(200) null,--门店介绍
        shopmaster varchar(50) null,--门店拥有者的电话
        shopaddr varchar(200) null,--门店地址
        license varchar(200) null,--工商营业执照编号
        img1 varchar(100) null,--门店图片1
        img2 varchar(100) null,--门店图片2
        img3 varchar(100) null,--门店图片3
        img4 varchar(100) null,--门店图片4
        img5 varchar(100) null,--门店图片5
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_shop_id PRIMARY KEY (id)
    )
end
GO

--收银
if not exists(select 1 from sysobjects where name = 'zycash' and type = 'U')
begin
    create table zycash
    (
        id   int  identity  NOT NULL ,  
        billid varchar(50) not null,
        roomid int null,
        projectid int null,
        member varchar(20) null,--客户姓名/散客
        total varchar(20) null,--总金额
        paytype1 varchar(20) null,--支付方式
        pay1 float null,
        paytype2 varchar(20) null,--支付方式2
        pay2 float null,
        paytype3 varchar(20) null,--支付方式3
        pay3 float null,
        operator varchar(50) null,--操作者
        zike varchar(50) null,--咨客/推荐人
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_cash_id PRIMARY KEY (billid)
    )
end
GO

--排钟
if not exists(select 1 from sysobjects where name = 'zyturn' and type = 'U')
begin
    create table zyturn
    (
        id   int  identity  NOT NULL ,
        turnid varchar(50) not null,  
        billid varchar(50) not null,
        roomid varchar(50) null,
        projectid int null,
        member varchar(20) null,--客户姓名/散客
        istimer tinyint default 0 null,--是否计时
        operator varchar(50) null,--操作者
        zike varchar(50) null,--咨客/推荐人
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_turn_id PRIMARY KEY (turnid)
    )
end
GO

--项目
if not exists(select 1 from sysobjects where name = 'zyprogram' and type = 'U')
begin
    create table zyprogram
    (
        id   int  identity  NOT NULL ,
        proid int not null,
        proname varchar(50) null, --项目名称
        protype varchar(50) null, --项目类别    
        istimer tinyint default 0 null,--是否计时
        
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_program_id PRIMARY KEY (proid)
    )
end
GO

insert into zyprogram values(1,'古法足浴','足浴类',0,getdate(),getdate())
insert into zyprogram values(2,'中式足疗','足浴类',0,getdate(),getdate())
insert into zyprogram values(3,'经典推拿','足浴类',1,getdate(),getdate())
insert into zyprogram values(4,'魅蓝诱惑','养生类',0,getdate(),getdate())
insert into zyprogram values(5,'千年红运','养生类',0,getdate(),getdate())
insert into zyprogram values(6,'妖娆足浴','养生类',1,getdate(),getdate())
insert into zyprogram values(7,'全身桑拿','养生类',0,getdate(),getdate())

--产品
if not exists(select 1 from sysobjects where name = 'zygood' and type = 'U')
begin
    create table zygood
    (
        id   int  identity  NOT NULL ,
        goodid int not null,
        goodname varchar(50) null, --产品名称
        goodtype varchar(50) null, --产品类别    
        istimer tinyint default 0 null,--是否计时
        
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_good_id PRIMARY KEY (goodid)
    )
end
GO

insert into zygood values(1,'炒粉','小吃类',0,getdate(),getdate())
insert into zygood values(2,'蟹黄面','小吃类',0,getdate(),getdate())
insert into zygood values(3,'包子','小吃类',0,getdate(),getdate())
insert into zygood values(4,'西瓜','水果类',0,getdate(),getdate())
insert into zygood values(5,'橘子','水果类',0,getdate(),getdate())
insert into zygood values(6,'红枣','水果类',0,getdate(),getdate))
insert into zygood values(7,'大拼盘','水果类',0,getdate(),getdate())

--房间
if not exists(select 1 from sysobjects where name = 'zyroom' and type = 'U')
begin
    create table zyroom
    (
        id   int  identity  NOT NULL ,
        roomid int not null,
        roomname varchar(50) null, --房间名称
        rtype varchar(50) null,--房间类别
        bedcnt int null,--床位
        istimer tinyint default 0 null,--是否计时
        
        logtime datetime default getdate() null,--更新时间
        createtime datetime default getdate() null--创建时间       
        
        CONSTRAINT zy_room_id PRIMARY KEY (roomid)
    )
end
GO
insert into zyroom values (1,'1号房间','通用房',4,0,GETDATE(),GETDATE())
insert into zyroom values (2,'2号房间','通用房',5,0,GETDATE(),GETDATE())
insert into zyroom values (3,'3号房间','通用房',4,0,GETDATE(),GETDATE())
insert into zyroom values (4,'4号房间','通用房',5,0,GETDATE(),GETDATE())
insert into zyroom values (5,'5号房间','通用房',4,0,GETDATE(),GETDATE())
insert into zyroom values (6,'6号房间','通用房',6,0,GETDATE(),GETDATE())
insert into zyroom values (7,'7号房间','通用房',4,0,GETDATE(),GETDATE())
insert into zyroom values (8,'8号房间','通用房',5,0,GETDATE(),GETDATE())