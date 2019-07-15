import threading
import getVideo
import time
import stopThread
import CutFlv
import os
import dbOperation
import getDouyuDanmu
exitFlag = 0

#这里输入房间号的列表
roomList = [5424690, 288016]

# # 创建danmu Spider线程
# for room in roomList:
#     dt = threading.Thread(target=getDouyuDanmu.get_danmu, args=(room,))
#     print("开启进程，爬 " + str(room) + " 弹幕")
#     dt.start()

#创建video Spider线程
while(1):
    # #视频爬虫
    # t = threading.Thread(target=getVideo.get_video,args=(55,))
    # t.setDaemon(True)
    # t.start()
    # time.sleep(5)
    # stopThread.stop_thread(t)
    # #视频切割
    # CutFlv.cut_flv()
    #删除以前图像处理的结果

    #图像处理
    current = os.getcwd()
    current += '/video'
    dirs = os.listdir(current)
    os.chdir('./video')
    for i in dirs:
        if "jpg" in i:
            print(i)
            os.system("py -3 nude.py " + i)
    os.chdir('../')

