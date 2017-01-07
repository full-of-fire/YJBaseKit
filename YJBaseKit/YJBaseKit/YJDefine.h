//
//  YJDefine.h
//  YJBaseKit
//
//  Created by yj on 17/1/7.
//  Copyright © 2017年 yj. All rights reserved.
//

#ifndef YJDefine_h
#define YJDefine_h

//获取APP
#define YJAPP [UIApplication sharedApplication]
//获取AppDelegate
#define YJAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

// push到下一个界面
#define YJPush_ViewController(ViewController) [self.navigationController pushViewController:ViewController animated:YES];

//pop到上一个页面
#define YJPop_ViewController [self.navigationController popViewControllerAnimated:YES];



// 获取RGB颜色
#define YJRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// 获取userDefaults
#define YJUserDefaults [NSUserDefaults standardUserDefaults]
// 获取通知中心
#define YJNotificationCenter [NSNotificationCenter defaultCenter]

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

#define NSLog(FORMAT, ...) nil
#endif /* YJDefine_h */
