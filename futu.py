import requests
import json
import pymysql

url = "https://news.futunn.com/wiki/list?formpage=wikilistnew&news_id=2499&page_size=2"
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
def get_stock_name():
    data_list = []
    r = requests.get(url,header)
    data_json = r.json()
    stocks = data_json['data']['list']
    print(stocks)
    stock_list = []
    for stock in stocks:
        print(stock['news_id'])
        stock_list.append(stock['news_id'])
        stock_list.append(stock['title'])
        stock_list.append(stock['abstract'])
        stock_list.append(stock['stock_market'])
        stock_list.append(stock['stock_code'])
        stock_list.append(stock['stock_name'])
        stock_list.append(stock['url'])
        stock_list.append(stock['pic'])
        stock_list.append(stock['tag_class'])
        stock_list.append(stock['tag_text'])
    print(stock_list[0])
    return stock_list

def get_stock_name_test():
    data_list = []
    r = requests.get(url,header)
    data_json = r.json()
    stocks = data_json['data']['list']
    print(stocks)
    stock_list = []
    db = pymysql.connect(host='localhost',
                           port=3306,
                           user='root',
                           password='root',
                           database='stock_db',
                           charset='utf8mb4')

    sql = 'insert into stock_name(news_id, title, abstract, stock_market, stock_code, stock_name, url, pic, tag_class, tag_text) ' \
          'values( %(news_id)s, %(title),%(abstract)s, %(stock_market)s, %(stock_code)s, %(stock_name)s, %(url)s, %(pic)s, %(tag_class)s,%(tag_text)s)'

    cursor = db.cursor()

    for stock in stocks:
        insert_data = {
            "news_id":stock['news_id'],
            "title": stock['title'],
            "abstract": stock['abstract'],
            "stock_market": stock['stock_market'],
            "stock_code": stock['stock_code'],
            "stock_name": stock['stock_name'],
            "url": stock['url'],
            "pic": stock['pic'],
            "tag_class": stock['tag_class'],
            "tag_text": stock['tag_text'],
        }
        try:
            cursor.execute(sql,insert_data)
            print(sql)
            print("OK")
        except:
            print("error")

def save_data():
    db = pymysql.connect(host='localhost',
                           port=3306,
                           user='root',
                           password='root',
                           database='stock_db',
                           charset='utf8mb4')
    sql = 'insert into stock_name(news_id, title, abstract, stock_market, stock_code, stock_name, url, pic, tag_class, tag_text) ' \
          'values( %(news_id)s, %(title),%(abstract)s, %(stock_market)s, %(stock_code)s, %(stock_name)s, %(url)s, %(pic)s, %(tag_class)s,%(tag_text)s)'
    # sql_parm = '(news_id, title, abstract, stock_market, stock_code, stock_name, url, pic, tag_class, tag_text)'
    cursor = db.cursor()

    try:
        datas = get_stock_name();

        for i  in datas:
            insert_data = {}
            cursor.execute(sql,insert_data)
        db.commit()
    except:
        db.rollback()
    db.close()

if __name__ == '__main__':
    # get_stock_name()
    # save_data()
    get_stock_name_test()