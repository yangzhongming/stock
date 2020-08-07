# -*- coding:utf-8 -*-
import requests
import json
import pymysql
import datetime
import time

from stock.dongfang.common.dataUtil import chkNum

url_sz_hk_board = "http://18.push2.eastmoney.com/api/qt/clist/get?cb=jQuery11240760758662793585_1590459339072&pn={}&pz=20&po=1&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&fid=f26&fs=b:BK0707&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f20,f21,f23,f24,f25,f26,f22,f11,f62,f128,f136,f115,f152&_=1590459339073"
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='root',
                     database='stock_eastmoney_db',
                     charset='utf8mb4')
cursor = db.cursor()
def get_sh_sz_hk(url):
    # print("************ 获取页面数据处理开始：get_sh_sz_hk **********：第" + page + "页")
    str_response = requests.get(url,headers=header).text
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
    # print("************ 获取页面数据处理结束：get_sh_sz_hk **********：第" + page + "页")
    return list_reponse;

def save_sh_sz_hk(stocks_list,dict_parm):
    print("************ 保存据处理开始：save_sh_sz_hk **********：")
    try:
        for index in range(len(stocks_list)):
            data_list = []

            data_list.append(stocks_list[index]['f1'])  # 固定值   -
            data_list.append(chkNum(stocks_list[index]['f2']))  # 最新价
            data_list.append(chkNum(stocks_list[index]['f3']))  # 涨跌幅
            data_list.append(chkNum(stocks_list[index]['f4']))  # 涨跌额
            data_list.append(chkNum(stocks_list[index]['f5']))  # 成交量
            data_list.append(chkNum(stocks_list[index]['f6']))  # 成交额
            data_list.append(chkNum(stocks_list[index]['f7']))  # 振幅
            data_list.append(chkNum(stocks_list[index]['f8']))  # 换手率
            data_list.append(chkNum(stocks_list[index]['f9']))  # 市盈率(动态)
            data_list.append(chkNum(stocks_list[index]['f10']))  # 量比
            data_list.append(chkNum(stocks_list[index]['f11']))  #
            data_list.append(stocks_list[index]['f12'])  # 代码 -
            data_list.append(stocks_list[index]['f13'])  #     -
            data_list.append(stocks_list[index]['f14'])  # 名称 -
            data_list.append(chkNum(stocks_list[index]['f15']))  # 最高
            data_list.append(chkNum(stocks_list[index]['f16']))  # 最低
            data_list.append(chkNum(stocks_list[index]['f17']))  # 今开
            data_list.append(chkNum(stocks_list[index]['f18']))  # 昨收
            data_list.append(chkNum(stocks_list[index]['f20']))  # 总市值
            data_list.append(chkNum(stocks_list[index]['f21']))  # 流通市值
            data_list.append(chkNum(stocks_list[index]['f22']))  #
            data_list.append(chkNum(stocks_list[index]['f23']))  # 市净率
            data_list.append(chkNum(stocks_list[index]['f24']))  # 最近3个月累计涨跌幅
            data_list.append(chkNum(stocks_list[index]['f25']))  # 今年以来累计涨幅
            data_list.append(stocks_list[index]['f26'])  # 上市时间
            data_list.append(chkNum(stocks_list[index]['f62']))  # 净流入额
            data_list.append(chkNum(stocks_list[index]['f115']))  # 市净率
            data_list.append(stocks_list[index]['f128'])  #
            data_list.append(stocks_list[index]['f140'])  # -
            data_list.append(stocks_list[index]['f141'])  # -
            data_list.append(stocks_list[index]['f136'])  # -
            data_list.append(stocks_list[index]['f152'])  # 固定2 -
            print(data_list)

            #判断是否有相同的ID
            bb = select_sh_sz_hk_board(data_list,dict_parm)
            if (bb):
                # 如果存在就进行更新
                update_sh_sz_hk_board(data_list,dict_parm)
            else:
                #如果不存在，就进行插入数据
                insert_sh_sz_hk_board(data_list,dict_parm)

            # 判断单个股票表是否存在,如果不存在则进行创建
            # 进行单个股票明细插入
            chk = select_stocks_byDM(data_list,dict_parm)
            if chk:
                update_us_stocks(data_list,dict_parm)
            else:
                insert_us_stocks(data_list,dict_parm)

    except Exception as e:
        print(e)
        db.rollback()
        db.close()
    print("************ 保存据处理结束：save_sh_sz_hk **********：")
# 查询主板信息
def select_sh_sz_hk_board(data_list,dict_parm):
    sql_select_sh_sz_hk = "select f12 from {} where f12 = '{}' "
    print(type(dict_parm))
    print(data_list[11])
    cursor.execute(sql_select_sh_sz_hk.format(dict_parm['tabName'],data_list[11]))
    return cursor.fetchone()

# 更新主板信息
def update_sh_sz_hk_board(data_list):

    dm = data_list[0]
    data_tmp = data_list[1:]
    sql_update_hk_mainborad = "update sh_sz_hk set mc=%s,zxj=%s,zde=%s,zdf=%s,jk=%s,zg=%s,zd=%s,zs=%s,cjl=%s,cje=%s,zsz=%s,syl=%s where dm='{}'"
    cursor.execute(sql_update_hk_mainborad.format(dm), data_tmp)
    db.commit()

# 插入每日数据
def insert_sh_sz_hk_board(data_list,dict_parm):
    print(data_list)
    print(dict_parm['tabName'])
    # dt = datetime.datetime.now().strftime("%Y-%m-%d")
    # data_list.append(dt)
    # data_list[24]=dt
    # data_list.insert(0,dict_parm['tabName'])
    # sql_insert_sh_sz_hk = "insert into  %s" \
    #              "(f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f20,f21,f22,f23,f24,f25,f26,f62,f115,f128,f140,f141,f136,f152)" \
    #              "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s)"
                 # "values()"
    # print(sql_insert_sh_sz_hk.format(data_list))
    table = dict_parm['tabName']
    keys = ['f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11','f12','f13','f14','f15','f16','f17','f18','f20','f21','f22','f23','f24','f25','f26','f62','f115','f128','f140','f141','f136','f152']
    dict_data = dict(zip(keys,data_list))

    print(type(dict_data))
    print(dict_data)
    sql_insert_sh_sz_hk = "insert into {table}(keys) values ({values})"
    print(data_list)
    cursor.execute(sql_insert_sh_sz_hk,data_list)
    db.commit()

# 当日记录是否存在
def select_stocks_byDM(data_list):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    sql_select_stocks_byDM = "select dm from us_stocks where dm='{}' and rq='{}'"
    cursor.execute(sql_select_stocks_byDM.format(data_list[0], dt))

    return cursor.fetchone()

# 更新当日记录是否存在
def update_us_stocks(data_list,classify):

    dm = data_list[0]
    data_tmp = data_list[1:]
    print(data_tmp)
    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    data_tmp.append(dt)
    data_tmp.append(classify)  # 分类区分

    sql_update_one_dm = "update us_stocks set mc=%s,zxj=%s,zde=%s,zdf=%s,jk=%s,zg=%s,zd=%s,zs=%s,cjl=%s,cje=%s,zsz=%s,syl=%s,rq=%s,fl=%s where dm ='{}' and rq='{}'"
    cursor.execute(sql_update_one_dm.format(dm,dt),data_tmp)
    db.commit()

# 插入当日记录
def insert_us_stocks(data_list,classify):

    dt = datetime.datetime.now().strftime("%Y-%m-%d")
    data_list.append(dt)
    data_list.append(classify) # 分类区分
    sql_insert_us_stocks = "insert into us_stocks" \
                 "(dm, mc, zxj, zde, zdf, jk, zg, zd, zs, cjl,cje,zsz,syl,rq,fl) " \
                 "values( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s,%s,%s,%s)"
    cursor.execute(sql_insert_us_stocks,data_list)
    db.commit()

 # 沪股通
def sh_hk_board():
    dict_sh_hk_board = {
        'url':url_sz_hk_board,
        'pages':2,
        'classify':1,
        'tabName': "sh_hk_board"
    }

    execute(dict_sh_hk_board)

# 深股通
def sz_hk_board():
    return;
# 港股通（沪）
def hk_sh_stocks():
    return;
# 港股通（深）
def hk_sz_stocks():
    return;
# AH股比价
def ah_comparison():
    return;

def execute(dict_param):
    for i in range(1,dict_param['pages']+1):
        try:
            print("************ 主函数处理开始： **********：第"+str(i)+"页")
            #1.获取主板数据
            stock_list = get_sh_sz_hk(dict_param['url'].format(i))
            #2.主板数据保存至DB
            save_sh_sz_hk(stock_list,dict_param)
            print("************ 主函数处理结束： **********：第"+str(i)+"页")
            #3.休眠
            time.sleep(5)
        except Exception as e:
            print(e)
            db.close()
# 主板主函数
def main_sh_sz_hk():
    # for i in range(1,2): # 页数：1
    #     try:
    #         print("************ 主函数处理开始：main_sh_sz_hk **********：第"+str(i)+"页")
    #         #1.获取主板数据
    #         stock_list = get_sh_sz_hk(str(i))
    #         #2.主板数据保存至DB
    #         save_sh_sz_hk(stock_list)
    #         print("************ 主函数处理结束：main_sh_sz_hk **********：第"+str(i)+"页")
    #         #3.休眠
    #         time.sleep(5)
    #     except Exception as e:
    #         print(e)
    #         db.close()

    #沪股通
    sh_hk_board()
    #深股通
    # sz_hk_board()
    # #港股通（沪）
    # hk_sh_stocks()
    # #港股通（深）
    # hk_sz_stocks()
    # #AH股比价
    # ah_comparison()



if __name__ == '__main__':
    # 2.hk主板数据获取
    main_sh_sz_hk()
    # 关闭数据库
    db.close()