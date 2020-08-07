# 个人交易记录
create table `stock_trade_deatail` (
	`stock_code` varchar(20)  COMMENT '代码',
	`stock_name` varchar(50) DEFAULT NULL COMMENT '名称',
	`start_price` decimal(10,3) DEFAULT NULL COMMENT '开盘价',
	`end_price`   decimal(10,3) DEFAULT NULL COMMENT '收盘价',
	`high_price`  decimal(10,3)  DEFAULT NULL COMMENT '最高价',
	`lower_price` decimal(10,3) DEFAULT NULL COMMENT '最低价',
	`buy_price`   decimal(10,3) DEFAULT NULL COMMENT '买入价',
     `buy_quantity` decimal(10) DEFAULT NULL COMMENT '买入数量',
    `sale_price`  decimal(10,3) DEFAULT NULL COMMENT '卖出价',
	`sale_quantity` decimal(10) DEFAULT NULL COMMENT '卖出数量',
    `stock_profit` decimal(10,3) DEFAULT NULL COMMENT '盈利',
	`trade_date`  date DEFAULT NULL COMMENT '交易日',
	`stock_type` char(2) DEFAULT NULL COMMENT '分类',
    `stock_sub_type` char(2) DEFAULT NULL COMMENT '子分类',
    primary key(stock_code,trade_date)
)  ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
    
   

select * from hk_stocks where dm = '601658';
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

# us_technology:us科技股
create table `us_technology` (
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

    select * from us_technology order by zdf desc limit 20 ;
    select count(*) from us_technology;
    
# us_financial:us金融股
create table `us_financial` (
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

    select * from us_financial order by zdf desc limit 20 ;
    select count(*) from us_financial;
    
# us_medicine_food:us医药食品
create table `us_medicine_food` (
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

    select * from us_medicine_food order by zdf desc limit 20 ;
    select count(*) from us_medicine_food;
    
# us_media:us媒体
create table `us_media` (
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

    select * from us_media order by zdf desc limit 20 ;
    select count(*) from us_media;
    
# us_automotive_energy:us汽车能源类
create table `us_automotive_energy` (
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

    select * from us_automotive_energy order by zdf desc limit 20 ;
    select count(*) from us_automotive_energy;


# us_manufacture_retail:us制造零售类
create table `us_manufacture_retail` (
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

    select * from us_manufacture_retail order by zdf desc limit 20 ;
    select count(*) from us_manufacture_retail;
    
# us_chinese:us中国概念股
create table `us_chinese` (
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

    select * from us_chinese order by zdf desc limit 20 ;
    select count(*) from us_chinese;
    
 #-------------------沪深港股通-----------------------------
 
  create table if not exists sh_sz_hk_stocks (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值',
	 `rq`  date DEFAULT NULL COMMENT '日期',
     `fl`  char(2) DEFAULT NULL COMMENT '分类',
    primary key(f12,rq)
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sh_sz_hk_stocks order by f3 desc limit 20 ;
    select count(*) from sh_sz_hk_stocks;

# sz_hk_board
 create table if not exists sh_hk_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sh_hk_board order by f3 desc limit 20 ;
    select count(*) from sh_hk_board;
    
# sz_hk_board
 create table if not exists sz_hk_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sz_hk_board order by f3 desc limit 20 ;
    select count(*) from sz_hk_board;
    
# hk_sh_stocks 港股通（沪）
 create table if not exists hk_sh_stocks (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from hk_sh_stocks order by f3 desc limit 20 ;
    select count(*) from hk_sh_stocks;
    
# hk_sz_stocks 港股通（深）
 create table if not exists hk_sz_stocks (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from hk_sz_stocks order by f3 desc limit 20 ;
    select count(*) from hk_sz_stocks;
    
# ah_comparison AH股比价
 create table if not exists ah_comparison (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from ah_comparison order by f3 desc limit 20 ;
    select count(*) from ah_comparison;
    
 #-------------------A股-----------------------------
 
 create table if not exists a_stocks (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值',
	 `rq`  date DEFAULT NULL COMMENT '日期',
     `fl`  char(2) DEFAULT NULL COMMENT '分类',
    primary key(f12,rq)
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


# hs_a_board 沪深A股
 create table if not exists hs_a_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from hs_a_board order by f3 desc limit 20 ;
    select count(*) from hs_a_board;

# sh_a_board 上证A股
 create table if not exists sh_a_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sh_a_board order by f3 desc limit 20 ;
    select count(*) from sh_a_board;
    
# sz_a_board 深证A股
 create table if not exists sz_a_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sz_a_board order by f3 desc limit 20 ;
    select count(*) from sz_a_board;
    
# newshares 新版
 create table if not exists newshares (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from newshares order by f3 desc limit 20 ;
    select count(*) from newshares;
    
# sme_board 中小板
 create table if not exists sme_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from sme_board order by f3 desc limit 20 ;
    select count(*) from sme_board;
    
# gem_board 创业板
 create table if not exists gem_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from gem_board order by f3 desc limit 20 ;
    select count(*) from gem_board;
    
# kcb_board 科创板
 create table if not exists kcb_board (	
	`f1`  varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f2`  decimal(10,3) DEFAULT NULL COMMENT '最新价',
	`f3`  decimal(10,2) DEFAULT NULL COMMENT '涨跌幅',
	`f4`  decimal(10,3)  DEFAULT NULL COMMENT '涨跌额',
	`f5`  decimal(20) DEFAULT NULL COMMENT '成交量',
	`f6`  decimal(20) DEFAULT NULL COMMENT '成交额',
	`f7`  decimal(10,2) DEFAULT NULL COMMENT '振幅',
	`f8`  decimal(10,2) DEFAULT NULL COMMENT '换手率',
	`f9`  decimal(10,2) DEFAULT NULL COMMENT ' 市盈率(动态)',
	`f10` decimal(10,2) DEFAULT NULL COMMENT ' 量比',
	`f11` decimal(10,2) DEFAULT NULL COMMENT ' ',
	`f12` varchar(20)  COMMENT '代码',
	`f13` varchar(3)  DEFAULT NULL COMMENT '固定值',
	`f14` varchar(50) DEFAULT NULL COMMENT '名称',
	`f15` decimal(10,3) DEFAULT NULL COMMENT '最高',
	`f16` decimal(10,3) DEFAULT NULL COMMENT '最低',
	`f17` decimal(10,3) DEFAULT NULL COMMENT '今开',
	`f18`  decimal(10,3) DEFAULT NULL COMMENT '昨收',
	`f20`  decimal(20) DEFAULT NULL COMMENT '总市值',   
	`f21` decimal(20) DEFAULT NULL COMMENT '流通市值',   
	`f22` decimal(10,3) DEFAULT NULL COMMENT '',
	`f23` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f24` decimal(10,3) DEFAULT NULL COMMENT '最近3个月累计涨跌幅',
	`f25` decimal(10,3) DEFAULT NULL COMMENT '今年以来累计涨幅',
	`f26` date DEFAULT NULL COMMENT '上市时间',
	`f62` decimal(22,2) DEFAULT NULL COMMENT '净流入额', 
	`f115` decimal(10,3) DEFAULT NULL COMMENT '市净率',
	`f128`  varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f140` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f141` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f136` varchar(10)  DEFAULT NULL COMMENT '固定值',
	`f152` varchar(3)  DEFAULT NULL COMMENT '固定值'
    ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
    
    select * from kcb_board order by f3 desc limit 20 ;
    select count(*) from kcb_board;