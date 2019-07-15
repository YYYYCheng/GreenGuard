# 获取直播源
from streamlink import Streamlink
import streamlink
from urllib import request
import os,time
import socket

class video_spider(object):
    def __init__(self, roomId):
        self.roomId = roomId
        self.movie = 'https://live.bilibili.com/'+str(roomId)
        self.mkdir()
        self.get_video()



    def mkdir (self):
        if not os.path.exists('video'):
            os.makedirs('video')

    def get_video(self):
        session=Streamlink()#创建一个会话

        try:
            streams=session.streams(self.movie)#在会话里输入url会返回直播的flv缓存地址
        except:
            try:
                streams=streamlink.streams(self.movie)
            except:
                print('[INFO]该网站不存在plug接口')
                exit(0)

        print('[INFO]获取了视屏流地址.....')
        list=['source','medium','best','worse']
        for l in list:
            if streams[l].url:
                print('[INFO]获得视频%s'%l)
                source=streams[l].url
                if 'm3u8'in str(source):
                    print('[ERROR]%s存在m3u8,暂不支持下载，'%l)
                    continue
                else:
                    socket.setdefaulttimeout(10)
                    while streams[l].url:
                        try:
                            name = time.strftime('%m%d_%H%M%S',time.localtime())+'.flv'
                            print(name+'正在缓存')
                            path='./video/'+name
                            request.urlretrieve(source,os.path.join(path)) # 'video/1.flv'
                            print('[INFO]您缓存的直播已下播......')
                            break
                        except socket.timeout:
                            continue