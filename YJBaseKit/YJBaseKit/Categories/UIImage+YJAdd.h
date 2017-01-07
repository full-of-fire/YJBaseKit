//
//  UIImage+YJAdd.h
//  YJBaseKit
//
//  Created by yj on 17/1/7.
//  Copyright © 2017年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJAdd)


/**
 裁剪到image到指定尺寸

 @param size 尺寸

 @return 裁剪好image
 */
- (UIImage*)yj_imageByScalingAndCroppingToSize:(CGSize)size;


/**
 创建一个圆角图片

 @param cornerRadius 半径

 @return 圆角图片
 */
- (UIImage*)yj_createCornerImageWithCornerRadius:(CGFloat)cornerRadius;


/**
 通过颜色创建一个image

 @param color 颜色
 @param size  size

 @return image
 */
- (UIImage*)yj_createImageWithColor:(UIColor*)color size:(CGSize)size;

@end
