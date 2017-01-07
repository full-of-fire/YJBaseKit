//
//  YJBaseRequest.h
//  TILLiveSDKShow
//
//  Created by yj on 16/12/30.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJBaseRequest : NSObject

- (NSString*)requestName;

- (NSString*)url;

- (NSDictionary*)getParams;

- (NSData *)toPostJsonData;

- (NSString*)toGetParamsString;
@end
