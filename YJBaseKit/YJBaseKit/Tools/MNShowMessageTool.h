//
//  MNShowMessageTool.h
//  IIMediaNews
//
//  Created by yj on 16/3/15.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNShowMessageTool : NSObject

+ (void)showMessage:(NSString *)message;

+ (void)showMessage:(NSString *)message andTime:(float)sec;

+ (void)showMessage:(NSString *)message andTime:(float)sec withDelay:(float)delaySec;


+ (void)showMessage:(NSString *)message withDelay:(float)delaySec;







@end
