import os

import cx_Oracle
conn = cx_Oracle.connect('rice','rice','192.168.1.36:1521/XE')
import pandas as pd
from konlpy.tag import Okt
import re
from datetime import datetime
# DB연결
free_board_List =[]
okt = Okt()

def clean_kr(text_data):
    #텍스트 포함되어 있는 특수 문자 제거
    text = re.sub(r'[^가-횡 ]','',text_data)
    return text



with conn: # with를 쓰면 close를 안해도 자동으로 닫힘. (원래 : cursor는 닫아줘야함, cursor는 휘발성)

    # freeBoardTitle 내용가져와서 명사분류
    sql_free= """select free_board_title
            from free_board
            """
    sql_market = """select market_title
            from market
            """
    df = pd.read_sql(sql_free, con=conn)
    # titles = df['FREE_BOARD_TITLE']
    result = []
    #freeBoard에서 명사 추출해서 result에 넣기
    for i, v in df.iterrows():
        title = df.iloc[i]['FREE_BOARD_TITLE']
        title = clean_kr(title)
        if title is not '':
            text = okt.pos(title, norm=True, stem=True)
            print(text)
            r = []
            for word in text:
                # 이모티콘, 조사 와 같은 텍스트 제외
                # if not word[1] in ['Josa', 'Eomi', 'Punctuation']:
                #     r.append(word[0])
                if word[1] in 'Noun':
                    r.append(word[0])
                rl = ("".join(r)).strip()
                result.append(rl)


    df = pd.read_sql(sql_market, con=conn)
    # titles = df['FREE_BOARD_TITLE']


    for i, v in df.iterrows():
        title = df.iloc[i]['MARKET_TITLE']
        title = clean_kr(title)
        if title is not '':
            text = okt.pos(title, norm=True, stem=True)
            print(text)
            r = []
            for word in text:
                # 이모티콘, 조사 와 같은 텍스트 제외
                # if not word[1] in ['Josa', 'Eomi', 'Punctuation']:
                #     r.append(word[0])
                if word[1] in 'Noun':
                    r.append(word[0])
                rl = ("".join(r)).strip()
                result.append(rl)

print(result)







# # Counter를 이용하여 빈도분석
from collections import Counter
count = Counter(result)
print(count)
#
# # 워드 클라우드
# # 주피터노트북에만 필요한 옵션
# # %matplotlib inline
import matplotlib.pyplot as plt
from wordcloud import WordCloud

# 이미지 넣기
from PIL import Image
import numpy as np
#
im = Image.open('./circle.png')
mask_arr = np.array(im)
#
# #
wc = WordCloud(background_color='white', colormap='autumn',
               width=500, height=500, random_state=43, mask=mask_arr,
               prefer_horizontal=True, font_path = './NanumBarunGothic.ttf')

cloud = wc.generate_from_frequencies(count)

plt.rc('font', family='NanumBarunGothic')

plt.figure(figsize=(8,8))
plt.imshow(cloud)

# plt.title("WordFrequency", size=13)
plt.tight_layout(pad=0)
plt.axis('off')
# plt.show()
todayTime = datetime.today().strftime("%Y-%m-%d") # 현재 날짜 가져오기
print(todayTime)
plt.savefig('/home/pc94/upload'+todayTime+'.png', bbox_inches='tight')
print(('/home/pc94/upload'+todayTime+'.png'))
print("저장됨?")


plt.show()
