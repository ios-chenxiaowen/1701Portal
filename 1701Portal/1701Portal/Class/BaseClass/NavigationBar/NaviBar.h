//
//  NaviBar.h
//
//
//  Created by 马远 on 15/9/8.
//  Copyright (c) 2015年 Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

// 控件属性
#define	kNaviBarWMargine					15

#define ITEM_X 20
#define ITEM_Y (SYS_STATUSBAR_HEIGHT + 14)

//#define ITEM_H 15
#define ITEM_H 20
#define ITEM_W 20

#define closeBtn_X 40
#define rightBtn_X 15

#define kTitleViewTop (SYS_STATUSBAR_HEIGHT + 12)
#define kTitleLabelTop SYS_STATUSBAR_HEIGHT



@interface NaviBar : UIView

/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *  高斯模糊背景
 */
@property (nonatomic, strong) UIView *backToolBar;
/**
 *  背景图
 */
@property (nonatomic, strong) UIImageView *backgroundView;

/**
 *  底部黑线
 */
@property (nonatomic, strong) UIView *bottomLine;

/// 设置背景Image
- (void)setBackgroundImage:(UIImage *)imageNew;

/// Title
- (NSString *)title;
- (void)setTitle:(NSString *)titleNew;
- (void)setTitleColor:(UIColor *)titleColorNew;
- (void)setTitleFont:(UIFont *)titleFontNew;

/// 获取和设置左边的Item
- (UIView *)leftBarItem;
- (void)setLeftBarItem:(UIView *)viewLeftNew;

/// 获取和设置右边的Item
- (UIView *)rightBarItem;
- (void)setRightBarItem:(UIView *)viewRightNew;

/// 获取和设置标题View
- (UIView *)titleView;
- (void)setTitleView:(UIView *)viewTitleNew;

/// 隐藏和显示
- (void)showLeftBarItem:(BOOL)isShow;
- (void)showTitleView:(BOOL)isShow;
- (void)showRightBarItem:(BOOL)isShow;
- (void)showLeftTitleView:(BOOL)isShow;

/// 是否显示毛玻璃效果
- (void)showBlurView:(BOOL)isShow;

/// 隐藏和显示底部黑线
- (void)setHiddenBottomLine:(BOOL)isShow;

/// 清除右边的Button
- (void)clearAllView;
//- (void)clearRightView;

- (void)setLeftTitle:(NSString *)title;

- (void)reLayout;

+ (CGRect)getShareButtonSourceRect;

@end
