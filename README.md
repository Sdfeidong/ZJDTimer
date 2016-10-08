# ZJDTimer
一个简单实用的计时器

### 支持pod导入
pod 'ZJDTimer','~> 1.0.3'

### 简单使用
    // 一、
    // 创建实例
    _timer = [ZJDTimer shared];
    NSLog(@"%d",_timer.timeCount);
    // 开始计时
    [_timer startCount];
    
    // 通知 接收时间变化的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countTimeNoti:) name:NNC_CountTimeNotification object:nil];

    // 二、
    - (void)countTimeNoti:(NSNotification *)noti {
        NSDictionary *dic = [noti object];
        NSLog(@"count time --> %@",dic);
        // 在这根据自己的需求去刷新UI
    }
    
    // 详细使用请见ZJDTimerDemo
    
