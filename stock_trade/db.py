import sqlite3

conn = sqlite3.connect("stock_trade.db")
print("open succsss")


sql = '''
create table if not exists stock_trade_deatail  (
	stock_code varchar(20) ,
	stock_name varchar(50) DEFAULT NULL ,
	start_price decimal(10,3) DEFAULT NULL ,
	end_price   decimal(10,3) DEFAULT NULL ,
	high_price  decimal(10,3)  DEFAULT NULL ,
	lower_price decimal(10,3) DEFAULT NULL ,
	buy_price   decimal(10,3) DEFAULT NULL ,
     buy_quantity decimal(10) DEFAULT NULL ,
    sale_price  decimal(10,3) DEFAULT NULL ,
	sale_quantity decimal(10) DEFAULT NULL ,
    stock_profit decimal(10,3) DEFAULT NULL ,
	trade_date  date DEFAULT NULL ,
	stock_type char(2) DEFAULT NULL ,
    stock_sub_type char(2) DEFAULT NULL,
    primary key(stock_code,trade_date)
)  
'''

cusor = conn.cursor()
cusor.execute(sql)
conn.commit()
conn.close()