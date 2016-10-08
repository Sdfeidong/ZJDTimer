//
//  ZJDTimer.h
//  ZJDTimerDemo
//
//  Created by yyk100 on 16/10/8.
//  Copyright © 2016年 aidong. All rights reserved.
//

#import <Foundation/Foundation.h>

// 重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

extern NSString * const NNC_CountTimeNotification;


@interface ZJDTimer : NSObject



@property (nonatomic,assign) int timeCount;

/**
 *  单例
 *
 *  @return 实例
 */
+ (ZJDTimer *)shared;

/**
 *  开始计时
 */
- (void)startCount;
/**
 *  暂停计时
 */
- (void)pauseCount;
/**
 *  继续计时
 */
- (void)reuseCount;
/**
 *  结束计时
 */
- (void)endCount;

/**
 *  返回一个换算好的时间字符串用于显示
 *
 *  @param countNum 计时数
 *
 *  @return 00:15:09
 */
+ (NSString *)timerString:(int)countNum;

@end

