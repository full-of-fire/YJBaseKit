//
//  YJEasyImagePick.m
//  YJEasyImagePick
//
//  Created by yj on 16/12/28.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJEasyImagePick.h"
#import <UIKit/UIKit.h>
@interface YJEasyImagePickManager : NSObject<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

+ (instancetype)defalutEasyImagePickManager;

@property (weak,nonatomic) UIViewController *presentController;

@property (strong,nonatomic) UIImagePickerController *imagePicker;

@property (copy,nonatomic) void (^pickSuccessBlock)(NSDictionary *imageInfo);

@end

static YJEasyImagePickManager*instance = nil;
@implementation YJEasyImagePickManager


+ (instancetype)defalutEasyImagePickManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}


#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if (buttonIndex == 0) {
        
       
        /*UIImagePickerControllerCameraDeviceRear,
         UIImagePickerControllerCameraDeviceFront*/
        if (![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear] && ![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            
            [self p_showMessage:@"相机不可用"];
            return;
        }
         self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.presentController presentViewController:self.imagePicker animated:YES completion:nil];
    }
    else if (buttonIndex==1){
        
        if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            [self p_showMessage:@"相册不可访问"];
            return;
        };
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self.presentController presentViewController:self.imagePicker animated:YES completion:nil];
    }
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.presentController = nil;
    self.imagePicker = nil;
    
    
    if (self.pickSuccessBlock) {
        
        self.pickSuccessBlock(info);
    }
    
    NSLog(@"%@",info);
    // 在这里要压缩图片
    UIImage *originImage ;
    
    if (info[UIImagePickerControllerEditedImage]) {
        
        
        originImage  = info[UIImagePickerControllerEditedImage];
    }
    else{
        
        originImage = info[UIImagePickerControllerOriginalImage];
    }
    
    
    //    UIImage *saveImage = [self imageWithImageSimple:originImage scaledToSize:CGSizeMake(100, 100)];
    
    
    //    NSData *jpgData = UIImageJPEGRepresentation(saveImage, 1);
    
    
    //    NSString *path =  [MNImageUpLoad saveImage:[UIImage imageWithData:jpgData] WithName:@"icon.png"];
    
    
    
    //    [MNImageUpLoad postRequestWithURL:MNImageUploadURL picFilePath:path  forCompleteBlock:^(NSError *error, id dict) {
    //
    //
    //        if (dict&&[dict[@"ret"] intValue]==1) {
    //
    //
    //            NSString *iconUrl = [NSString stringWithFormat:@"%@/%@",MNMainImageURL,dict[@"info"][@"md5"]];
    //
    //            [self.modifyIconView.iconImageView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:LoadFailImage];
    //
    //            // 解档
    //            MNUserLoginInfo *info = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSString yj_savePathWithKey:MNLoginInfoKey]];
    //
    //            info.avatar_url = iconUrl;
    //
    //            // 在归档
    //            [NSKeyedArchiver archiveRootObject:info toFile:[NSString yj_savePathWithKey:MNLoginInfoKey]];
    //
    //            [self p_requseModifyInfoWithNickName:info.nickname avatar_url:iconUrl];
    //
    //        }
    
    
    
    
    //    }];
    
    
    
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.imagePicker = nil;
    self.presentController = nil;
}


- (void)p_showMessage:(NSString*)message {
    
    if(!message || message.length == 0) return;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:message delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
    [alert show];
    
    
}
#pragma mark - lazy
- (UIImagePickerController*)imagePicker {
    
    if (_imagePicker  == nil) {
        
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        
        _imagePicker.modalTransitionStyle  = UIModalTransitionStyleCoverVertical;
        _imagePicker.allowsEditing = YES;
    }
    return _imagePicker;
}


@end


@implementation YJEasyImagePick

- (instancetype)initWithPresentController:(UIViewController *)presentController {

    if (self = [super init]) {
     
        
       
        
         [YJEasyImagePickManager defalutEasyImagePickManager].presentController = presentController;
        
    }
    return self;
}



+ (void)showInPresentController:(UIViewController*)presentController result:(void (^)(NSDictionary *))pickSuccessBlock {

    
    YJEasyImagePick *easyImagePick = [[YJEasyImagePick alloc] initWithPresentController:presentController];
    
    [YJEasyImagePickManager defalutEasyImagePickManager].pickSuccessBlock = [pickSuccessBlock copy];
    
    UIActionSheet * actionsheet = [[UIActionSheet alloc]initWithTitle:nil delegate:[YJEasyImagePickManager defalutEasyImagePickManager] cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选取", nil];
    [actionsheet showInView:presentController.view];
}









@end



