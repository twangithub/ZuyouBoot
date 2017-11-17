--�û�
if not exists(select 1 from sysobjects where name = 'zyuser' and type = 'U')
begin
    create table zyuser
    (
        id   int  identity  NOT NULL ,  
        phone varchar(30) null,--�绰/��¼�˺�
        password varchar(20) null,--����
        name varchar(100) null,--����
        flag tinyint null default 1,--�Ƿ����ø�Ա��
        signature varchar(200) null default 'No description',--����ǩ��
        type varchar(100) null,--�ŵ�ְλ����
        sex tinyint null default 1,--�Ա�
        idcard varchar(50) null,--���֤
        qq varchar(50) null,--qq
        wechat varchar(50) null,--΢��
        deviceid varchar(100) null,--�豸id
        shopid varchar(50) null,--�ŵ�id
        rank varchar(50) null,--�ŵ����
        addr varchar(200) null,--סַ
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_user_id PRIMARY KEY (id)
    )
end
GO

insert into zyuser VALUES ('13112345671','','1�ż�ʦ',1,'����ǩ��','��ԡʦ',1,'421182199011113131','599054901','tuhuan32001','deviceid1','shop#1','manager','�Ϻ�',getdate(),getdate())
insert into zyuser VALUES ('13112345672','','2�ż�ʦ',1,'����ǩ��','��ԡʦ',0,'421182199011123131','599054902','tuhuan32002','deviceid2','shop#1','techicine','�Ϻ�',getdate(),getdate())
insert into zyuser VALUES ('13112345673','','3�ż�ʦ',1,'����ǩ��','����ʦ',1,'421182199011133131','599054903','tuhuan32003','deviceid3','shop#1','techicine','�Ϻ�',getdate(),getdate())
insert into zyuser VALUES ('13112345674','','4�ż�ʦ',1,'����ǩ��','����ʦ',0,'421182199011143131','599054904','tuhuan32004','deviceid4','shop#1','techicine','�Ϻ�',getdate(),getdate())

--�ŵ�
if not exists(select 1 from sysobjects where name = 'zyshop' and type = 'U')
begin
    create table zyshop
    (
        id   int  identity  NOT NULL ,  
        shopid varchar(50) not null,--�ŵ�id
        shopname varchar(100) null,--�ŵ�����
        shopphone varchar(50) null,--�ŵ�绰
        shopdec varchar(200) null,--�ŵ����
        shopmaster varchar(50) null,--�ŵ�ӵ���ߵĵ绰
        shopaddr varchar(200) null,--�ŵ��ַ
        license varchar(200) null,--����Ӫҵִ�ձ��
        img1 varchar(100) null,--�ŵ�ͼƬ1
        img2 varchar(100) null,--�ŵ�ͼƬ2
        img3 varchar(100) null,--�ŵ�ͼƬ3
        img4 varchar(100) null,--�ŵ�ͼƬ4
        img5 varchar(100) null,--�ŵ�ͼƬ5
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_shop_id PRIMARY KEY (id)
    )
end
GO

--����
if not exists(select 1 from sysobjects where name = 'zycash' and type = 'U')
begin
    create table zycash
    (
        id   int  identity  NOT NULL ,  
        billid varchar(50) not null,
        roomid int null,
        projectid int null,
        member varchar(20) null,--�ͻ�����/ɢ��
        total varchar(20) null,--�ܽ��
        paytype1 varchar(20) null,--֧����ʽ
        pay1 float null,
        paytype2 varchar(20) null,--֧����ʽ2
        pay2 float null,
        paytype3 varchar(20) null,--֧����ʽ3
        pay3 float null,
        operator varchar(50) null,--������
        zike varchar(50) null,--�ɿ�/�Ƽ���
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_cash_id PRIMARY KEY (billid)
    )
end
GO

--����
if not exists(select 1 from sysobjects where name = 'zyturn' and type = 'U')
begin
    create table zyturn
    (
        id   int  identity  NOT NULL ,
        turnid varchar(50) not null,  
        billid varchar(50) not null,
        roomid varchar(50) null,
        projectid int null,
        member varchar(20) null,--�ͻ�����/ɢ��
        istimer tinyint default 0 null,--�Ƿ��ʱ
        operator varchar(50) null,--������
        zike varchar(50) null,--�ɿ�/�Ƽ���
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_turn_id PRIMARY KEY (turnid)
    )
end
GO

--��Ŀ
if not exists(select 1 from sysobjects where name = 'zyprogram' and type = 'U')
begin
    create table zyprogram
    (
        id   int  identity  NOT NULL ,
        proid int not null,
        proname varchar(50) null, --��Ŀ����
        protype varchar(50) null, --��Ŀ���    
        istimer tinyint default 0 null,--�Ƿ��ʱ
        
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_program_id PRIMARY KEY (proid)
    )
end
GO

insert into zyprogram values(1,'�ŷ���ԡ','��ԡ��',0,getdate(),getdate())
insert into zyprogram values(2,'��ʽ����','��ԡ��',0,getdate(),getdate())
insert into zyprogram values(3,'��������','��ԡ��',1,getdate(),getdate())
insert into zyprogram values(4,'�����ջ�','������',0,getdate(),getdate())
insert into zyprogram values(5,'ǧ�����','������',0,getdate(),getdate())
insert into zyprogram values(6,'�����ԡ','������',1,getdate(),getdate())
insert into zyprogram values(7,'ȫ��ɣ��','������',0,getdate(),getdate())

--��Ʒ
if not exists(select 1 from sysobjects where name = 'zygood' and type = 'U')
begin
    create table zygood
    (
        id   int  identity  NOT NULL ,
        goodid int not null,
        goodname varchar(50) null, --��Ʒ����
        goodtype varchar(50) null, --��Ʒ���    
        istimer tinyint default 0 null,--�Ƿ��ʱ
        
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_good_id PRIMARY KEY (goodid)
    )
end
GO

insert into zygood values(1,'����','С����',0,getdate(),getdate())
insert into zygood values(2,'з����','С����',0,getdate(),getdate())
insert into zygood values(3,'����','С����',0,getdate(),getdate())
insert into zygood values(4,'����','ˮ����',0,getdate(),getdate())
insert into zygood values(5,'����','ˮ����',0,getdate(),getdate())
insert into zygood values(6,'����','ˮ����',0,getdate(),getdate))
insert into zygood values(7,'��ƴ��','ˮ����',0,getdate(),getdate())

--����
if not exists(select 1 from sysobjects where name = 'zyroom' and type = 'U')
begin
    create table zyroom
    (
        id   int  identity  NOT NULL ,
        roomid int not null,
        roomname varchar(50) null, --��������
        rtype varchar(50) null,--�������
        bedcnt int null,--��λ
        istimer tinyint default 0 null,--�Ƿ��ʱ
        
        logtime datetime default getdate() null,--����ʱ��
        createtime datetime default getdate() null--����ʱ��       
        
        CONSTRAINT zy_room_id PRIMARY KEY (roomid)
    )
end
GO
insert into zyroom values (1,'1�ŷ���','ͨ�÷�',4,0,GETDATE(),GETDATE())
insert into zyroom values (2,'2�ŷ���','ͨ�÷�',5,0,GETDATE(),GETDATE())
insert into zyroom values (3,'3�ŷ���','ͨ�÷�',4,0,GETDATE(),GETDATE())
insert into zyroom values (4,'4�ŷ���','ͨ�÷�',5,0,GETDATE(),GETDATE())
insert into zyroom values (5,'5�ŷ���','ͨ�÷�',4,0,GETDATE(),GETDATE())
insert into zyroom values (6,'6�ŷ���','ͨ�÷�',6,0,GETDATE(),GETDATE())
insert into zyroom values (7,'7�ŷ���','ͨ�÷�',4,0,GETDATE(),GETDATE())
insert into zyroom values (8,'8�ŷ���','ͨ�÷�',5,0,GETDATE(),GETDATE())