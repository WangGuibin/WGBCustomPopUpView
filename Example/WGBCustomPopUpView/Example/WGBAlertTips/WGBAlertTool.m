//
//  WGBAlertTool.m
//
//  Created by mac on 2019/8/1.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "WGBAlertTool.h"
#import "WGBCommonLeftRightButtonAlertView.h"

@implementation WGBAlertTool
/// 免费次数已用完的弹窗
+ (void)showFreeTimesExpiredAlertWithCallBack:(void(^)(NSInteger index))callBack{
    
    WGBCustomPopUpView *pop = [[WGBCustomPopUpView alloc] initWithFrame:CGRectZero];
    WGBCommonLeftRightButtonAlertView *alertView = [WGBCommonLeftRightButtonAlertView shareGuideVIPAlertView];
    CGFloat alertHeight = 170;
    CGFloat alertW =  KWIDTH - 80;
    if (KWIDTH <= 320) {
        alertW = 300;
    }
    alertView.frame = CGRectMake(0, 0, alertW , alertHeight);
    alertView.layer.cornerRadius = 15;
    alertView.layer.masksToBounds = YES;
    
    alertView.alertTitleLabel.text = @"免费次数已用完";
    NSString *originStr = @"每邀请1人，可享受1天VIP！\n可无限叠加哦！";
    NSString *firstSubStr = @"1人";
    NSString *secondSubStr = @"1天VIP";
    NSRange firstRange = [originStr rangeOfString:firstSubStr];
    NSRange secondRange = [originStr rangeOfString:secondSubStr];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:originStr];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#007BFA"] range:firstRange];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFAD2E"] range:secondRange];
    alertView.messageLabel.attributedText = attributeStr;
    
    UIView *bgView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [bgView addSubview: alertView];
    alertView.center = CGPointMake(KWIDTH/2.0, KHIGHT/2.0);
    pop.contentView = bgView;
    pop.animationType = WGBAlertAnimationTypeCenter;
    [pop show];
    [alertView setCancelBlock:^{
        [pop dismiss];
    }];
    
    [alertView setClickButtonActionBlock:^(NSInteger index) {
        !callBack? : callBack(index);
        [pop dismiss];
    }];
}

+ (void)showCommitConfirmCheckReviewTips:(NSString * _Nullable)tips callBack:(void(^ _Nullable)(NSInteger index))callBack {
    WGBCustomPopUpView *pop = [[WGBCustomPopUpView alloc] initWithFrame:CGRectZero];
    WGBCommonLeftRightButtonAlertView *alertView = [WGBCommonLeftRightButtonAlertView shareCommitReviewAlertView];
    if (tips.length) {
        alertView.messageLabel.text = tips;
    }
    
    CGFloat alertHeight = 170;
    CGFloat alertW =  KWIDTH - 80;
    if (KWIDTH <= 320) {
        alertW = 300;
    }
    alertView.frame = CGRectMake(0, 0, alertW , alertHeight);
    alertView.layer.cornerRadius = 15;
    alertView.layer.masksToBounds = YES;
    UIView *bgView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [bgView addSubview: alertView];
    alertView.center = CGPointMake(KWIDTH/2.0, KHIGHT/2.0);
    pop.contentView = bgView;
    pop.animationType = WGBAlertAnimationTypeCenter;
    [pop show];
    [alertView setCancelBlock:^{
        [pop dismiss];
    }];
    
    [alertView setClickButtonActionBlock:^(NSInteger index) {
        !callBack? : callBack(index);
        [pop dismiss];
    }];
}


///MARK:- 简单封装系统弹窗Alert/ActionSheet 取消下标为0 其他从上往下(从左往右)的顺序开始排列下标1起步
+ (void)showSystemStyleAlertSheetWithTitle:(NSString *)alertTitle
                              alertMessage:(NSString *)alertMessage
                               cancelTitle:(NSString *)cancelTitle
                           otherItemsTitle:(NSArray *)otherItemsTitle
                            preferredStyle:(UIAlertControllerStyle)preferredStyle
                                   handler:(void(^)(NSInteger index))callBack {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:preferredStyle];
        //取消按钮
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (callBack) {
                callBack(0);
            }
        }];
        [cancelAction setValue:[UIColor darkTextColor] forKey:@"titleTextColor"];
        [alertC addAction:cancelAction];

    //其他选项
    if (![otherItemsTitle isKindOfClass:[NSNull class]] && otherItemsTitle != nil && otherItemsTitle.count) {
        for (int i = 0; i < otherItemsTitle.count; i++) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherItemsTitle[i] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                if (callBack) {
                    callBack(i+1);
                }
            }];
            [otherAction setValue:[UIColor darkTextColor] forKey:@"titleTextColor"];
            [alertC addAction:otherAction];
        }
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:nil];
}


///MARK:- 系统自带的简单通用的左右按钮这种Alert弹窗
+ (void)showSystemStyleCommonAlertTitle:(NSString *)title
                            messageTips:(NSString *)message
                        leftButtonTitle:(NSString *)leftButtonTitle
                       rightButtonTitle:(NSString *)rightButtonTitle
                        leftButtonBlock:(dispatch_block_t)leftButtonBlock
                       rightButtonBlock:(dispatch_block_t)rightButtonBlock{
    
    [self showSystemStyleAlertSheetWithTitle:title alertMessage:message cancelTitle:leftButtonTitle otherItemsTitle:@[rightButtonTitle] preferredStyle:(UIAlertControllerStyleAlert) handler:^(NSInteger index) {
        if (index == 0) {
            !leftButtonBlock? : leftButtonBlock();
        }else{
            !rightButtonBlock? : rightButtonBlock();
        }
    }];
    
}

@end




