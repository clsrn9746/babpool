from flask import Flask, jsonify
from flask_restful import Api, Resource, reqparse, abort
from flask_cors import CORS

import sim_user
app = Flask(__name__)
api = Api(app)
CORS(app)



import DBManager as DB
db = DB.DBmanager()
print(db.conn)

def abort_if_user_exists(user_id):

    sql = """ select count(*) from member where mem_id =:1 """
    row = db.fn_select(sql, [user_id])
    if len(row) == 0:
        abort(400, message="not find user...")

class Video(Resource):

    def get(self, user_id):
        abort_if_user_exists(user_id)
        result = sim_user.fn_simuser_list(user_id)
        return jsonify(result)

api.add_resource(Video, "/sim/<string:user_id>")

if __name__ == '__main__':
   app.run(debug=True,host="192.168.1.15", port=5454)  #dev
#   app.run(debug=True,host="192.168.1.36", port=5454) # server
