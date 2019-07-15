# 遍历所有mp4文件名->文件名改为字母形式->fffmpeg批量提取音频、切割音频->改回中文名
import os
import subprocess
import wave
import contextlib


def audio_cut(audio_in_name, audio_out_name, start_time, dur_time):
    """
    :param audio_in_name: 输入音频的绝对路径
    :param audio_out_name: 切分后输出音频的绝对路径
    :param start_time: 切分开始时间
    :param dur_time: 切分持续时间
    :return:
    """
    os.system(
        "ffmpeg -i {in_name} -vn -acodec copy -ss {Start_time} -t {Dur_time}  {out_name}".format(in_name=audio_in_name,
                                                                                                 out_name=audio_out_name,
                                                                                                 Start_time=start_time,
                                                                                                 Dur_time=dur_time))

def cut_flv():
    current = os.getcwd()
    current += '/video'
    dirs = os.listdir(current)
    os.chdir('./video')

    for i in dirs:
        if os.path.splitext(i)[1] == ".flv":
            cutpcm = 'ffmpeg -i %s %s -y' % (i, os.path.splitext(i)[0] + '.wav')
            returncutpcm = subprocess.call(cutpcm, shell=True)
            cutjpg = 'ffmpeg -i {0} -f image2 -vf fps=fps=1 {1}out%d.jpg'.format(i, os.path.splitext(i)[0])
            returncutjpg = subprocess.call(cutjpg, shell=True)

            file = wave.open(os.path.splitext(i)[0] + '.wav')
            with contextlib.closing(file) as f:
                frames = f.getnframes()
                rate = f.getframerate()
                time = frames / float(rate)
            start_time = 0  # 切割开始时间
            dur_time = 10  # 切割的片段时长s
            out_number = 1  # 输出文件序号


            for j in range(int(time / 10)):
                audio_out_name ='' + os.path.splitext(i)[0] + str(out_number) + ".wav"  # 切割完生成的片段名
                out_number = out_number + 1
                start_time = start_time + 10
                audio_cut(i, audio_out_name, start_time, dur_time)
    os.chdir('../')