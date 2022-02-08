import csv
import os
import requests
from lxml import etree
import json
import pandas

file_path = "/Users/gaotianchen/Desktop/R/comment.csv"

def get_comment():
    headers={
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36"
    }
    id = 1727111
    url = "https://hotels.ctrip.com/hotels/1727111.html"
    url1 = "https://hotels.ctrip.com/hotels/"
    url2 = ".html"
    comlst = []
    # print(len(comlst))
    cnt = 0
    j = 0
    while (cnt < 1000):
        print(cnt)
        tmp = id + j
        idstr = f'{tmp}'
        url = url1 + idstr + url2
        res = requests.get(url, headers=headers)
        res.encoding = res.apparent_encoding

        tree = etree.HTML(res.text)
        str = tree.xpath('.//div[@class="comment"]/p/text()')
        for i in str:
            comlst.append(i)
            cnt = cnt + 1
        j = j + 1
    with open("/Users/gaotianchen/wksp/rev.json", "w") as f:
        json.dump(comlst, f)

def generate():
    csv_file = open(file_path, "r")

    files = csv.reader(csv_file)

    header = ['comment_content']
    with open("/Users/gaotianchen/wksp/rrev.csv", "w", encoding='UTF8') as ff:
        writer = csv.writer(ff)
        writer.writerow(header)
        for i in files:
            if files.line_num == 1:
                continue
            if len(i[2]) > 10:
                i[2] = i[2][0:10]
            writer.writerow([i[2]])

def shorten():
    fl = pandas.read_csv('/Users/gaotianchen/wksp/revv.csv')
    fl = pandas.DataFrame(fl).values.tolist()
    flst = []
    dh = []
    jh = []
    th = []
    for i in fl:
        cm = i[0]
        cmm = cm.split("，")
        for j in cmm:
            dh.append(j)
        ccm = cm.split("。")
        for j in ccm:
            jh.append(j)
        cmcm = cm.split("！")
        for j in cmcm:
            th.append(j)
    print(len(th), len(jh), len(dh))
    for i in dh:
        for j in jh:
                flst.append(i + j)
    print(len(flst))
    flst = flst[0:2000000]
    print(len(flst))
    header = ['comment_content']


    with open("/Users/gaotianchen/wksp/rev.json", "r") as f:
        r = json.load(f)
        flst = []
        for i in r:
            flst.append(i)
            ss = i.split("，")
            if (len(ss) > 1):
                for j in ss:
                    flst.append(j)
        print(len(flst))


    with open("/Users/gaotianchen/wksp/rrev.csv", "w", encoding='UTF8') as ff:
        writer = csv.writer(ff)
        writer.writerow(header)
        for i in flst:
            writer.writerow([i])

if __name__ == "__main__":
    get_comment()
    generate()
    shorten()