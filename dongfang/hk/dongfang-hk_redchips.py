# -*- coding:utf-8 -*-
import requests
import json
import pymysql
import datetime
import time

from stock.dongfang.common.dataUtil import chkNum

url = "http://6.push2.eastmoney.com/api/qt/clist/get?cb=jQuery112405501952748335817_1590051439808&pn={}&pz=20&po=1&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&fid=f3&fs=b:DLMK0102&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f23,f24,f25,f26,f22,f33,f11,f62,f128,f136,f115,f152&_=1590051439809"
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='root',
                     database='stock_eastmoney_db',
                     charset='utf8mb4')
cursor = db.cursor()
def get_hk_redchips(page):
    print("************ 获取页面数据处理开始：get_hk_redchips **********：第" + page + "页")
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

    list_reponse = dict_reponse['data']['diff']
    print(list_reponse[0])
    print("************ 获取页面数据处理结束：get_hk_redchips **********：第" + page + "页")
    return list_reponse;

def save_hk_redchips(stocks_list):
    print("************ 保存据处理开始：save_hk_redchips **********：")
    try:
        for index in range(len(stocks_list)):
            data_list = []

            data_list.append(stocks_list[index]['f12'])   # dm
            data_list.append(stocks_list[index]['f14'])   # mc
            data_list.append(chkNum(stocks_list[index]['f2']))    # zxj
            data_list.append(chkNum(stocks_list[index]['f4']))   # zde
            data_list.append(chkNum(stocks_list[index]['f3']))    # zdf
            data_list.append(chkNum(stocks_list[index]['f17']))   # jk
            data_list.append(chkNum(stocks_list[index]['f15']))   # zg
            data_list.append(chkNum(stocks_list[index]['f16']))   # zd
            data_list.append(chkNum(stocks_list[index]['f18']))   # zs
            data_list.append(chkNum(stocks_list[index]['f5']))    # cjl
            data_list.append(chkNum(stocks_list[index]['f6']))    # cje
            print(data_list)

            #判断是否有相同的ID
            bb = select_hk_redchips(data_list)
            if (bb):
                # 如果存在就进行更新
                update_hk_redchips(data_list)
            else:
                #如果不存在，就进行插入数据
                insert_hk_redchips(data_list)

            # 判断单个股票表是否存在,如果不存在则进行创建
            # 进行单个股票明细插入
            chk = select_stocks_byDM(data_list)
            if chk:
                update_hk_stocks(data_list)
            else:
                insert_hk_stocks(data_list)

    except Exception as e:
        print(e)
        db.rollback()
        db.close()
    print("************ 保存据处理结束：save_hk_redchips **********：")
# 查询主板信息
def select_hk_redchips(data_list):

    sql_select_hk_redchips = "select dm from hk_redchips where dm = {}"
    cursor.execute(sql_select_hk_redchips.format(data_list[0]))
    return cursor.fetchone()

# 更新主板信息
def update_hk_redchips(data_list):

    dm = data_list[0]
    data_tmp = data_list[1:]
    sql_update_hk_mainborad = "update hk_redchips set mc=%s,zxj=%s,zde=%s,zdf=%s,jk=%s,zg=%s,zd=%s,zs=%s,cjl=%s,cje=%s where dm={}"
    cursor.execute(sql_update_hk_mainborad.format(dm),data_tmp)
    db.commit()

# 插入主板信息
def insert_hk_redchips(data_list):

    sql_insert_hk_redchips = "insert into `hk_redchips`" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s)"
    cursor.execute(sql_insert_hk_redchips, data_list)
    db.commit()

# 当日记录是否存在
def select_stocks_byDM(data_list):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
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
    data_tmp.append('4')  # 分类：红筹股 4

    sql_update_one_dm = "update hk_stocks set `mc` = %s,`zxj` = %s,`zde` = %s,`zdf` = %s,`jk`  = %s,`zg`  = %s,`zd`  = %s,`zs`  = %s,`cjl` = %s,`cje` = %s,`rq`= %s,`fl`=%s where dm ={} and rq='{}'"
    cursor.execute(sql_update_one_dm.format(dm,dt),data_tmp)
    db.commit()

# 插入当日记录
def insert_hk_stocks(data_list):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    data_list.append(dt)
    data_list.append('4')  # 分类：红筹股 4
    sql_insert_hk_stocks = "insert into hk_stocks" \
                 "(`dm`, `mc`, `zxj`, `zde`, `zdf`, `jk`, `zg`, `zd`, `zs`, `cjl`,`cje`,`rq`,`fl`) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,% s, %s,%s)"
    cursor.execute(sql_insert_hk_stocks, data_list)
    db.commit()

# 主板主函数
def main_hk_redchips():
    for i in range(1,11):   # 页数：10
        try:
            print("************ 主函数处理开始：main_hk_redchips **********：第"+str(i)+"页")
            #1.获取主板数据
            stock_list = get_hk_redchips(str(i))
            #2.主板数据保存至DB
            save_hk_redchips(stock_list)
            print("************ 主函数处理结束：main_hk_redchips **********：第"+str(i)+"页")
            #3.休眠
            time.sleep(5)
        except Exception as e:
            print(e)
            db.close()

if __name__ == '__main__':
    # 2.hk主板数据获取
    main_hk_redchips()
    # 关闭数据库
    db.close()