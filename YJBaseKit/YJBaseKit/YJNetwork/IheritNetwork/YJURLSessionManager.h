//
//  YJURLSessionManager.h
//  TILLiveSDKShow
//
//  Created by yj on 16/12/30.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJBaseRequest.h"
@interface YJURLSessionManager : NSObject

+ (instancetype)sharedURLSessionManager;


- (NSURLSessionDataTask*)startRequest:(YJBaseRequest*)request success:(void(^)(NSDictionary*dict))success fail:(void(^)(NSError*error,NSString*errocode))fail;

@end
