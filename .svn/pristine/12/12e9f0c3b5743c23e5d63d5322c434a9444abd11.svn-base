# 1 워드 클라우드 탑 키워드
# 2 탑 키워드 DB 메뉴 카테고리 조회
# 3 5 카테고리 평점 높은 음식점 조회
# 4 순위 에따른 0.2, 0.4, 0.6, 0.8, 1.0
# 그날 평가와 가장 가까운 유저 조회 10명 선정
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import DBManager as DB
import datetime
day = datetime.datetime.now().strftime("%Y%m%d")

db = DB.DBmanager()
sql = """
           select member_id
             , food_no
             , recommend_score
             , MEMBER_NICNAME
             , MEMBER_PROFILE
        from recommend
        where recommend_date = :day
        order by member_id
"""

def fn_simuser_list(user_id):
    # 예제 데이터
    # users = {'MEMBER_ID': ['mem1', 'mem2', 'mem3', 'mem4', 'mem5', 'mem6', 'mem7', 'mem8', 'mem9', 'mem10']
    #     , 'a1': [0.2, 1.0, 0.8, 0.4, 0.4, 0.2, 1.0, 0.8, 0.4, 0.4]
    #     , 'a2': [0.4, 0.8, 1.0, 1.0, 1.0, 0.4, 0.8, 1.0, 1.0, 1.0]
    #     , 'a3': [0.6, 0.6, 0.6, 0.8, 0.8, 0.6, 0.6, 0.6, 0.8, 0.8]
    #     , 'a4': [0.8, 0.4, 0.2, 0.6, 0.2, 0.8, 0.4, 0.2, 0.6, 0.2]
    #     , 'a5': [1.0, 0.2, 0.4, 0.2, 0.4, 1.0, 0.2, 0.4, 0.2, 0.4]
    #          }
    # df = pd.DataFrame(users)


    data = pd.read_sql(sql, con=db.conn, params={"day": day})
    df = data.pivot(index='MEMBER_ID', columns='FOOD_NO', values='RECOMMEND_SCORE')
    # df = data.pivot(index='MEMBER_ID', columns='FOOD_NO', values='RECOMMEND_SCORE')
    print(df.head())
    menu = df.columns.values.tolist()
    df.reset_index(level=0, inplace=True)
    print(df)
    user_base = cosine_similarity(df[menu])
    user_base = pd.DataFrame(data=user_base, index=df.index, columns=df.index)
    result = get_user_based_collabor(df, user_base, df.loc[df['MEMBER_ID'] == user_id].index[0], data)
    # return { user_id: result }
    return result

def get_user_based_collabor(df, users, id, p_data):
    # 가까운 유저
    sim = []
    sim_user = users[id].sort_values(ascending=False)[:6]
    # i = sim_user.size
    # sim_user = sim_user[i-6:i-1]
    id_list = sim_user.index.tolist()
    print(id_list)
    for i in id_list[1:]:
        data = p_data[p_data['MEMBER_ID'] == df['MEMBER_ID'].iloc[i]]
        data = data.drop_duplicates(subset="MEMBER_PROFILE")
        sim.append({'id': df['MEMBER_ID'].iloc[i],'score': round(sim_user.loc[i],2)
                    ,'profile':data['MEMBER_PROFILE'].iloc[0], 'nickname':data['MEMBER_NICNAME'].iloc[0]})

    return sim
if __name__ == '__main__':
    print(fn_simuser_list('nick'))
    # print(df['userId'].iloc[5])






