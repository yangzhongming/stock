create database stock_eastmoney_db default char set utf8;

use stock_eastmoney_db;

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

select * from hk_mainboard order by zdf desc limit 20;

select count(*) from hk_mainboard;

# hk_mainboard:创业板
create table `hk_gem` (
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

select * from hk_gem order by zdf desc limit 20;

select count(*) from hk_gem;



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

    select * from hk_wellknown order by zdf desc limit 20 ;
    select count(*) from hk_wellknown;
    
# hk_bluechips:蓝筹股
create table `hk_bluechips` (
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

    select * from hk_bluechips order by zdf desc limit 20 ;
    select count(*) from hk_bluechips;

# hk_redchips:红筹股 4
create table `hk_redchips` (
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

    select * from hk_redchips order by zdf desc limit 20 ;
    select count(*) from hk_redchips;
 