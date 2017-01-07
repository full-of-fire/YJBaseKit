//
//  YJBaseNetworkConfig.m
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJBaseNetworkConfig.h"
static YJBaseNetworkConfig *instance = nil;
@implementation YJBaseNetworkConfig

+(YJBaseNetworkConfig*)defaultConfig {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _baseURLString = @"http://api.myxianwen.cn";
    }
    return self;
}

@end
