#create database stock_db default char set utf8;

use stock_db;
#drop table stock_name;

create table `stock_name` (
	`news_id` int(4)  COMMENT '文章ID',
	`title` varchar(100) DEFAULT NULL COMMENT '文章标题',
	`abstract` varchar(100) DEFAULT NULL COMMENT '摘要',
	`stock_market` varchar(3) DEFAULT NULL COMMENT '市场区分',
	`stock_code` varchar(20) DEFAULT NULL COMMENT '股票代码',
	`stock_name`  varchar(50) DEFAULT NULL COMMENT '股票名称',
	`url` varchar(100) DEFAULT NULL COMMENT '公司网址',
	`pic`  varchar(100) DEFAULT NULL COMMENT '公司LOGO',
	`tag_class`  int(2) DEFAULT NULL COMMENT '公司分类',
	`tag_text` varchar(100) DEFAULT NULL COMMENT '备注',
    primary key(news_id)
)  ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

insert into stock_name (news_id,title,abstract,stock_market,stock_code,stock_name,url,pic,tag_class,tag_text)
values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)

SET SQL_SAFE_UPDATES = 0
use stock_db;
select * from stock_name;
#delete from stock_name;

select count(*) from stock_name
