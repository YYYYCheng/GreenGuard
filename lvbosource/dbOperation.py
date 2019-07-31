# -*- coding: utf-8 -*-
import pymysql
import datetime
import configparser


class DbOperation(object):
    __db__ = "mysql"
    # def __init__(self):
    #     config =configparser.ConfigParser()
    #     filename = 'db_config.ini'
    #     config.read(filename, encoding='utf-8')  # 配置文件路径
    #     self.username = config.get(self.__db__, "username")
    #     self.password = config.get(self.__db__, "password")
    #     self.host = config.get(self.__db__, "host")
    #     self.port = config.get(self.__db__, "port")
    #     self.db_name = config.get(self.__db__, "db_name")
    #     self.db, self.cursor = self.openDB()
    def __init__(self):
        self.username = 'root'
        self.password = 'maxzmaxz'
        self.host = 'localhost'
        self.port = 3306
        self.db_name = 'dmmonitor'
        self.default_authentication_plugin = 'mysql_native_password'
        self.db, self.cursor = self.openDB()
    # def __del__(self):
    #     self.closeDB()

    def openDB(self):
        # 打开数据库连接
        db = pymysql.connect(self.host, self.username, self.password, self.db_name)
        # 使用 cursor() 方法创建一个游标对象 cursor
        cursor = db.cursor()
        return db, cursor

    def insert_danmu(self, room_id, username, content):
        sql = "INSERT INTO danmu(userName, text, roomId, nowTime) VALUES ('%s',  '%s',  '%s', '%s')" % \
              (username,content, room_id, datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

        try:
            # 执行sql语句
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
        except:
            # 如果发生错误则回滚
            self.db.rollback()
            print('e')



    def inset_pic_monitor(self, is_nude):
        sql = "INSERT INTO video(nude, nowTime) VALUES ('%s',  '%s')" % \
              (is_nude, datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
        print(sql)
        # 执行sql语句
        self.cursor.execute(sql)
        # 提交到数据库执行
        self.db.commit()

        # try:
        #     # 执行sql语句
        #     self.cursor.execute(sql)
        #     # 提交到数据库执行
        #     self.db.commit()
        # except:
        #     # 如果发生错误则回滚
        #     self.db.rollback()
        #     print('e')



    def closeDB(self):
        # 关闭数据库连接
        self.db.close()