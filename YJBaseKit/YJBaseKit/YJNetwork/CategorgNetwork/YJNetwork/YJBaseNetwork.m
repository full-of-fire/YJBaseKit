//
//  YJBaseNetwork.m
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJBaseNetwork.h"
#import "AFNetworking.h"
@implementation YJBaseNetwork

+ (NSURLSessionDataTask*)netWorkGetWithURLString:(NSString*)urlString parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    [manager.requestSerializer setTimeoutInterval:3.0]; // 设置请求超时时间
    
    
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        success(nil);
        fail(nil);
        return nil;
    }
   NSURLSessionDataTask* task= [manager GET:urlString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        NSDictionary *dict = responseObject;
        
        success(dict);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error == %@",error);
        
        fail(error);
        
    }];
    
    return task;
}


+ (NSURLSessionDataTask*)netWorkPostWithURLString:(NSString*)urlString parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    [manager.requestSerializer setTimeoutInterval:3.0]; // 设置请求超时时间
    
    
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        success(nil);
        fail(nil);
        return nil;
    }
    
    NSURLSessionDataTask* task= [manager POST:urlString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dict = responseObject;
        
        success(dict);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
        fail(error);
        
    }];
    
    return task;
}



@end
