//
//  YJLoadIngView.m
//  加载中和加载失败Demo
//
//  Created by yj on 16/12/6.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJLoadIngView.h"

@interface YJLoadIngView()

@property (strong,nonatomic) UIActivityIndicatorView *indicator;

@property (strong,nonatomic) UILabel *messageLabel;

@end

@implementation YJLoadIngView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _indicator = [[UIActivityIndicatorView alloc] init];
        _indicator.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_indicator];
        _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        
        _messageLabel = [UILabel new];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = @"疯狂加载中...";
        _messageLabel.textColor = [UIColor lightGrayColor];
        _messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_messageLabel];
        
        
        
        
        
        NSLayoutConstraint *messageCenterX = [NSLayoutConstraint constraintWithItem:_messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        
        NSLayoutConstraint *messageCenterY = [NSLayoutConstraint constraintWithItem:_messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        
        [self addConstraints:@[messageCenterX,messageCenterY]];

        
        NSLayoutConstraint *indicatorCenterX = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        
        NSLayoutConstraint *indicatorWidth = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:30];
        
        NSLayoutConstraint *indicatorHeight = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:30];
        
         NSLayoutConstraint *indicatorBottom = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_messageLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:-10];
        
        [self addConstraints:@[indicatorCenterX,indicatorWidth,indicatorHeight,indicatorBottom]];
        
        
        
        
        
        
        
        
    }
    return self;
}



+ (instancetype)showInView:(UIView*)view {
    
    
    
    YJLoadIngView *loadIngView = [[YJLoadIngView alloc] init];
    
    [loadIngView showInView:view];
    
    return loadIngView;
}

+ (void)hideForView:(UIView*)view {

    
    YJLoadIngView *loading = [self loadingForView:view];
    
    if (loading) {
        
        [loading hide];
    }
    
}







- (void)showInView:(UIView*)view {

    if (!view)return;
    
    if (self.superview!=view) {
        
        [self removeFromSuperview];
        
        [view addSubview:self];
        
        [view bringSubviewToFront:self];
        
        
        [self addConstraintInView:view edgeInset:UIEdgeInsetsZero];
        
    }
    
    
    [self.indicator startAnimating];
        
}

- (void)hide {

    self.alpha = 1.0;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        
        [self.indicator stopAnimating];
        
        [self removeFromSuperview];
    }];
}


- (void)dealloc {

    [self.indicator stopAnimating];
}


#pragma mark - 私有
- (void)addConstraintInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:edgeInset.top]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:edgeInset.left]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:edgeInset.right]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:edgeInset.bottom - 44]];
}


+ (YJLoadIngView*)loadingForView:(UIView*)view {

    NSEnumerator *reverseSubViews = [view.subviews reverseObjectEnumerator];
    
    for (UIView *subView in reverseSubViews) {
        
        if ([subView isKindOfClass:self]) {
            
            return (YJLoadIngView*)subView;
        }
    }
    
    return nil;
}


@end
