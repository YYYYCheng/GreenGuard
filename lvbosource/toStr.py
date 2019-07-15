# -*- coding: utf-8 -*- 
# 音频语音识别
from aip import AipSpeech
import time

APP_ID = '16096506'
API_KEY = 'gjB913WGO75enOSp5hTBdtHL'
SECRET_KEY = 'fA790FoCEIiXoRlpf3YlQS0evOWsHFra'

client = AipSpeech(APP_ID, API_KEY, SECRET_KEY)

def get_file_content(filePath):
    with open(filePath, 'rb') as fp:
        return fp.read()

# 识别本地文件
start_time = time.time()
ret = client.asr(get_file_content('./video/Au-190519-2155.wav'), 'wav', 16000, {
    'dev_pid': 1537
})
used_time = time.time() - start_time

print( "used time: {}s".format( round( time.time() - start_time, 2 ) ) )
print('ret:{}'.format(ret))