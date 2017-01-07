//
//  ViewController.m
//  YJBaseKit
//
//  Created by yj on 17/1/6.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "ViewController.h"
#import "NSString+YJAdd.h"
#import "UIImage+YJAdd.h"
#import "UIButton+YJAdd.h"
#import "NSObject+YJAdd.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@property (assign,nonatomic) int age; // 年龄

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // devices
    NSLog(@"----model = %@",[NSString yj_deviceModelName]);
    NSLog(@"-----mac = %@",[NSString yj_deviceMacAddress]);
    NSLog(@"-----ip = %@",[NSString yj_getIpAddresses]);
    
    
    // AES256加密
    NSString *password = @"123";
    NSString *result =  [password yj_AES256NSStringencrypt:@"test"];
    NSLog(@"----加密后的结果 --- = %@",result);
    NSLog(@"----解密后的结果 ==%@",[result yj_AES256NSStringdecrypt:@"test"]);
    
    
    //文件操作相关
    
    
    
    // 创建圆形图片
    UIImage *corner = [[UIImage imageNamed:@"test.png"] yj_createCornerImageWithCornerRadius:150];
    _iconImage.image = corner;
    self.view.backgroundColor = [UIColor redColor];
    
    
    //按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"blockBtn" forState:UIControlStateNormal];
    [btn yj_addClickHandle:^(UIButton *button) {
       
        
        NSLog(@"点击事件");
    }];
    
    [self.view addSubview:btn];
    
    
    

    [self yj_addObserverBlockForKeyPath:@"age" block:^(id obj, id oldVal, id newVal) {
       
        
        NSLog(@"----change ---%@",newVal);
    }];
    
    

    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.age = 20;
}



@end
