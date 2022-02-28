//
//  MBProgressHUD+CXProgressHUD.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (CXProgressHUD)
+ (void)cx_showWithText:(NSString *)text icon:(NSString *)icon toView:(UIView *)view;

+ (void)cx_showProgressView;

+ (void)cx_hideProgressView ;

+ (void)cx_showInfoWithStatus:(NSString *)text;

+ (void)cx_showSuccessWithStatus:(NSString *)text ;

+ (void)cx_showFailureWithStatus:(NSString *)text ;
@end

NS_ASSUME_NONNULL_END
