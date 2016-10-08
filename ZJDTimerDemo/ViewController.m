//
//  ViewController.m
//  ZJDTimerDemo
//
//  Created by yyk100 on 16/10/8.
//  Copyright © 2016年 aidong. All rights reserved.
//

#import "ViewController.h"
#import "ZJDTimer.h"

@interface ViewController () {
    
    ZJDTimer *_timer;
    UILabel *_timerLabel;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    [self layoutOtherView];
    
    // 实例
    _timer = [ZJDTimer shared];
    NSLog(@"%d",_timer.timeCount);
    
    // 通知 接收时间变化的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countTimeNoti:) name:NNC_CountTimeNotification object:nil];
}

- (void)layoutOtherView {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSArray *titleAarr = @[@"开始",@"暂停",@"继续",@"结束"];
    CGFloat BTN_WIDTH = 80.f;
    
    // 显示
    _timerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 40)];
    _timerLabel.font = [UIFont systemFontOfSize:17];
    _timerLabel.text = @"00:00:00";
    _timerLabel.textColor = [UIColor blackColor];
    _timerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_timerLabel];
    
    for (NSInteger i = 0; i < [titleAarr count]; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake((CGRectGetWidth(self.view.frame) - BTN_WIDTH) / 2, CGRectGetMaxY(_timerLabel.frame) + 20 + 47 * i, BTN_WIDTH, 37)];
        [btn setBackgroundColor:[UIColor grayColor]];
        [btn setTitle:titleAarr[i] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}



- (void)btnAction:(UIButton *)btn {
    
    // 开始
    if (btn.tag == 100) {
        [_timer startCount];
    }
    // 暂停
    else if (btn.tag == 101) {
        [_timer pauseCount];
    }
    // 继续
    else if (btn.tag == 102) {
        [_timer reuseCount];
    }
    // 结束
    else if (btn.tag == 103) {
        [_timer endCount];
    }
}

#pragma mark - Notification
- (void)countTimeNoti:(NSNotification *)noti {
    
    NSDictionary *dic = [noti object];
    NSLog(@"count time --> %@",dic);
    
    NSString *timeCount = dic[@"timeCount"];
    NSString *timerStr  = [ZJDTimer timerString:[timeCount intValue]];
    _timerLabel.text = timerStr;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NNC_CountTimeNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

