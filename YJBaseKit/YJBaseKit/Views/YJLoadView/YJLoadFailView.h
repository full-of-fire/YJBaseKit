//
//  YJLoadFailView.h
//  加载中和加载失败Demo
//
//  Created by yj on 16/12/6.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJLoadFailView : UIView


+ (void)showInView:(UIView *)view retryHandle:(void (^)())retryHandle;

+ (void)hideForView:(UIView*)view;

- (void)showInView:(UIView *)view retryHandle:(void(^)())retryHandle;

- (void)hide;

@end
