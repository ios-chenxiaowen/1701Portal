//
//  MBProgressHUD+CXProgressHUD.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "MBProgressHUD+CXProgressHUD.h"

@implementation MBProgressHUD (CXProgressHUD)
+ (void)cx_showWithText:(NSString *)text icon:(NSString *)icon toView:(UIView *)view {
    if (!text.length && !icon.length) {
        return;
    }
    [MBProgressHUD hideHUDForView:view animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    if (icon) {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: icon]];
    } else {
        hud.mode = MBProgressHUDModeText;
    }
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.label.text = text;
    [view addSubview:hud];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.0];
}


+ (void)cx_showProgressView {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].delegate.window animated:NO];
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
}

+ (void)cx_hideProgressView {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].delegate.window animated:YES];
}



+ (void)cx_showInfoWithStatus:(NSString *)text {
    [MBProgressHUD cx_showWithText:text icon:nil toView:[UIApplication sharedApplication].delegate.window];
}

+ (void)cx_showSuccessWithStatus:(NSString *)text {
    [MBProgressHUD cx_showWithText:text icon:@"MBProgressHud_success" toView:[UIApplication sharedApplication].delegate.window];
}

+ (void)cx_showFailureWithStatus:(NSString *)text {
    [MBProgressHUD cx_showWithText:text icon:@"MBProgressHud_failure" toView:[UIApplication sharedApplication].delegate.window];
}
@end
