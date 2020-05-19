# -*- coding:utf-8 -*-
from selenium import webdriver

import requests
import re
import json
import pymysql
import datetime


url = "http://81.push2.eastmoney.com/api/qt/clist/get?cb=jQuery112407067845300374169_1589782650756&pn={}&pz=20&po=1&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&fid=f3&fs=m:128+t:3&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f23,f24,f25,f26,f22,f33,f11,f62,f128,f136,f115,f152&_=1589782650801"
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='root',
                     database='stock_eastmoney_db',
                     charset='utf8mb4')
cursor = db.cursor()

def get_hk_mainboard(page):
    print(url.format(page))
    str_response = requests.get(url.format(page),headers=header).text
    print(str_response)
    # 字符串截取处理
    start = str_response.find("(")+1
    end = str_response.rfind(")")
    str_format = str_response[start:end]
    print(str_format)

    # 字符串转为dict类型
    dict_reponse = json.loads(str_format)
    print(dict_reponse)
    print(type(dict_reponse))

    list_reponse = dict_reponse['data']['diff']
    print(type(list_reponse))
    print(list_reponse[0])
    return list_reponse;

def save_hk_mainboard(stocks_list):

    sql_get_one = "select dm from hk_mainboard where dm = %s"

    try:
        for index in range(len(stocks_list)):
            data_list = []
            data_list.append(stocks_list[index]['f12'])
            data_list.append(stocks_list[index]['f14'])
            data_list.append(stocks_list[index]['f2'])
            data_list.append(stocks_list[index]['f4'])
            data_list.append(stocks_list[index]['f3'])
            data_list.append(stocks_list[index]['f17'])
            data_list.append(stocks_list[index]['f15'])
            data_list.append(stocks_list[index]['f16'])
            data_list.append(stocks_list[index]['f18'])
            data_list.append(stocks_list[index]['f5'])
            data_list.append(stocks_list[index]['f6'])
            data_list.append('0')
            print(data_list)

            #判断是否有相同的ID
            cursor.execute(sql_get_one, data_list[0])
            stock_dm = cursor.fetchone()
            if (stock_dm):
                # 如果存在就进行更新
                update_hk_mainboard(data_list)
            else:
                #如果不存在，就进行插入数据
                insert_hk_mainboard(data_list)
            print("****************")

            # 判断单个股票表是否存在,如果不存在则进行创建
            init_table(data_list[0])

            # 进行单个股票明细插入
            chk = get_stock_day_memo(data_list)
            if chk:
                update_stock_day_memo(data_list)

            # cursor.execute(sql_insert_one.format("stock_"+data_list[0]), data_list)
            else:
                insert_stock_day_memo(data_list)
        db.close()

    except Exception as e:
        print(e)
        db.rollback()
        db.close()

# 更新主板信息
def update_hk_mainboard(data_list):
    # data_list.append(data_list[0])
    # data_list.remove(data_list[0])
    dm = data_list[0]
    data_tmp = data_list[1:]
    print(data_tmp)
    sql_update_hk_mainborad = "update hk_mainboard set mc=%s,zxj=%s,zde=%s,zdf=%s,jk=%s,zg=%s,zd=%s,zs=%s,cjl=%s,cje=%s,fl=%s where dm={}"
    cursor.execute(sql_update_hk_mainborad.format(dm),data_tmp)
    db.commit()

# 插入主板信息
def insert_hk_mainboard(data_list):
    sql_insert_hk_mainboard = "insert into `hk_mainboard`" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`,`fl`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s, %s)"
    cursor.execute(sql_insert_hk_mainboard, data_list)
    db.commit()

# 当日记录是否存在
def get_stock_day_memo(data_list):
    sql_get_one_dm = "select dm from {} where dm = %s"
    cursor.execute(sql_get_one_dm.format("stock_"+ data_list[0]),data_list[0])
    return  cursor.fetchone()

# 更新当日记录是否存在
def update_stock_day_memo(data_list):
    dt = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    data_list[-1] = dt

    sql_update_one_dm = "update stock_{} set `dm` = %s,`mc` = %s,`zxj` = %s,`zde` = %s,`zdf` = %s,`jk`  = %s,`zg`  = %s,`zd`  = %s,`zs`  = %s,`cjl` = %s,`cje` = %s,`rq`  = %s where dm = s%"
    cursor.execute(sql_update_one_dm.format(data_list[0],data_list,data_list[0]))
    db.commit()

# 插入当日记录
def insert_stock_day_memo(data_list):
    dt = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    data_list[-1] = dt
    sql_insert_one_memo = "insert into {}" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`,`rq`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s, %s)"
    cursor.execute(sql_insert_one_memo.format("stock_"+data_list[0]), data_list)
    db.commit()

def init_table(table_name):
    cursor = db.cursor()
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

    cursor.execute(sql_create.format("stock_"+table_name))
    db.commit()

if __name__ == '__main__':
    #1.获取主板数据
    stock_list = get_hk_mainboard('4')
    #2.主板数据保存至DB
    save_hk_mainboard(stock_list)
