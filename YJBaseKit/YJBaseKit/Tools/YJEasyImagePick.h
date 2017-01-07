//
//  YJEasyImagePick.h
//  YJEasyImagePick
//
//  Created by yj on 16/12/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJEasyImagePick : NSObject

- (instancetype)initWithPresentController:(UIViewController*)presentController;

+ (void)showInPresentController:(UIViewController*)presentController result:(void(^)(NSDictionary*imageInfo))pickSuccessBlock;

@end

