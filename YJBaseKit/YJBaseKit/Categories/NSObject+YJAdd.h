//
//  NSObject+YJAdd.h
//  runtime归档
//
//  Created by yj on 16/12/22.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (YJAdd)

// 归档相关
- (void)yj_decoderWithClass:(Class)decodeClass decoder:(NSCoder*)decoder;

- (void)yj_encoderWithClass:(Class)encodeClass encoder:(NSCoder*)encoder;



/**
 获取当前可用的navigationController，如果没有返回nil

 @return 可用的navigationController
 */
- (UINavigationController*)yj_currentNaviController;

// push 和 pop 相关操作
- (void)yj_pushViewController:(UIViewController *)viewController;
- (UIViewController *)yj_popViewController;
- (NSArray *)yj_popToRootViewController;
- (NSArray *)yj_popToViewController:(UIViewController *)viewController;




#pragma mark - KVO

/**
 *  通过Block方式注册一个KVO，通过该方式注册的KVO无需手动移除，其会在被监听对象销毁的时候自动移除,所以下面的两个移除方法一般无需使用
 *
 *  @param keyPath 监听路径
 *  @param block   KVO回调block，obj为监听对象，oldVal为旧值，newVal为新值
 */
- (void)yj_addObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)(id obj, id oldVal, id newVal))block;

/**
 *  提前移除指定KeyPath下的BlockKVO(一般无需使用，如果需要提前注销KVO才需要)
 *
 *  @param keyPath 移除路径
 */
- (void)yj_removeObserverBlockForKeyPath:(NSString *)keyPath;

/**
 *  提前移除所有的KVOBlock(一般无需使用)
 */
- (void)yj_removeAllObserverBlocks;

#pragma mark - Notification

/**
 *  通过block方式注册通知，通过该方式注册的通知无需手动移除，同样会自动移除
 *
 *  @param name  通知名
 *  @param block 通知的回调Block，notification为回调的通知对象
 */
- (void)yj_addNotificationForName:(NSString *)name block:(void (^)(NSNotification *notification))block;

/**
 *  提前移除某一个name的通知
 *
 *  @param name 需要移除的通知名
 */
- (void)yj_removeNotificationForName:(NSString *)name;

/**
 *  提前移除所有通知
 */
- (void)yj_removeAllNotification;

/**
 *  发送一个通知
 *
 *  @param name     通知名
 *  @param userInfo 数据字典
 */
- (void)yj_postNotificationWithName:(NSString *)name userInfo:(nullable NSDictionary *)userInfo;


#pragma mark - crateModelHelper


/**
 字典转模型帮助方法（不需要一个个敲每个属性）

 @param dict      需要转的字典
 @param modelName 模型名字
 */
+(void)yj_createModelWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName;



@end

#define YJCodeImplemention \
- (void)encodeWithCoder:(NSCoder *)aCoder \
{\
[self yj_encoderWithClass:self.class encoder:aCoder];\
}\
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder\
{\
    if (self = [super init]) {\
[self yj_decoderWithClass:self.class decoder:aDecoder];\
}\
    return self;\
}\
