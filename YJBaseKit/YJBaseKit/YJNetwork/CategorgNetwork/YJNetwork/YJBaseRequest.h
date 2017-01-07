//
//  YJBaseRequest.h
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJBaseNetwork.h"
#import "YJBaseNetworkConfig.h"
@interface YJBaseRequest : NSObject

+(NSURLSessionDataTask*)base_requestGetMethod:(NSString*)method parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail;


+(NSURLSessionDataTask*)base_requestPostMethod:(NSString*)method parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail;

@end
