//
//  YJLoadFailView.m
//  加载中和加载失败Demo
//
//  Created by yj on 16/12/6.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJLoadFailView.h"

@interface YJLoadFailView ()

@property (strong,nonatomic) UIImageView *loadImageView;

@property (strong,nonatomic) UILabel *messageLabel;

@property (strong,nonatomic) UIButton *retryButton;

@property (copy,nonatomic) void(^retryHandle)();


@end


@implementation YJLoadFailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textColor = [UIColor lightGrayColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = @"加载失败";
        _messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_messageLabel];
        
        _loadImageView = [[UIImageView alloc] init];
        _loadImageView.image = [UIImage imageNamed:@"XWNewsImages.bundle/e404.png"];
        _loadImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _loadImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_loadImageView];
        
     
        
        
        _retryButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_retryButton addTarget:self action:@selector(retryAction) forControlEvents:UIControlEventTouchUpInside];
        _retryButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_retryButton setTitle:@"点击重试" forState:UIControlStateNormal];
        [_retryButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _retryButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_retryButton];
        
        
        
        NSLayoutConstraint *messageCenterX = [NSLayoutConstraint constraintWithItem:_messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        
        NSLayoutConstraint *messageCenterY = [NSLayoutConstraint constraintWithItem:_messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        
        [self addConstraints:@[messageCenterX,messageCenterY]];
        
        
        
        
        
        NSLayoutConstraint *loadImageViewCenterX = [NSLayoutConstraint constraintWithItem:_loadImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        
        NSLayoutConstraint *loadImageViewWidth = [NSLayoutConstraint constraintWithItem:_loadImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40];
        
        NSLayoutConstraint *loadImageViewHeight = [NSLayoutConstraint constraintWithItem:_loadImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40];
        
        NSLayoutConstraint *loadImageViewBottom = [NSLayoutConstraint constraintWithItem:_loadImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_messageLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:-10];
        loadImageViewBottom.priority = UILayoutPriorityDefaultLow;
        [self addConstraints:@[loadImageViewCenterX,loadImageViewWidth,loadImageViewHeight,loadImageViewBottom]];
        
        
        
        
        
        NSLayoutConstraint *retryButtonCenterX = [NSLayoutConstraint constraintWithItem:_retryButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *retryButtonTop = [NSLayoutConstraint constraintWithItem:_retryButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_messageLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
        NSLayoutConstraint *retryButtonWith = [NSLayoutConstraint constraintWithItem:_retryButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70];
        NSLayoutConstraint *retryButtonHeight = [NSLayoutConstraint constraintWithItem:_retryButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
        
        _retryButton.layer.cornerRadius = 15;
        _retryButton.clipsToBounds = YES;
        _retryButton.layer.borderWidth = 1;
        _retryButton.layer.borderColor = [UIColor grayColor].CGColor;
        
        
        [self addConstraints:@[retryButtonCenterX,retryButtonTop,retryButtonWith,retryButtonHeight]];
        

        
        
    }
    return self;
}


- (void)retryAction {

    
    if (self.retryHandle) {
        
        self.retryHandle();
    }
}


+ (void)showInView:(UIView *)view retryHandle:(void (^)())retryHandle

{
    YJLoadFailView *failView = [[YJLoadFailView alloc] init];
    
    [failView showInView:view retryHandle:retryHandle];
}


+ (void)hideForView:(UIView*)view {

    YJLoadFailView *loadFailView = [self loadFailedForView:view];
    
    if (loadFailView) {
        
        [loadFailView hide];
    }
}






#pragma mark - 实例方法

- (void)showInView:(UIView *)view retryHandle:(void (^)())retryHandle
{
    if (!view) {
        return ;
    }
    if (self.superview != view) {
        
        [self removeFromSuperview];
        
        [view addSubview:self];
        
        [view bringSubviewToFront:self];
        
        self.retryHandle = retryHandle;
        
        [self addConstraintInView:view edgeInset:UIEdgeInsetsZero];
    }
}

- (void)addConstraintInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:edgeInset.top]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:edgeInset.left]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:edgeInset.right]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:edgeInset.bottom - 44]];
}

- (void)hide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



+ (YJLoadFailView *)loadFailedForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (YJLoadFailView *)subview;
        }
    }
    return nil;
}

@end
