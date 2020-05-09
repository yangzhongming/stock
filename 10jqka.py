import requests
import re
import json
from pyquery import PyQuery
import pymysql

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'}


def get_stock_list(url):
    r = requests(url,headers)
    doc = PyQuery(r.text)
    list = []
    for i in doc('.stockTable a').items():
        try:
            href =i.attr.href
            list.append(re.findall(r"\d{6}",href[0]))
        except:
            continue
    return list

def main():
    stocket_url='https://hq.gucheng.com/gpdmylb.html'
    list = get_stock_list(stocket_url)
    print(list)

if __name__ == '__main__':
    main()