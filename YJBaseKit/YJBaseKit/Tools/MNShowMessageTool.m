//
//  MNShowMessageTool.m
//  IIMediaNews
//
//  Created by yj on 16/3/15.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import "MNShowMessageTool.h"
#import "MBProgressHUD.h"
@implementation MNShowMessageTool
+ (void)showMessage:(NSString *)message
{
    [MNShowMessageTool showMessage:message andTime:1.0f];
}

+ (void)showMessage:(NSString *)message andTime:(float)sec
{
    UIWindow        *window = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD   *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
   
    [hud hide:YES afterDelay:sec];
    
    [window bringSubviewToFront:hud];
}

+ (void)showMessage:(NSString *)message andTime:(float)sec withDelay:(float)delaySec
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySec * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MNShowMessageTool showMessage:message andTime:sec];
    });
}

+ (void)showMessage:(NSString *)message withDelay:(float)delaySec
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySec * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MNShowMessageTool showMessage:message];
    });
}



@end
