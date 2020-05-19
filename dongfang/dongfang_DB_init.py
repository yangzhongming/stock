import pymysql

db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='root',
                     database='stock_eastmoney_db',
                     charset='utf8mb4')


sql_select = "select `dm` from `hk_mainboard`"



def init_table():
    sql_create = "create table if not exists {} (" \
                 "`dm` varchar(10)  COMMENT '代码'," \
                 "`mc` varchar(30) DEFAULT NULL COMMENT '名称'," \
                 "`zxj` decimal(10,3) DEFAULT NULL COMMENT '最新价'," \
                 "`zde` decimal(10,3)  DEFAULT NULL COMMENT '涨跌额'," \
                 "`zdf` decimal(10,2) DEFAULT NULL COMMENT '涨跌幅'," \
                 "`jk`  decimal(10,3) DEFAULT NULL COMMENT '今开'," \
                 "`zg` decimal(10,3) DEFAULT NULL COMMENT '最高'," \
                 "`zd`  decimal(10,3) DEFAULT NULL COMMENT '最低'," \
                 "`zs`  decimal(10,3) DEFAULT NULL COMMENT '昨收'," \
                 "`cjl` decimal(20) DEFAULT NULL COMMENT '成交量'," \
                 "`cje` decimal(20) DEFAULT NULL COMMENT '成交额'," \
                 "`rq`  datetime DEFAULT NULL COMMENT '日期')"

    cursor = db.cursor()
    cursor.execute(sql_select)
    codes = cursor.fetchall()
    print(type(codes))
    print(codes)
    for code in codes:
        print("stock_"+code[0])
        cursor.execute(sql_create.format("stock_"+code[0]))

def drop_table():
    sql_drop = "drop table if exists {}"
    cursor = db.cursor()
    cursor.execute(sql_select)
    codes = cursor.fetchall()
    print(type(codes))
    print(codes)
    for code in codes:
        print("stock_"+code[0])
        cursor.execute(sql_drop.format("stock_"+code[0]))

if __name__ == '__main__':
#     init_table()
      drop_table()