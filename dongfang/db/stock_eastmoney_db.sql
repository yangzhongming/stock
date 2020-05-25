create database stock_eastmoney_db default char set utf8;

use stock_eastmoney_db;

#-------------------港股-----------------------------
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

# hk_stateowned:国企股 5  
create table `hk_stateowned` (
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

select * from hk_stateowned order by zdf desc limit 20 ;
select count(*) from hk_stateowned;
 
 #-------------------美股-----------------------------
#drop table us_stocks
#drop table us_wellknown

 create table if not exists us_stocks (	
	`dm` varchar(20)  COMMENT '代码',                     -- f12
	`mc` varchar(50) DEFAULT NULL COMMENT '名称',         -- f14
	`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价',    -- f2
	`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',   -- f4
	`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',    -- f3
	`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开',      -- f17
	`zg` decimal(10,3) DEFAULT NULL COMMENT '最高',       -- f15
	`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低',      -- f16
	`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收',      -- f18
	`cjl` decimal(20) DEFAULT NULL COMMENT '成交量',      -- f5
	`cje` decimal(20) DEFAULT NULL COMMENT '成交额',      -- f6
    `zsz` decimal(20) DEFAULT NULL COMMENT '总市值',      -- f20 或 f21
    `syl` decimal(20,2) DEFAULT NULL COMMENT '市盈率',      -- f115
    `rq`  date DEFAULT NULL COMMENT '日期',
    `fl`  char(2) DEFAULT NULL COMMENT '分类',
    primary key(dm,rq)
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

select * from us_stocks order by zdf desc limit 20 ;
select count(*) from us_stocks;

# us_wellknown:us知名
create table `us_wellknown` (
	`dm` varchar(20)  COMMENT '代码',
	`mc` varchar(50) DEFAULT NULL COMMENT '名称',
	`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开',
	`zg` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低',
	`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`cjl` decimal(20) DEFAULT NULL COMMENT '成交量',
    `cje` decimal(20) DEFAULT NULL COMMENT '成交额',
	`zsz` decimal(20) DEFAULT NULL COMMENT '总市值',      -- f20 或 f21
    `syl` decimal(20,2) DEFAULT NULL COMMENT '市盈率',      -- f115
    primary key(dm)
)  ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

    select * from us_wellknown order by zdf desc limit 20 ;
    select count(*) from us_wellknown;
    
