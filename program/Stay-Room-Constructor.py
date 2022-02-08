# -*- coding: utf-8 -*-
"""
This is a constructor for stay and room data.

@author: leoy

"""

"""
table: stay

stay_id           numeric(10,0)    primary key    房源编号
host_id           numeric(10,0)    foreign key    房主编号
stay_name         varchar(50)      not null       房源名称
stay_province     varchar(8)       not null       房源省份
stay_longitude    numeric(6,2)                    房源坐标经度
stay_latitude     numeric(6,2)                    房源坐标维度
stay_capacity     int              default 1      房源容纳人数
room_num          int              default 0      房间数目
stay_description  varchar(50)                     房源描述信息
"""
"""
table: room

stay_id           numeric(10,0)    primary key    房源编号
room_id           numeric(10,0)    primary key    房间门牌号
room_price        numeric(10,2)    not null       房间价格
room_photo        vachar(50)       default d_link 房间照片
"""

# import lib
import pandas as pd
import json
import random
import re

class StayConstructor:
    
    def __init__(self):
        
        self.labels = ['sidihome','绿色系','超温馨','整套','长租优惠','月租半价','简单','特惠','谢绝情侣','撸猫','撸狗','特色民宿',
              '繁华商区','宁静','浪漫','长租折扣','长租福利','五星推荐','世纪假日','短住旅行','小清新','独立房屋','自然',
              '书屋','茶苑','欧式风情','大床','瞰舍','客栈']

        self.loadLocationFile("Stay-Location.txt")
        self.loadPictureFileAndDescription("PictureFile-Description.csv")
        self.loadStayName("Stay-Name.txt")
        self.loadStayPosition("Stay-Position.json")
        
        self.stayId = 0
        
    def loadLocationFile(self,path):
        
        self.location = {}
        
        file = open(path,"r",encoding = 'utf-8')
        while 1:
          line = file.readline()
          if not line:
            break
          line=line.strip('\n')
          lineList = line.split(':')
          key = lineList[0]
          key = key.replace('"','')
          values = lineList[1]
          valuesList = re.split("[\[\],]",values)
          for index in range(len(valuesList)):
              valuesList[index] = valuesList[index].replace('"', '')
          valuesList = valuesList[1:-1]
          self.location[key] = valuesList
        file.close()
        self.province = list(self.location.keys())
                
    
    def loadPictureFileAndDescription(self,path):
        
        data = pd.read_csv(path)
        self.pictureUrl = list(set(data.loc[:,'picture_url'].to_list()))
        self.discriptionList = list(set(data.loc[:,'description'].to_list()))
        for index in range(len(self.discriptionList)):
            if len(str(self.discriptionList[index])) > 25 :
                self.discriptionList[index] = self.discriptionList[index][:25]
            
    
    def loadStayName(self,path):
        
        self.stayNameList = []
        with open(path,"r",encoding='utf-8') as f:
            self.stayNameList = f.readline().split(',')
        
        
    def loadStayPosition(self,path):
        
        
        self.position = {}
        with open(path,"r",encoding='utf-8') as readFile:
            self.position = json.load(readFile,strict=False)
        
        
        
    # define function
    # 获得景点描述
    def getRandomLocationDescribe(self, key):
        loc = self.location.get(key)
    
        descNum = random.randint(0,3)
        
        selectLocation = random.sample(loc,descNum)
        
        return '|'.join(selectLocation)
    
    # 获得房间信息
    def getRoomInfo(self):
        
        roomNum = random.randint(1,3)
        bedNum  = random.randint(1,4)
        
        roomInfo = []
        for index in range(roomNum):
            roomDict = {}
            roomDict['room_id'] = random.randint(100,1000)+index
            roomDict['room_price'] = random.randint(200,2000)
            roomDict['room_photo'] = random.choice(self.pictureUrl)
            roomInfo.append(roomDict)
        return [roomNum,bedNum,roomInfo]
    
    # 获得民宿名称
    def getStayName(self):        
        return random.choice(self.stayNameList)
    
    # 获得民宿坐标位置
    def getLngAndLat(self,key):
        
        position = self.position.get(key)
        lng = position[0] + random.uniform(-3,3)
        lat = position[1] + random.uniform(-3,3)
        
        return [lng,lat]
    
    # 获得房源容纳人数
    def getMemberAmount(self, roomNum):
        
        return random.randint(roomNum,2*roomNum)
    
    # 获得房源描述信息
    def getStayDescription(self):
        
        return random.choice(self.stayDescriptionList)
     
    # 获得房源省份
    def getStayProvince(self):
        
        return random.choice(self.province)
    
    

    
    def getStayandRooms(self):
        
        stayInfo ={}
        stayInfo["stay_id"]=self.stayId
               
        stayInfo["host_id"]=random.randint(0,999999)
        
        #获得一个省份
        province = random.choice(self.province)
        stayInfo["stay_province"] = province
        
        #获得房源经纬度
        position = self.getLngAndLat(province)
        stayInfo["stay_longitude"] = position[0]
        stayInfo["stay_latitude"] = position[1]
        
        #房源名称
        #【[标签内容]】|[地区]|近[景点1]|[景点2]|[景点n]|[房间数量]|室[床数量]|[民宿名称]
        label = random.choice(self.labels)
        locations = self.getRandomLocationDescribe(province)
        roomInfo = self.getRoomInfo()
        roomNum = roomInfo[0]
        bedNum = roomInfo[1]
        briefName = random.choice(self.stayNameList)
        stayName = "【"+label+"】"+"|"+province+"|近"+locations+"|"+str(roomNum)+"室|"+str(bedNum)+"床|"+str(briefName)
        stayInfo["stay_name"] = stayName
        stayInfo["stay_description"] = random.choice(self.discriptionList)
        stayInfo["room_num"] = roomNum
        stayInfo["stay_capacity"] = self.getMemberAmount(roomNum)
        
        rooms = roomInfo[2]
        for index in range(len(rooms)):
            rooms[index]["stay_id"] = self.stayId
            
        self.stayId += 1
        
        return [stayInfo,rooms]


stays = []
rooms = []

s = StayConstructor()
for i in range(1000000):
    
    if i%1000 == 0:
        print(i)
    
    stayInfo = s.getStayandRooms()
    stays.append(stayInfo[0])
    rooms.extend(stayInfo[1])

'''
stays_df = pd.DataFrame(stays)
stays_df.to_csv("stay.csv")
rooms_df = pd.DataFrame(rooms)
rooms_df.to_csv("room.csv")
'''















