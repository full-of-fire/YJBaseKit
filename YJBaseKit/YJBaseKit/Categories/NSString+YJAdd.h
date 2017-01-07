//
//  NSString+YJAdd.h
//  YJBaseKit
//
//  Created by yj on 17/1/6.
//  Copyright © 2017年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJAdd)

#pragma mark - 加密
/**
 MD5string

 @return  MD5string
 */
- (NSString*)yj_MD5String;


/**
 AES256的加密

 @param key 加密的密钥

 @return 加密后字符串
 */
- (NSString *)yj_AES256NSStringencrypt:(NSString *)key;

/**
 AES256的解密

 @param key 解密秘钥

 @return 解密后的结果
 */
- (NSString *)yj_AES256NSStringdecrypt:(NSString *)key;

#pragma mark - 常用正则

/**
 *  自定义正则表达式进行判断
 *
 *  @param regex 正则表达式
 *
 *  @return    BOOL
 */
- (BOOL)yj_regexWith:(NSString*)regex;

/**
 *  是否为邮箱
 *
 *  @return bool
 */
- (BOOL)yj_isEmail;

/**
 *  网址是否合法
 *
 *  @return BOOL
 */
- (BOOL)yj_isURL;

/**
 *  用户名是否合法（3-20位的数字和字母组合）
 *
 *  @return BOOL
 */
- (BOOL)yj_isUserName;
/**
 *  密码是否合法（6-20为数字和字母的组合）
 *
 *  @return BOOL
 */
- (BOOL)yj_isPassword;

/**
 *  是否为中文
 *
 *  @return BOOL
 */
- (BOOL)yj_isChinese;

/**
 *  是否为IP
 *
 *  @return BOOL
 */
- (BOOL)yj_isIP;

/**
 *  是否为 QQ
 *
 *  @return BOOL
 */
- (BOOL)yj_isQQ;

/**
 *  是否为身份证
 *
 *  @return BOOL
 */
- (BOOL)yj_isCardID;

/**
 *  是否为手机号码
 *
 *  @return BOOL
 */
- (BOOL)yj_isMobilePhone;

/**
 * 是否为英文
 *
 *  @return BOOL
 */
- (BOOL)yj_isAlphabet;

#pragma mark paths
/**
 *  获取doucment路径
 *
 *  @return doucment路径
 */
+(NSString*)yj_getDocumentPath;

/**
 *  获取主路径
 *
 *  @return 主路径
 */
+(NSString*)yj_getHomePath;

/**
 *  caches路径
 *
 *  @return caches路径
 */
+(NSString*)yj_getCachesPath;
/**
 *  获取临时文件
 *
 *  @return temp文件
 */

+(NSString*)yj_getTempPath;




#pragma mark - htmlString

/**
 *  获取html中图片标签
 *
 *  @param htmlContentString html内容字符串
 *
 *  @return img标签数组
 */
+ (NSMutableArray*)yj_filtrateImgTagWithHTMLContentString:(NSString*)htmlContentString;


/**
 *  判断字符中是否包含Emoji
 *
 *  @param string 字符串
 *
 *  @return 返回结果
 */
+ (BOOL)yj_stringContainsEmoji:(NSString *)string;



#pragma mark - Devices设备信息相关


/**
 获取手机的型号 如：iPhone6、iPhone6s

 @return 获取手机的型号
 */
+ (NSString*)yj_deviceModelName;

/**
 获取mac地址

 @return mac地址
 */
+ (NSString *)yj_deviceMacAddress;

/**
 获取ip地址

 @return ip地址
 */
+ (NSString *)yj_getIpAddresses;

@end
