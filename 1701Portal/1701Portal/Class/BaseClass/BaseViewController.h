//
//  BaseViewController.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import <UIKit/UIKit.h>
#import "NaviBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong, readonly) NaviBar *navBar;
@property (nonatomic, assign) BOOL isShowBackBtn;
@property (nonatomic, assign) BOOL hiddenNavBarBottomLine;


- (void)bulidNavBar;
- (void)buildView;

/*
 添加默认的返回按钮
 */
- (void)addBackBtnWithSelector:(SEL)sel;
- (void)back;
- (void)setBackImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
