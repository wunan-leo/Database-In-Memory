# -*- coding: utf-8 -*-
"""

@author: leoy
"""

# import lib
import pandas as pd

BeijingData = pd.read_csv("./Airbnb-Stay-Dataset/beijing_listings.csv")
ShanghaiData = pd.read_csv("./Airbnb-Stay-Dataset/shanghai_listings.csv")
HongkongData = pd.read_csv("./Airbnb-Stay-Dataset/Hongkong_listings.csv")

BeijingData = BeijingData.loc[:,['description','picture_url']]
ShanghaiData = ShanghaiData.loc[:,['description','picture_url']]
HongkongData = HongkongData.loc[:,['description','picture_url']]

data = pd.concat([BeijingData,ShanghaiData],axis=0,join='inner')
data = pd.concat([data,HongkongData],axis=0,join='inner')
data.reset_index(drop=True)

data.fillna("",inplace = True)

data.to_csv("PictureFile-Description.csv")