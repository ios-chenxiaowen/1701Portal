//
//  UIView+Utils.h
//
//
//  Created by 马远 on 13/9/8.
//  Copyright (c) 2013年 Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Utils)

@property(nonatomic ,assign)   CGSize  cxContentSize;


@end


@interface UIView (Utils)


@property(nonatomic, assign) NSInteger cxStatus;

/**
 * frame.origin.x
 */
@property (nonatomic) CGFloat x;

/**
 * frame.origin.y
 */
@property (nonatomic) CGFloat y;

/**
 * frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * size.width
 */
@property (nonatomic) CGFloat width;

/**
 * size.height
 */
@property (nonatomic) CGFloat height;

/**
 * center.x
 */
@property (nonatomic) CGFloat centerX;

/**
 * center.y
 */
@property (nonatomic) CGFloat centerY;

/**
 * frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * frame.size
 */
@property (nonatomic) CGSize size;

/**
 * frame: diff frame can set, if not cannot set
 */
@property (nonatomic,assign) CGRect cxFrame;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView *)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView *)ancestorOrSelfWithClass:(Class)cls;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;

//
///**
// *  设置阴影,注：设置阴影效果的view必须设置背景颜色，否则阴影效果或扩散到子控件
// *
// *  @param offSet      阴影倾斜角度
// *  @param opacity     透明度
// *  @param Radius      阴影倾斜大小
// *  @param shadowColor 阴影颜色
// */
//- (void)shadowOffSet:(CGSize)offSet
//             opacity:(CGFloat)opacity
//              radius:(CGFloat)Radius
//         shadowColor:(UIColor*)shadowColor;
//
///// 设置阴影,注：设置阴影效果的view必须设置背景颜色，否则阴影效果或扩散到子控件
///// @param offSet 阴影倾斜角度
///// @param opacity 透明度
///// @param blur 模糊度（注：这里是设计图的blur参数，与UIKit的shadowRadius的关系是 blur = 8 * shadowRadius ）
///// @param shadowColor 阴影颜色
//- (void)shadowOffSet:(CGSize)offSet opacity:(CGFloat)opacity blur:(CGFloat)blur shadowColor:(UIColor*)shadowColor;
//
///**
// *  截取当前view生成一张图片
// *
// *  @return 当前view的图片
// */
//- (UIImage *)getCurrentViewImage;
//
//- (UIImage *)getCurrentViewImageWithSize:(CGSize)size;
//
//// 圆角（四个角）
//-(void)addCornerRadiusWidth:(CGFloat)width;
//
///*圆角
// UIRectCornerTopLeft
// UIRectCornerTopRight
// UIRectCornerBottomLeft
// UIRectCornerBottomRight
// */
//- (void)addCornerRadius:(UIRectCorner)rectCorner withWidth:(CGFloat)width;
//
///**
// 更新frame, 设置默认渐变背景颜色
// @param frame 更新后的frame
// */
//- (void)setFrameAndGradientBackgroundColor:(CGRect)frame;
//
///**
// 更新frame并且更新渐变色背景
// @param frame 更新后的frame
// @param colorArr 颜色数组，2个颜色值，传起始点和终止点的颜色值
// @param gradientType 渐变色的
// */
//- (void)setFrame:(CGRect)frame andGradientBackgroundColorWithColorArr:(NSArray<UIColor *> *)colorArr withGradientType:(GradientType)gradientType;
//
///**
// 设置默认的渐变背景颜色（frame不改变时使用：如切换日间深色模式）
// */
//- (void)setGradientBackgroundColor;
//
///**
// 更新渐变背景颜色 （frame不改变时使用：如切换日间深色模式）
// @param colorArr 颜色数组，2个颜色值，传起始点和终止点的颜色值
// @param gradientType 渐变色的
// */
//- (void)setGradientBackgroundColorWithColorArr:(NSArray<UIColor *> *)colorArr withGradientType:(GradientType)gradientType;
//
//- (void)setGradientColor:(NSArray<UIColor *> *)colors withGradientType:(GradientType)gradientType;
//
//
//// 动画效果 - 抖动
//- (void)cxShake;
//
//// 动画效果 - 心跳
//- (void)cxHeartAnimation;
//
//// 毛玻璃效果 - 默认 UIBlurEffectStyleDark
//- (void)cxShowBlurEffectView;
//
//// 毛玻璃效果 -
//- (void)cxShowBlurEffectViewStyle:(UIBlurEffectStyle)style;
//
//// 阴影效果
//- (void)cxShadowEffect;
//
//// 阴影效果(颜色值重，适用于文字)
//- (void)cxTextShadowEffect;
//@end
//
//
//
//FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
//FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];
//
//@interface UITextView (CXPlaceholder)
//
//@property (nonatomic, readonly) UITextView *placeholderTextView NS_SWIFT_NAME(placeholderTextView);
//
//@property (nonatomic, strong) IBInspectable NSString *placeholder;
//@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
//@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;
//
//+ (UIColor *)defaultPlaceholderColor;
///**
// 切换keyboard日深色模式
// */
//- (void)cxResetKeyboardAppearance;
//@end
//
//
//
//
//@interface UITextField (CXKeyboardAppearance)
//
//
///**
// 切换keyboard日深色模式
// */
//- (void)cxResetKeyboardAppearance;

@end
