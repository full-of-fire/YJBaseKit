//
//  YJBaseRequest.m
//  TILLiveSDKShow
//
//  Created by yj on 16/12/30.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import "YJBaseRequest.h"
#import "NSDictionary+YJAdd.h"
@implementation YJBaseRequest

- (NSString*)requestName {

    return nil;
}

- (NSString*)url {

    return nil;
}

- (NSDictionary*)getParams {


    return nil;
}

- (NSData *)toPostJsonData
{
    NSDictionary *dic = [self getParams];
    // 转成Json数据
    if ([NSJSONSerialization isValidJSONObject:dic])
    {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        if(error)
        {
            NSLog(@"[%@] Post Json Error: %@", [self class], dic);
        }
        else
        {
            NSLog(@"[%@] Post Json : %@", [self class], dic);
        }
        return data;
    }
    else
    {
        NSLog(@"[%@] Post Json is not valid: %@", [self class], dic);
    }
    return nil;
}


- (NSString*)toGetParamsString {

    NSDictionary *dic = [self getParams];
    
    if(!dic) return nil;
    
    return [dic yj_convertQueryString];
}


@end
