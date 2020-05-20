create database stock_eastmoney_db default char set utf8;

use stock_eastmoney_db;

# hk_mainboard:HK主板
create table `hk_mainboard` (
	`dm` varchar(10)  COMMENT '代码',
	`mc` varchar(30) DEFAULT NULL COMMENT '名称',
	`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开',
	`zg`  decimal(10,3) DEFAULT NULL COMMENT '最高',
	`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低',
	`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`cjl` decimal(20) DEFAULT NULL COMMENT '成交量',
    `cje` decimal(20) DEFAULT NULL COMMENT '成交额',
    primary key(dm)
)  ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

select * from hk_mainboard ;

select count(*) from hk_mainboard;


create table if not exists hk_stocks (	
	`dm` varchar(10)  COMMENT '代码',
	`mc` varchar(30) DEFAULT NULL COMMENT '名称',
	`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开',
	`zg` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低',
	`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`cjl` decimal(20) DEFAULT NULL COMMENT '成交量',
    `cje` decimal(20) DEFAULT NULL COMMENT '成交额',
    `rq`  date DEFAULT NULL COMMENT '日期',
    `fl`  char(2) DEFAULT NULL COMMENT '分类',
    primary key(dm,rq)
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
   

    select * from hk_stocks ;
    select count(*) from hk_stocks;
    
create table `test` (
	`je1` varchar(10),
	`je2` decimal(10,2),
	`je3` int
);
insert into test(je1,je2,je3)  values('1',1,1);
insert into test(je1,je2,je3)  values('0.1',0.1,0.1);
insert into test(je1,je2,je3)  values('-0.1',-0.1,-0.1);
insert into test(je1,je2,je3)  values('-',1,1);
insert into test(je1,je2,je3)  values('-1',-1,-1);
insert into test(je1,je2,je3)  values('-2',-3,-3);
insert into test(je1,je2,je3)  values('-3',-1,-3);
select * from test order by je2 desc;
####################################################

# hk_mainboard:HK知名
create table `hk_wellknown` (
	`dm` varchar(10)  COMMENT '代码',
	`mc` varchar(30) DEFAULT NULL COMMENT '名称',
	`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开',
	`zg` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低',
	`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`cjl` decimal(20) DEFAULT NULL COMMENT '成交量',
    `cje` decimal(20) DEFAULT NULL COMMENT '成交额',
    primary key(dm)
)  ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

    select * from hk_wellknown order by zdf desc limit 19 ;
    select count(*) from hk_wellknown;
    
    select count(*) from hk_stocks t where t.fl = 2