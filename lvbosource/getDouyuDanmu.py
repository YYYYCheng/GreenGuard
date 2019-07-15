# import time
# # import sys
# # import dbOperation
# # from danmu import DanMuClient
# #
# # def get_danmu(roomId):
# #     dmc = DanMuClient('https://www.douyu.com/641986')
# #     if not dmc.isValid(): print('Url not valid')
# #     dmc.start(blockThread=True)
# #
# #     @dmc.danmu
# #     def danmu_fn(msg):
# #         db = dbOperation.DbOperation()
# #         db.insert(roomId, msg['NickName'], msg['Content'])
# #         print(roomId, msg['NickName'], msg['Content'])

import time, sys
import dbOperation
from danmu import DanMuClient



def get_danmu(roomId):
    roomId = roomId

    dmc = DanMuClient('https://www.douyu.com/' + str(roomId))
    if not dmc.isValid(): print('Url not valid')

    @dmc.danmu
    def danmu_fn(msg):
        db = dbOperation.DbOperation()
        db.insert_danmu(roomId, msg['NickName'], msg['Content'])
        # print(roomId, msg['NickName'], msg['Content'])


    dmc.start(blockThread = True)