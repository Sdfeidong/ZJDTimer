# ZJDTimer
一个简单实用的计时器

### 支持pod导入
pod 'ZJDTimer','~> 1.0.3'

### 简单使用
    // 创建实例开始计时
    _timer = [ZJDTimer shared];
    NSLog(@"%d",_timer.timeCount);
    [_timer startCount];
    
    // 通知接收时间变化的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countTimeNoti:) name:NNC_CountTimeNotification object:nil];

    // 通知处理方法
    - (void)countTimeNoti:(NSNotification *)noti {
        NSDictionary *dic = [noti object];
        NSLog(@"count time --> %@",dic);
        // 在这根据自己的需求去刷新UI...
    }
    
### 详细使用请见ZJDTimerDemo
    
