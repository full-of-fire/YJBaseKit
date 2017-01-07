//
//  UIButton+YJAdd.h
//  自定义按钮Demo
//
//  Created by yj on 16/12/7.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YJAdd)

/**
 标题rect
 */
@property (assign,nonatomic) CGRect yj_titleLabelRect;

/**
 图片rect
 */
@property (assign,nonatomic) CGRect yj_imageViewRect;

/**
 按钮的点击后回调

 @param clickHandle 点击回调
 */
- (void)yj_addClickHandle:(void(^)(UIButton*button))clickHandle;

@end
