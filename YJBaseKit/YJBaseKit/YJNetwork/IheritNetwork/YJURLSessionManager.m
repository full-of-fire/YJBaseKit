//
//  YJURLSessionManager.m
//  TILLiveSDKShow
//
//  Created by yj on 16/12/30.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import "YJURLSessionManager.h"

@interface YJURLSessionManager ()

@property (strong,nonatomic) NSURLSession *session;

@end

@implementation YJURLSessionManager
+ (instancetype)sharedURLSessionManager {

    static YJURLSessionManager *instacne = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instacne = [[self alloc] init];
    });
    
    return instacne;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _session = [NSURLSession sharedSession];
    }
    return self;
}


- (NSURLSessionDataTask*)startRequest:(YJBaseRequest*)request success:(void(^)(NSDictionary*dict))success fail:(void(^)(NSError*error,NSString*errocode))fail {

    
    NSURLSessionDataTask *dataTask = nil;
    if ([[request requestName] isEqualToString:@"GET"]) {
        
        //GET方法
        
        
    }
    else if ([[request requestName] isEqualToString:@"POST"]){
    
        if (![request url] || [request url].length == 0) {
            
            return nil;
        }
        
        NSString *urlString = [NSString stringWithFormat:@"%@?%@",[request url],[request toGetParamsString]];
        
        NSLog(@"-----urlString = %@",urlString);
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
        
        urlRequest.HTTPMethod = [request requestName];
        
        NSData *bodyData = [request toPostJsonData];
        if (bodyData) {
            
            [urlRequest setValue:[NSString stringWithFormat:@"%ld",(long)[bodyData length]] forHTTPHeaderField:@"Content-Length"];
         
            [urlRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
            [urlRequest setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
            
           urlRequest.HTTPBody = bodyData;
        }
        [urlRequest setTimeoutInterval:3.0];
        
        
        
        // POST 方法
        dataTask = [self.session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           
            if (error) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   
                    //网络出错
                    if (fail) {
                        
                        fail(error,@"");
                    }

                    
                });
                
            }
            else {
            
                if (!data) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                       
                        if (success) {
                            
                            success(nil);
                        }
                    });
                }
                
                
                 NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                NSLog(@"请求结果为 = %@",responseString);
                
                
                id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (success) {
                        
                        success(jsonObject);
                    }
                });
                
                
            }
            
        }];
    }
    
    [dataTask resume];
    
    return dataTask;
}

@end
