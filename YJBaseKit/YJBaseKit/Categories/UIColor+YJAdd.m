//
//  UIColor+YJAdd.m
//  YJBaseKit
//
//  Created by yj on 17/1/7.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "UIColor+YJAdd.h"

@implementation UIColor (YJAdd)
+ (UIColor*)yj_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b alpha:(CGFloat)alpha {
    
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

+ (UIColor*)yj_colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b {
    
    return [self yj_colorWithR:r G:g B:b alpha:1.0];
}

+ (UIColor*)yj_randomColor {
    
    CGFloat r = arc4random()%256;
    CGFloat g = arc4random()%256;
    CGFloat b = arc4random()%256;
    return [ self yj_colorWithR:r G:g B:b alpha:1.0];
}


+ (UIColor *) yj_colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];//字符串处理
    //例子，stringToConvert #ffffff
    if ([cString length] < 6)
        return [UIColor whiteColor];//如果非十六进制，返回白色
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];//去掉头
    if ([cString length] != 6)//去头非十六进制，返回白色
        return  [UIColor whiteColor];
    //分别取RGB的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    //NSScanner把扫描出的制定的字符串转换成Int类型
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //转换为UIColor
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
