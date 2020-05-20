# -*- coding:utf-8 -*-
from selenium import webdriver

import requests
import re
import json
import pymysql
import datetime
import time


url = "http://{}.push2.eastmoney.com/api/qt/clist/get?cb=jQuery112407067845300374169_1589782650756&pn={}&pz=20&po=1&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&fid=f3&fs=m:128+t:3&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f23,f24,f25,f26,f22,f33,f11,f62,f128,f136,f115,f152&__=1589904876851"
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='root',
                     database='stock_eastmoney_db',
                     charset='utf8mb4')
cursor = db.cursor()
def get_hk_mainboard(page):
    str_response = requests.get(url.format(page,page),headers=header).text
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

    try:
        for index in range(len(stocks_list)):
            data_list = []
            data_list.append(stocks_list[index]['f12'])  # dm
            data_list.append(stocks_list[index]['f14'])  # mc
            data_list.append(chkNum(stocks_list[index]['f2']))  # zxj
            data_list.append(chkNum(stocks_list[index]['f4']))  # zde
            data_list.append(chkNum(stocks_list[index]['f3']))  # zdf
            data_list.append(chkNum(stocks_list[index]['f17']))  # jk
            data_list.append(chkNum(stocks_list[index]['f15']))  # zg
            data_list.append(chkNum(stocks_list[index]['f16']))  # zd
            data_list.append(chkNum(stocks_list[index]['f18']))  # zs
            data_list.append(chkNum(stocks_list[index]['f5']))  # cjl
            data_list.append(chkNum(stocks_list[index]['f6']))  # cje
            print(data_list)

            #判断是否有相同的ID
            bb = select_hk_mainboard(data_list)
            if (bb):
                # 如果存在就进行更新
                update_hk_mainboard(data_list)
            else:
                #如果不存在，就进行插入数据
                insert_hk_mainboard(data_list)
            print("****************")

            # 判断单个股票表是否存在,如果不存在则进行创建
            # 进行单个股票明细插入
            chk = select_stocks_byDM(data_list)
            if chk:
                update_hk_stocks(data_list)
            else:
                insert_hk_stocks(data_list)
        # db.close()

    except Exception as e:
        print(e)
        db.rollback()
        db.close()

# 查询主板信息
def select_hk_mainboard(data_list):

    sql_select_hk_mainboard = "select dm from hk_mainboard where dm = {}"
    cursor.execute(sql_select_hk_mainboard.format(data_list[0]))
    return cursor.fetchone()

# 更新主板信息
def update_hk_mainboard(data_list):

    dm = data_list[0]
    data_tmp = data_list[1:]
    print(data_tmp)
    sql_update_hk_mainborad = "update hk_mainboard set mc=%s,zxj=%s,zde=%s,zdf=%s,jk=%s,zg=%s,zd=%s,zs=%s,cjl=%s,cje=%s where dm={}"
    cursor.execute(sql_update_hk_mainborad.format(dm),data_tmp)
    db.commit()

# 插入主板信息
def insert_hk_mainboard(data_list):

    sql_insert_hk_mainboard = "insert into `hk_mainboard`" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s)"
    cursor.execute(sql_insert_hk_mainboard, data_list)
    db.commit()

# 当日记录是否存在
def select_stocks_byDM(data_list):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    print("#############")
    print(data_list[0])
    print("#############")
    print(type(dt))
    print(dt)
    sql_select_stocks_byDM = "select dm from hk_stocks where dm={} and rq='{}'"
    cursor.execute(sql_select_stocks_byDM.format(data_list[0], dt))

    return cursor.fetchone()

# 更新当日记录是否存在
def update_hk_stocks(data_list):

    dm = data_list[0]
    data_tmp = data_list[1:]
    print(data_tmp)
    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    data_tmp.append(dt)
    data_tmp.append('0')

    sql_update_one_dm = "update hk_stocks set `mc` = %s,`zxj` = %s,`zde` = %s,`zdf` = %s,`jk`  = %s,`zg`  = %s,`zd`  = %s,`zs`  = %s,`cjl` = %s,`cje` = %s,`rq`= %s,`fl`=%s where dm ={} and rq='{}'"
    cursor.execute(sql_update_one_dm.format(dm,dt),data_tmp)
    db.commit()

# 插入当日记录
def insert_hk_stocks(data_list):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    data_list.append(dt)
    data_list.append('0')
    sql_insert_hk_stocks = "insert into hk_stocks" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`,`rq`,`fl`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s, %s,%s)"
    cursor.execute(sql_insert_hk_stocks, data_list)
    db.commit()

# 数值判断
def chkNum(source):
    if isinstance(source,float):
        return source
    else:
        return 0.0
# 主板主函数
def main_hk_mainboard():
    for i in range(52,53):
        try:
            print("************ begin"+str(i))
            #1.获取主板数据
            stock_list = get_hk_mainboard(str(i))
            #2.主板数据保存至DB
            save_hk_mainboard(stock_list)
            print("************ end"+str(i))
            # time.sleep(5)
        except Exception as e:
            print(e)
            cursor.close()
            db.close()
    cursor.close()
    db.close()

if __name__ == '__main__':
    # 1.hk主板数据获取
    main_hk_mainboard()
