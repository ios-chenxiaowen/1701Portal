//
//  UIView+Utils.h
//
//
//  Created by 马远 on 13/9/8.
//  Copyright (c) 2013年 Yuan. All rights reserved.
//

#import "UIView+Utils.h"

#import <objc/runtime.h>

static char kAssociatedObjectKey_blurEffectView;


@interface UIScrollView ()
@end
@implementation UIScrollView (Utils)

- (CGSize)cxContentSize {
    return self.contentSize;
}

- (void)setCxContentSize:(CGSize)cxContentSize {
    CGSize currentSize = self.cxContentSize;
    if (!CGSizeEqualToSize(cxContentSize, currentSize)) {
        self.contentSize = cxContentSize;
    }
}
@end


@interface UIView()
@property (nonatomic, strong) UIVisualEffectView *blurEffectView;
@end

@implementation UIView (Utils)

static char kAssociatedObjectKey_cxStatus;
- (void)setCxStatus:(NSInteger)cxStatus {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_cxStatus, @(cxStatus), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)cxStatus {
    NSNumber *statusN = objc_getAssociatedObject(self, &kAssociatedObjectKey_cxStatus);
    if (statusN == nil) {
        return 0;
    }
    return [statusN intValue];
}


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    if (frame.origin.x != x) {
        frame.origin.x = x;
        self.frame = frame;
    }
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    if (frame.origin.y != y) {
        frame.origin.y = y;
        self.frame = frame;
    }
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    CGFloat newRight = right - frame.size.width;
    if (frame.origin.x != newRight) {
        frame.origin.x = newRight;
        self.frame = frame;
    }
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    CGFloat newBottom = bottom - frame.size.height;
    if (frame.origin.y != newBottom) {
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
    }
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    if (self.center.x != centerX) {
        self.center = CGPointMake(centerX, self.center.y);
    }
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    if (self.center.y != centerY) {
        self.center = CGPointMake(self.center.x, centerY);
    }
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    if (frame.size.width != width) {
        frame.size.width = width;
        self.frame = frame;
    }
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    if (frame.size.height != height) {
        frame.size.height = height;
        self.frame = frame;
    }
}

- (CGFloat)screenX {
    CGFloat x = 0.0f;
    for (UIView *view = self; view; view = view.superview) {
        x += view.x;
    }
    return x;
}

- (CGFloat)screenY {
    CGFloat y = 0.0f;
    for (UIView* view = self; view; view = view.superview) {
        y += view.y;
    }
    return y;
}

- (CGFloat)screenViewX {
    CGFloat x = 0.0f;
    for (UIView* view = self; view; view = view.superview) {
        x += view.x;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}



- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.y;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    if (!CGPointEqualToPoint(origin, frame.origin)) {
        frame.origin = origin;
        self.frame = frame;
    }
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    if (!CGSizeEqualToSize(size, frame.size)) {
        frame.size = size;
        self.frame = frame;
    }
}

- (CGRect)cxFrame {
    return self.frame;
}

- (void)setCxFrame:(CGRect)cxFrame {
    CGRect currentFrame = self.frame;
    if (!CGRectEqualToRect(currentFrame, cxFrame)) {
        self.frame = cxFrame;
    }
}

- (CGFloat)orientationWidth {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.height : self.width;
}

- (CGFloat)orientationHeight {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.width : self.height;
}


- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}



- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }

    return nil;
}


- (void)removeAllSubviews {
//    while (self.subviews.count) {
//        UIView *child = self.subviews.lastObject;
//        [child removeFromSuperview];
//    }
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj superview]) {
            [obj removeFromSuperview];
        }
    }];
}



- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0.0f, y = 0.0f;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.x;
        y += view.y;
    }
    return CGPointMake(x, y);
}

//- (void)shadowOffSet:(CGSize)offSet opacity:(CGFloat)opacity radius:(CGFloat)Radius shadowColor:(UIColor*)shadowColor
//{
//    [self.layer setShadowOffset:offSet];
//    [self.layer setShadowRadius:Radius];
//    [self.layer setShadowOpacity:opacity];
//    [self.layer setShadowColor:shadowColor.CGColor];
//}
//
//
///// 设置阴影效果，注：设置阴影效果的view必须设置背景颜色，否则阴影效果或扩散到子控件
///// @param offSet 偏移量
///// @param opacity 透明度
///// @param blur 模糊度（注：这里是设计图的blur参数，与UIKit的shadowRadius的关系是 blur = 8 * shadowRadius ）
///// @param shadowColor 阴影颜色
//- (void)shadowOffSet:(CGSize)offSet opacity:(CGFloat)opacity blur:(CGFloat)blur shadowColor:(UIColor*)shadowColor {
//    [self.layer setShadowOffset:offSet];
//    [self.layer setShadowRadius:blur/2.1];
//    [self.layer setShadowOpacity:opacity];
//    [self.layer setShadowColor:shadowColor.CGColor];
//}
//
//// 从view上截图
//- (UIImage *)getCurrentViewImage {
//
//    UIGraphicsBeginImageContext(self.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
//    [self.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
//    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
//
//    
//    return viewImage;
//    
//}
//
//- (UIImage *)getCurrentViewImageWithSize:(CGSize)size {
//    UIGraphicsBeginImageContext(size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
//    [self.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
//    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
//    
//    
//    return viewImage;
//}
//
//-(void)addCornerRadiusWidth:(CGFloat)width {
//    [self addCornerRadius:UIRectCornerAllCorners withWidth:width];
//}
//
//// 旋转屏幕、分屏时，请确保在did内调用，will方法可能获取不到正确的bounds
//- (void)addCornerRadius:(UIRectCorner)rectCorner withWidth:(CGFloat)width {
//    [self layoutIfNeeded];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(width, width)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
//    [self layoutSublayersOfLayer:maskLayer];
//}
///**
//  更新frame, 设置默认渐变背景颜色
//
// @param frame 更新后的frame
// */
//- (void)setFrameAndGradientBackgroundColor:(CGRect)frame {
//    
//    [self setFrame:frame];
//    
//    NSArray *colorArr = @[GetSKinColor(CXC_1A5EE6_1A5EE6), GetSKinColor(CXC_1A5EE6_1A5EE6)];
//    UIImage *backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:GradientTypeUpleftToLowright imgSize:frame.size];
//    
//    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//}
//
///**
// 更新frame并且更新渐变色背景
// 
// @param frame 更新后的frame
// @param colorArr 颜色数组，2个颜色值，传起始点和终止点的颜色值
// @param gradientType 渐变色的
// */
//- (void)setFrame:(CGRect)frame andGradientBackgroundColorWithColorArr:(NSArray<UIColor *> *)colorArr withGradientType:(GradientType)gradientType {
//    
//    [self setFrame:frame];
//    
//    UIImage *backgroundImage = nil;
//    if (!ARRAYHASVALUE(colorArr) || colorArr.count != 2 || gradientType < 0 || gradientType > 3) {
//        //默认:左上到右下方向，默认蓝色渐变
//        colorArr = @[GetSKinColor(CXC_1A5EE6_1A5EE6), GetSKinColor(CXC_1A5EE6_1A5EE6)];
//        backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:GradientTypeUpleftToLowright imgSize:frame.size];
//    } else {
//        backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:gradientType imgSize:frame.size];
//    }
//
//    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//}
//
///**
// 设置默认的渐变背景颜色（frame不改变时使用：如切换日间深色模式）
// */
//- (void)setGradientBackgroundColor {
//    
//    NSArray *colorArr = @[GetSKinColor(CXC_1A5EE6_1A5EE6), GetSKinColor(CXC_1A5EE6_1A5EE6)];
//    UIImage *backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:GradientTypeUpleftToLowright imgSize:self.frame.size];
//    
//    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//}
//
///**
// 更新渐变背景颜色 （frame不改变时使用：如切换日间深色模式）
// 
// @param colorArr 颜色数组，2个颜色值，传起始点和终止点的颜色值
// @param gradientType 渐变色的
// */
//- (void)setGradientBackgroundColorWithColorArr:(NSArray<UIColor *> *)colorArr withGradientType:(GradientType)gradientType {
//    
//    UIImage *backgroundImage = nil;
//    if (!ARRAYHASVALUE(colorArr) || colorArr.count != 2 || gradientType < 0 || gradientType > 3) {
//        //默认:左上到右下方向，默认蓝色渐变
//        colorArr = @[GetSKinColor(CXC_1A5EE6_1A5EE6), GetSKinColor(CXC_1A5EE6_1A5EE6)];
//        backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:GradientTypeUpleftToLowright imgSize:self.frame.size];
//    } else {
//        backgroundImage = [UIImage gradientColorImageFromColors:colorArr gradientType:gradientType imgSize:self.frame.size];
//    }
//    
//    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//}
//
//- (void)setGradientColor:(NSArray<UIColor *> *)colors withGradientType:(GradientType)gradientType {
//    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = self.bounds;
//    
//    NSMutableArray *ar = [NSMutableArray array];
//    for(UIColor *c in colors) {
//        [ar addObject:(id)c.CGColor];
//    }
//    gradientLayer.colors = ar;
//    gradientLayer.locations = @[@0.0, @1.0];
//    
//    switch (gradientType) {
//        case GradientTypeTopToBottom:
//            gradientLayer.startPoint = CGPointMake(0.0, 0.0);
//            gradientLayer.endPoint = CGPointMake(0.0, 1.0);
//            break;
//        case GradientTypeLeftToRight:
//            gradientLayer.startPoint = CGPointMake(0.0, 0.0);
//            gradientLayer.endPoint = CGPointMake(1.0, 0.0);
//            break;
//        case GradientTypeUpleftToLowright:
//            gradientLayer.startPoint = CGPointMake(0.0, 0.0);
//            gradientLayer.endPoint = CGPointMake(1.0, 1.0);
//            break;
//        case GradientTypeUprightToLowleft:
//            gradientLayer.startPoint = CGPointMake(1.0, 0.0);
//            gradientLayer.endPoint = CGPointMake(0.0, 1.0);
//            break;
//        default:
//            break;
//    }
//
//    [self.layer addSublayer:gradientLayer];
//}
//
//// 动画效果 - 抖动
//
//- (void)cxShake {
//    [self shake:5 withDelta:5];
//}
//
//- (void)shake:(int)times withDelta:(CGFloat)delta {
//    [self _shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:0 completion:nil];
//}
//
//- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(BOOL)horizontal completion:(nullable void (^)(void))handler {
//    [UIView animateWithDuration:interval animations:^{
//        self.transform = (horizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
//    } completion:^(BOOL finished) {
//        if(current >= times) {
//            [UIView animateWithDuration:interval animations:^{
//                self.transform = CGAffineTransformIdentity;
//            } completion:^(BOOL finished) {
//                if (handler) {
//                    handler();
//                }
//            }];
//            return;
//        }
//        [self _shake:times
//           direction:direction * -1
//        currentTimes:current + 1
//           withDelta:delta
//               speed:interval
//      shakeDirection:horizontal
//          completion:handler];
//    }];
//}
//
//
//// 动画效果 - 心跳
//- (void)cxHeartAnimation {
//    CABasicAnimation *anima = [CABasicAnimation animation];
//    anima.keyPath = @"transform.scale";
//    anima.fromValue = @(0.8);
//    anima.toValue = @(1.2);
//    anima.repeatDuration = 0.4;
//    anima.autoreverses = YES;
//    [self.layer addAnimation:anima forKey:nil];
//}
//
//// 毛玻璃视图
//- (void)setBlurEffectView:(UIVisualEffectView*)view {
//    objc_setAssociatedObject(self, &kAssociatedObjectKey_blurEffectView, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIVisualEffectView *)blurEffectView {
//    UIVisualEffectView *effectView = (UIVisualEffectView *)objc_getAssociatedObject(self, &kAssociatedObjectKey_blurEffectView);
//    return effectView;
//}
//
//- (void)cxShowBlurEffectView {
//    [self cxShowBlurEffectViewStyle:UIBlurEffectStyleDark];
//}
//
//- (void)cxShowBlurEffectViewStyle:(UIBlurEffectStyle)style {
//    UIVisualEffectView *effectView = self.blurEffectView;
//    if (effectView == nil || [effectView superview] != self) {
//        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:style];
//        effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//        effectView.alpha = 0.8f;
//        effectView.userInteractionEnabled = NO;
//        [self addSubview:effectView];
//        [self setBlurEffectView:effectView];
//    }
//    effectView.frame = self.bounds;
//    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
//}
//
//- (void)cxShadowEffect {
//    self.layer.shadowOffset = CGSizeMake(0, 2);
//    //self.layer.shadowColor= [UIColor redColor].CGColor;
//    self.layer.shadowColor= [UIColor hexAlphaStringToColor:@"13366015"].CGColor;
//    self.layer.shadowOpacity = 1;   //阴影透明度
//    self.layer.shadowRadius = 8;      //阴影半径
//    self.layer.masksToBounds = NO;
//}
//
//- (void)cxTextShadowEffect {
//    self.layer.shadowOffset = CGSizeMake(0, 2);
//    //self.layer.shadowColor= [UIColor redColor].CGColor;
//    self.layer.shadowColor= [UIColor hexAlphaStringToColor:@"13366050"].CGColor;
//    self.layer.shadowOpacity = 1;   //阴影透明度
//    self.layer.shadowRadius = 4.8;      //阴影半径
//    self.layer.masksToBounds = NO;
//}
//@end
//
//
//
//
//@implementation UITextView (CXPlaceholder)
//
//#pragma mark - Swizzle Dealloc
//
//+ (void)load {
//    // is this the best solution?
//    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
//                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
//}
//
//- (void)swizzledDealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    UITextView *textView = objc_getAssociatedObject(self, @selector(placeholderTextView));
//    if (textView) {
//        for (NSString *key in self.class.observingKeys) {
//            @try {
//                [self removeObserver:self forKeyPath:key];
//            }
//            @catch (NSException *exception) {
//                // Do nothing
//            }
//        }
//    }
//    [self swizzledDealloc];
//}
//
//
//#pragma mark - Class Methods
//#pragma mark `defaultPlaceholderColor`
//
//+ (UIColor *)defaultPlaceholderColor {
//    if (@available(iOS 13, *)) {
//        SEL selector = NSSelectorFromString(@"placeholderTextColor");
//        if ([UIColor respondsToSelector:selector]) {
//            return [UIColor performSelector:selector];
//        }
//    }
//    static UIColor *color = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        UITextField *textField = [[UITextField alloc] init];
//        textField.placeholder = @" ";
//        NSDictionary *attributes = [textField.attributedPlaceholder attributesAtIndex:0 effectiveRange:nil];
//        color = attributes[NSForegroundColorAttributeName];
//        if (!color) {
//            color = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
//        }
//    });
//    return color;
//}
//
//
//#pragma mark - `observingKeys`
//
//+ (NSArray *)observingKeys {
//    return @[@"attributedText",
//             @"bounds",
//             @"font",
//             @"frame",
//             @"text",
//             @"textAlignment",
//             @"textContainerInset",
//             @"textContainer.exclusionPaths"];
//}
//
//
//#pragma mark - Properties
//#pragma mark `placeholderTextView`
//
//- (UITextView *)placeholderTextView {
//    UITextView *textView = objc_getAssociatedObject(self, @selector(placeholderTextView));
//    if (!textView) {
//        NSAttributedString *originalText = self.attributedText;
//        self.text = @" "; // lazily set font of `UITextView`.
//        self.attributedText = originalText;
//        
//        textView = [[UITextView alloc] init];
//        textView.backgroundColor = [UIColor clearColor];
//        textView.textColor = [self.class defaultPlaceholderColor];
//        textView.userInteractionEnabled = NO;
//        objc_setAssociatedObject(self, @selector(placeholderTextView), textView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        
//        self.needsUpdateFont = YES;
//        [self updatePlaceholderTextView];
//        self.needsUpdateFont = NO;
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(updatePlaceholderTextView)
//                                                     name:UITextViewTextDidChangeNotification
//                                                   object:self];
//        
//        for (NSString *key in self.class.observingKeys) {
//            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
//        }
//    }
//    return textView;
//}
//
//
//#pragma mark `placeholder`
//
//- (NSString *)placeholder {
//    return self.placeholderTextView.text;
//}
//
//- (void)setPlaceholder:(NSString *)placeholder {
//    self.placeholderTextView.text = placeholder;
//    [self updatePlaceholderTextView];
//}
//
//- (NSAttributedString *)attributedPlaceholder {
//    return self.placeholderTextView.attributedText;
//}
//
//- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
//    self.placeholderTextView.attributedText = attributedPlaceholder;
//    [self updatePlaceholderTextView];
//}
//
//#pragma mark `placeholderColor`
//
//- (UIColor *)placeholderColor {
//    return self.placeholderTextView.textColor;
//}
//
//- (void)setPlaceholderColor:(UIColor *)placeholderColor {
//    self.placeholderTextView.textColor = placeholderColor;
//}
//
//
//#pragma mark `needsUpdateFont`
//
//- (BOOL)needsUpdateFont {
//    return [objc_getAssociatedObject(self, @selector(needsUpdateFont)) boolValue];
//}
//
//- (void)setNeedsUpdateFont:(BOOL)needsUpdate {
//    objc_setAssociatedObject(self, @selector(needsUpdateFont), @(needsUpdate), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//
//#pragma mark - KVO
//
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context {
//    if ([keyPath isEqualToString:@"font"]) {
//        self.needsUpdateFont = (change[NSKeyValueChangeNewKey] != nil);
//    }
//    [self updatePlaceholderTextView];
//}
//
//
//#pragma mark - Update
//
//- (void)updatePlaceholderTextView {
//    if (self.text.length) {
//        [self.placeholderTextView removeFromSuperview];
//    } else {
//        [self insertSubview:self.placeholderTextView atIndex:0];
//    }
//    
//    if (self.needsUpdateFont) {
//        self.placeholderTextView.font = self.font;
//        self.needsUpdateFont = NO;
//    }
//    if (self.placeholderTextView.attributedText.length == 0) {
//        self.placeholderTextView.textAlignment = self.textAlignment;
//    }
//    self.placeholderTextView.textContainer.exclusionPaths = self.textContainer.exclusionPaths;
//    self.placeholderTextView.textContainerInset = self.textContainerInset;
//    self.placeholderTextView.frame = self.bounds;
//}
//
//- (void)cxResetKeyboardAppearance {
//   self.keyboardAppearance = ([CXSkinManager getSkinType] == SkinTypeNight)?UIKeyboardAppearanceDark:UIKeyboardAppearanceLight;
//}
//
//@end
//
//
//
//
//@implementation UITextField (CXKeyboardAppearance)
//
//- (void)cxResetKeyboardAppearance {
//    self.tintColor = GetSKinColor(CXC_1A5EE6_1A5EE6);
//    self.keyboardAppearance = ([CXSkinManager getSkinType] == SkinTypeNight)?UIKeyboardAppearanceDark:UIKeyboardAppearanceLight;
//}
@end
