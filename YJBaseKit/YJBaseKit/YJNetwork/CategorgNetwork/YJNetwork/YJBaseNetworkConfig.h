//
//  YJBaseNetworkConfig.h
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJBaseNetworkConfig : NSObject
/** 链接的baseURL如:http://api.myxianwen.cn,默认为@"" */
@property (strong,nonatomic) NSString *baseURLString;

/** 默认网络设置 */
+(YJBaseNetworkConfig*)defaultConfig;
@end
