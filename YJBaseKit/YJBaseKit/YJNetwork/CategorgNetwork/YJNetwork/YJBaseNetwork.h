//
//  YJBaseNetwork.h
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 成功的Block */
typedef void(^successBlock)(NSDictionary *dict);
/** 失败的Block */
typedef void(^failedBlock)(NSError *error);
@interface YJBaseNetwork : NSObject

/** urlString--请求的链接
 parameter--拼接的参数
 success -- 请求成功的block
 fail -- 请求失败的block
 return -- 请求的NSURLSessionDataTask*
 */
+ (NSURLSessionDataTask*)netWorkGetWithURLString:(NSString*)urlString parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail;


/** urlString--请求的链接
 parameter--拼接的参数
 success -- 请求成功的block
 fail -- 请求失败的block
 return -- 请求的NSURLSessionDataTask*
 */
+ (NSURLSessionDataTask*)netWorkPostWithURLString:(NSString*)urlString parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail;


@end
