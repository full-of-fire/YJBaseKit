//
//  UIButton+YJAdd.m
//  自定义按钮Demo
//
//  Created by yj on 16/12/7.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "UIButton+YJAdd.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (copy,nonatomic) void(^yj_clickHandle)(UIButton*button);

@end


@implementation UIButton (YJAdd)

+(void)load {

    MethodSwizzle(self,@selector(titleRectForContentRect:),@selector(yj_titleRectForContentRect:));
    MethodSwizzle(self,@selector(imageRectForContentRect:),@selector(yj_imageRectForContentRect:));

    MethodSwizzle(self, @selector(pointInside:withEvent:), @selector(yj_pointInside:withEvent:));
}

void MethodSwizzle(Class c,SEL origSEL,SEL overrideSEL)
{
    
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod= class_getInstanceMethod(c, overrideSEL);
    
    //运行时函数class_addMethod 如果发现方法已经存在，会失败返回，也可以用来做检查用:
    if(class_addMethod(c, origSEL, method_getImplementation(overrideMethod),method_getTypeEncoding(overrideMethod)))
    {
        //如果添加成功(在父类中重写的方法)，再把目标类中的方法替换为旧有的实现:
        class_replaceMethod(c,overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        //addMethod会让目标类的方法指向新的实现，使用replaceMethod再将新的方法指向原先的实现，这样就完成了交换操作。
        method_exchangeImplementations(origMethod,overrideMethod);
    }
}

- (CGRect)yj_titleRectForContentRect:(CGRect)contentRect {
    
    if (!CGRectIsEmpty(self.yj_titleLabelRect) && !CGRectEqualToRect(self.yj_titleLabelRect, CGRectZero)) {
        return self.yj_titleLabelRect;
    }
    return [self yj_titleRectForContentRect:contentRect];
    
}

- (CGRect)yj_imageRectForContentRect:(CGRect)contentRect {
    
    if (!CGRectIsEmpty(self.yj_imageViewRect) && !CGRectEqualToRect(self.yj_imageViewRect, CGRectZero)) {
        return self.yj_imageViewRect;
    }
    return [self yj_imageRectForContentRect:contentRect];
}



#pragma mark - getters
- (CGRect)yj_imageViewRect {

  return   [objc_getAssociatedObject(self, @selector(yj_imageViewRect)) CGRectValue];
}

- (CGRect)yj_titleLabelRect {

    return [objc_getAssociatedObject(self, @selector(yj_titleLabelRect)) CGRectValue];
}
- (void (^)(UIButton *))yj_clickHandle {

    return objc_getAssociatedObject(self, @selector(yj_clickHandle));
}




#pragma mark - setters
- (void)setYj_imageViewRect:(CGRect)yj_imageViewRect {
    
    objc_setAssociatedObject(self, @selector(yj_imageViewRect), [NSValue valueWithCGRect:yj_imageViewRect], OBJC_ASSOCIATION_RETAIN);
}

- (void)setYj_titleLabelRect:(CGRect)yj_titleLabelRect {

    objc_setAssociatedObject(self, @selector(yj_titleLabelRect), [NSValue valueWithCGRect:yj_titleLabelRect], OBJC_ASSOCIATION_RETAIN);
}

- (void)setYj_clickHandle:(void (^)(UIButton *))yj_clickHandle {

    objc_setAssociatedObject(self, @selector(yj_clickHandle), yj_clickHandle, OBJC_ASSOCIATION_COPY);
}



- (BOOL)yj_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    CGRect bounds = self.bounds;
    
    
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    //扩大bounds
    
    bounds = CGRectInset(bounds, -0.5*widthDelta, -0.5*heightDelta);
    
    
    return CGRectContainsPoint(bounds, point);
}


- (void)yj_addClickHandle:(void (^)(UIButton *))clickHandle {

    self.yj_clickHandle = clickHandle;
    
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)buttonClick:(UIButton*)button {

    if (self.yj_clickHandle) {
        
        self.yj_clickHandle(button);
    }
}

@end
