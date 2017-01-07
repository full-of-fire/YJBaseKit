//
//  YJKeyChainTool.h
//  KeyChainDemo
//
//  Created by yj on 16/7/14.
//  Copyright © 2016年 yj. All rights reserved.
//  钥匙串工具

#import <Foundation/Foundation.h>

@interface YJKeyChainTool : NSObject


/**
 *  查询账号
 *
 *  @param service 服务类型（相当于key）
 *
 *  @return 账号
 */
+ (NSString*)yj_queryAccountWithService:(NSString*)service;


/**
 *  查询密码
 *
 *  @param service 服务类型（相当于key）
 *
 *  @return 密码
 */
+ (NSString*)yj_queryPassWordWithService:(NSString*)service;


/**
 *  添加账号
 *
 *  @param service 服务类型（相当于key）
 *  @param account 账号
 */
+ (void)yj_addAccountWithService:(NSString*)service account:(NSString*)account;


/**
 *  添加密码
 *
 *  @param service 服务类型（相当于key）
 *  @param account 密码
 */
+ (void)yj_addPasswordWithService:(NSString*)service password:(NSString*)password;

/**
 *  删除账号
 *
 *  @param service 服务类型（相当于key）
 */
+ (void)yj_deleteAccountWithService:(NSString*)service;


/**
 *  删除账号
 *
 *  @param service 服务类型（相当于key）
 */
+ (void)yj_deletePasswordWithService:(NSString*)service;

/**
 *  更新账户信息
 *
 *  @param service 服务类型（相当于key）
 */
+ (void)yj_updateAccountWithService:(NSString*)service account:(NSString*)account;


/**
 *  更新密码信息
 *
 *  @param service 服务类型（相当于key）
 */
+ (void)yj_updatePasswordWithService:(NSString*)service password:(NSString*)password;

@end
