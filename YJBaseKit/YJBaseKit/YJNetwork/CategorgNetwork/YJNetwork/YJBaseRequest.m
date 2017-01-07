//
//  YJBaseRequest.m
//  YJNetwork
//
//  Created by yj on 16/10/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJBaseRequest.h"

@implementation YJBaseRequest

+(NSURLSessionDataTask*)base_requestGetMethod:(NSString*)method parameter:(NSDictionary*)parameter success:(successBlock)success fail:(failedBlock)fail {
    
    
#warning 这里暂时注释掉,因为不同请求baseURL不一样
//    NSString *baseURLString = [YJBaseNetworkConfig defaultConfig].baseURLString;
    NSString *fullURLString = [NSString stringWithFormat:@"%@",method];
    // 添加一写统一的参数
    NSMutableDictionary *newParameter = [self p_unitParameter:parameter];
    
    return [YJBaseNetwork netWorkGetWithURLString:fullURLString parameter:newParameter success:success fail:fail];
}

+ (NSURLSessionDataTask*)base_requestPostMethod:(NSString *)method parameter:(NSDictionary *)parameter success:(successBlock)success fail:(failedBlock)fail {

    NSString *baseURLString = [YJBaseNetworkConfig defaultConfig].baseURLString;
    NSString *fullURLString = [NSString stringWithFormat:@"%@/%@",baseURLString,method];
    // 添加一写统一的参数
    NSMutableDictionary *newParameter = [self p_unitParameter:parameter];
    
    return [YJBaseNetwork netWorkPostWithURLString:fullURLString parameter:newParameter success:success fail:fail];
}



+(NSMutableDictionary*)p_unitParameter:(NSDictionary*)parameter {
    
    
    NSMutableDictionary *unitParameter = [parameter mutableCopy];
//    unitParameter[MNUUID] = [MNUserLoginInfo getUUID];
//    unitParameter[MNEquipType] = [MNUserLoginInfo getEquip_type];
//    unitParameter[MNT_Login] = [MNUserLoginInfo getT_login];
//    unitParameter[@"uid"] = [MNUserLoginInfo getUserLoginInfo].user_id;
//    unitParameter[@"imei"] = [MNUserLoginInfo getUserLoginInfo].imeiString;
//    if (!unitParameter[@"timestamp"]) {
//        unitParameter[@"timestamp"] = [MNUserLoginInfo getTimestamp];
//    }
//    unitParameter[@"version"] = [MNUserLoginInfo getVersion];
//    unitParameter[@"market_channel"] = [MNUserLoginInfo getMarket_channel];
//    unitParameter[@"device_info"] = [MNUserLoginInfo getDeviceInfo];
//    unitParameter[@"device_manufacturer"] = [MNUserLoginInfo getDeviceManufacturer];
//    unitParameter[@"app_id"] = [MNUserLoginInfo getAppID];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    unitParameter[@"version"] = app_Version;
//    unitParameter[@"equip_type"] = @"1";
//    unitParameter[@"app_id"] = [XWNewsUser newsUser].app_id;
//    unitParameter[@"app_key"] = [XWNewsUser newsUser].app_key;
//    unitParameter[@"timestamp"] = [self timestamp];
//    unitParameter[@"uid"] = [XWNewsUser newsUser].user_id;
//    unitParameter[@"xwsdk"] = [XWNewsSDK version];
    
    return unitParameter;
    
}


+ (NSString*)timestamp {
    
    NSDate *date = [NSDate date];
    
    NSTimeInterval time =   [date timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%ld",(NSInteger)time*1000];
}

@end
