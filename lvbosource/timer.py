import time as t
class Timer():

    # 初始化构造函数
    def __init__(self):
        self.prompt = "未开始计时..."
        self.lasted = []
        self.begin = 0
        self.end = 0

    # 重写__str__方法 (演示使用，代码可省略)
    def __str__(self):
        return self.prompt

    # 重写__repr__方法
    def __repr__(self):
        return self.prompt


    # 开始计时
    def start(self):
        self.begin = t.localtime()
        print("计时开始....")

    # 结束计时
    def stop(self):
        self.end = t.localtime()
        self.calc()
        print("计时结束...")

    # 计算运行时间
    def calc(self):
        self.lasted = []
        self.prompt = "总共运行了"
        for i in range(6):
            self.lasted.append(self.end[i] - self.begin[i])
            self.prompt += str(self.lasted[i])
        # print