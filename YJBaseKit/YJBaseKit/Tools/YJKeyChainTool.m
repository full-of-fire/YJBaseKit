//
//  YJKeyChainTool.m
//  KeyChainDemo
//
//  Created by yj on 16/7/14.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJKeyChainTool.h"
#import <Security/Security.h>
@implementation YJKeyChainTool

+ (NSString*)yj_queryAccountWithService:(NSString *)service {

   return  [self p_queryChainItemWithService:service accountOrPassword:YES];
}

+ (NSString*)yj_queryPassWordWithService:(NSString *)service {

    return  [self p_queryChainItemWithService:service accountOrPassword:NO];

}


+ (void)yj_addAccountWithService:(NSString *)service account:(NSString *)account {

    [self p_addChainItemWithService:service key:account account:YES];
}

+ (void)yj_addPasswordWithService:(NSString *)service password:(NSString *)password {

    [self p_addChainItemWithService:service key:password account:NO];

}



+ (void)yj_deleteAccountWithService:(NSString *)service {

    [self p_deleteChainItemWithService:service account:YES];
}

+ (void)yj_deletePasswordWithService:(NSString *)service {

    [self p_deleteChainItemWithService:service account:NO];

}


+ (void)yj_updateAccountWithService:(NSString *)service account:(NSString *)account {
    
    
    [self p_updateChainItemWithService:service key:account account:YES];
}

+ (void)yj_updatePasswordWithService:(NSString *)service password:(NSString *)password {

    [self p_updateChainItemWithService:service key:password account:NO];

}







#pragma mark - 查询账号或者密码
+ (NSString*)p_queryChainItemWithService:(NSString *)service accountOrPassword:(BOOL)accountOrPassword {

    id secType;
    
    if (accountOrPassword) {
        
        secType = (__bridge id)kSecAttrAccount;
    }
    else {
    
        secType = (__bridge id)kSecAttrService;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    query[secType] = service;
    query[(__bridge id)kSecReturnData] = @YES;

    
    CFTypeRef  dataTypeRef = NULL;
    
    
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)(query), &dataTypeRef);
    
    if (status == errSecSuccess) {
        
        NSData *resultData = (__bridge_transfer NSData*)dataTypeRef;
        
        NSString *resultString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        
        return resultString;
    }
    else {
        
    
        return nil;
    }
    
   
    
}


#pragma mark - 添加账号和密码
+ (void)p_addChainItemWithService:(NSString*)service key:(NSString*)key account:(BOOL)account {

    
    id secType;
    
    if (account) {
        
        secType = (__bridge id)kSecAttrAccount;
    }
    else {
        
        secType = (__bridge id)kSecAttrService;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    
    query[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAlways;
    
    query[secType] = service;
    query[(__bridge id)kSecValueData] = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    
   OSStatus status = SecItemAdd((__bridge CFMutableDictionaryRef)(query), NULL);

    if (status == errSecSuccess) {
        
        NSLog(@"添加成功");
    }
    else {
    
        NSLog(@"添加失败");
    }

}



#pragma mark - 更新账号或者密码
+ (void)p_updateChainItemWithService:(NSString*)service key:(NSString*)key account:(BOOL)account {

    
    id secType;
    
    if (account) {
        
        secType = (__bridge id)kSecAttrAccount;
    }
    else {
        
        secType = (__bridge id)kSecAttrService;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    query[secType] = service;
    

    NSData *updateData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *changes = @{(__bridge id)kSecValueData : updateData};
    
    
   OSStatus status = SecItemUpdate((__bridge CFMutableDictionaryRef)(query), (__bridge CFDictionaryRef)(changes));

    if (status == errSecSuccess) {
        
        NSLog(@"更新成功");
    }
    else {
        
        NSLog(@"更新失败");
    }

    
}


+ (void)p_deleteChainItemWithService:(NSString*)service account:(BOOL)account{

    
    
    id secType;
    
    if (account) {
        
        secType = (__bridge id)kSecAttrAccount;
    }
    else {
        
        secType = (__bridge id)kSecAttrService;
    }
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    query[secType] = service;
    
    OSStatus status =  SecItemDelete((__bridge CFMutableDictionaryRef)(query));
    if (status == errSecSuccess) {
        
        NSLog(@"更新成功");
    }
    else {
        
        NSLog(@"更新失败");
    }

    
}

@end
