//
//  NSDictionary+YJAdd.h
//  TILLiveSDKShow
//
//  Created by yj on 16/12/30.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJAdd)

/**
 字典参数转为queryString

 @return queryString
 */
- (NSString*)yj_convertQueryString;


/**
 转为Json字符串

 @return Json字符串
 */
- (NSString*)yj_JsonString;


/**
 json字符串转为字典

 @param jsonString jasonstring

 @return 字典
 */
+ (NSDictionary *)yj_dictionaryWithJsonString:(NSString *)jsonString ;

@end
