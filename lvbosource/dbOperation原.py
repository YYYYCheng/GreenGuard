import pymysql
import datetime

class dbOperation(object):
    def __init__(self):
        self.db, self.cursor = self.openDB()

    def __del__(self):
        self.closeDB()

    def openDB(self):
        # 打开数据库连接
        db = pymysql.connect("localhost", "root", "root", "baike")
        # 使用 cursor() 方法创建一个游标对象 cursor
        cursor = db.cursor()
        return db, cursor

    def insert(self, data):
        if data is None:
            return

        sql = "INSERT INTO danmu(userName, text, roomId, nowTime) \
                VALUES ('%s',  %s,  '%s',  %s)" % \
              ('Mohan', '66666', '123', '"' + datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S') + '"')

        try:
            # 执行sql语句
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
        except:
            # 如果发生错误则回滚
            self.db.rollback()
            print('e')



    def closeDB(self):
        # 关闭数据库连接
        self.db.close()