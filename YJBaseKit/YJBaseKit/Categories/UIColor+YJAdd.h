//
//  UIColor+YJAdd.h
//  YJBaseKit
//
//  Created by yj on 17/1/7.
//  Copyright © 2017年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YJAdd)



/**
 通过r/g/b
 
 @param r     r
 @param g     g
 @param b     b
 @param alpha 0-1.0;
 
 @return UIColor*
 */
+ (UIColor*)yj_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha;


/**
 通过 r、g、b
 
 @param r r
 @param g g
 @param b b
 
 @return UIColor*
 */
+ (UIColor*)yj_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;


/**
 获取随机色
 
 @return 获取随机色
 */
+ (UIColor*)yj_randomColor;


/**
 16进制的颜色转为UIColor

 @param stringToConvert 16进制字符串

 @return UIColor
 */
+ (UIColor *) yj_colorWithHexString: (NSString *) stringToConvert;
@end
