import cx_Oracle

class DBmanager:
    def __init__(self):
        self.conn = None
        self.get_connection()
    def __del__(self):
        try:
            print('소멸자')
            if self.conn:
                self.conn.close()
        except Exception as e:
            print('_del_ 오류',str(e))

    def get_connection(self):
        self.conn = cx_Oracle.connect("rice", "rice", "192.168.1.36:1521/XE", encoding="utf-8")
        return self.conn

    def fn_insert(self, query, param):
        cursor = self.conn.cursor()
        cursor.execute(query, param)
        self.conn.commit()
        cursor.close()

    def fn_select(self, query, param):
        cursor = self.conn.cursor()
        cursor.execute(query, param)
        row = cursor.fetchone()
        cursor.close()
        return row

if __name__ == '__main__':
    print('conn test')
    try:
        manger = DBmanager()
        conn = manger.get_connection()
        print(conn.version)
    except Exception as e:
        print(str(e))
    finally:
        print('conn close')