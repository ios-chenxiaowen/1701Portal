//
//  NaviBar.m
//
//
//  Created by 马远 on 15/9/8.
//  Copyright (c) 2015年 Yuan. All rights reserved.
//

#import "NaviBar.h"
#import "AppDelegate.h"


static CGRect shareButtonRect;

// ==================================================================
// 布局参数
// ==================================================================

@interface NaviBar ()

/**
 *  左边视图
 */
@property (nonatomic, strong) UIView *leftView;

/**
 *  右边视图
 */
@property (nonatomic, strong) UIView *rightView;


/**
 *  自定义TitleView
 */
@property (nonatomic, strong) UIView *viewTitle;

/**
 *  左边Title
 */
@property (nonatomic, strong) UILabel *leftTitleLab;


// 刷新Layout
- (void)reLayout;

@end;


@implementation NaviBar

#pragma mark - life cycle -
// 初始化函数
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;        
        
        [self addSubview:self.backgroundView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.leftTitleLab];
        [self.backgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self);
            make.left.bottom.mas_equalTo(self);
        }];
        
        UIView *lineLayer = [UIView new];
        lineLayer.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.2f];
        lineLayer.frame = CGRectMake(0, self.height, self.width, 0.5);
        self.bottomLine = lineLayer;
        [self addSubview:lineLayer];
        [self.bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self);
            make.height.mas_equalTo(0.5);
            make.left.bottom.mas_equalTo(self);
        }];
        
        [self.backgroundView  addSubview:self.backToolBar];
        [self.backToolBar mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self);
            make.left.bottom.mas_equalTo(self.backgroundView);
        }];
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
// 设置frame
- (void)setFrame:(CGRect)frameNew
{
    [super setFrame:frameNew];
    
    // 刷新界面
    [self reLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self reLayout];
}
- (UIImageView *)backgroundView {
    
    if (_backgroundView == nil) {
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundView.contentMode = UIViewContentModeTop;
        _backgroundView.backgroundColor =[UIColor clearColor];
        [_backgroundView setClipsToBounds:YES];
         _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    }
    return _backgroundView;
}

- (UIView *)titleLabel {

    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.textColor = kTitleColor;
        _titleLabel.font = kfont(18);
        [_titleLabel setText:@""];
    }
    return _titleLabel;
}

- (UILabel *)leftTitleLab {
    if (_leftTitleLab == nil) {
        _leftTitleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _leftTitleLab.hidden = YES;
        _leftTitleLab.textColor = kTitleColor;
        _leftTitleLab.font = kfont(18);
    }
    return _leftTitleLab;
}

- (UIView *)backToolBar {
    if (_backToolBar == nil) {
        _backToolBar = [[UIView alloc] initWithFrame:self.bounds];
        _backToolBar.backgroundColor = kWhiteColor;
        _backToolBar.hidden = NO;
    }
    return _backToolBar;
}

#pragma mark - Method -

// 设置背景Image
- (void)setBackgroundImage:(UIImage *)imageNew
{
    if (imageNew == nil) {
        imageNew = [[UIImage alloc] init];
    }
    [self.backgroundView setImage:imageNew];
}

// Title
- (NSString *)title
{
    if([_titleLabel isKindOfClass:[UILabel class]])
    {
        return [(UILabel *)_titleLabel text];
    }
    
    return nil;
}

- (void)setTitle:(NSString *)titleNew
{

    if (_viewTitle != nil) {
        [_viewTitle removeFromSuperview];
    }
    
    if (_titleLabel.superview == nil) {
        [self addSubview:self.titleLabel];
    }
    
    [_titleLabel setText:titleNew];
    
    // 刷新界面
    [self reLayout];
}

- (void)setTitleColor:(UIColor *)titleColorNew
{
    if([_titleLabel isKindOfClass:[UILabel class]])
    {
        [(UILabel *)_titleLabel setTextColor:titleColorNew];
    }
}

- (void)setTitleFont:(UIFont *)titleFontNew
{
    if([_titleLabel isKindOfClass:[UILabel class]])
    {
        [(UILabel *)_titleLabel setFont:titleFontNew];
        
        // 刷新界面
        [self reLayout];
    }
}

// 获取和设置左边的Item
- (UIView *)leftBarItem
{
    return _leftView;
}

- (void)setLeftBarItem:(UIView *)viewLeftNew
{
    // 保存
    if(_leftView != nil)
    {
        [_leftView removeFromSuperview];
    }
    
    _leftView = viewLeftNew;
    [self addSubview:_leftView];
    
    // 刷新界面
    [self reLayout];
}

// 获取和设置右边的View
- (UIView *)rightBarItem
{
    return _rightView;
}

- (void)setRightBarItem:(UIView *)viewRightNew
{
    // 保存
    if(_rightView != nil)
    {
        [_rightView removeFromSuperview];
    }
    
    _rightView = viewRightNew;
    [self addSubview:_rightView];
    
    // 刷新界面
    [self reLayout];
}

// 获取和设置标题View
- (UIView *)titleView
{
    return  _viewTitle;
}

- (void)setTitleView:(UIView *)viewTitleNew
{
    
    if (_viewTitle != nil) {
        [_viewTitle removeFromSuperview];
    }
    if (_titleLabel != nil) {
        [_titleLabel removeFromSuperview];
    }
    
    _viewTitle = viewTitleNew;
    [self addSubview:_viewTitle];
    
    // 刷新界面
    [self reLayout];
}

// 隐藏和显示
- (void)showLeftBarItem:(BOOL)isShow
{
    // 重新设置左View的属性
    if(_leftView != nil)
    {
        [_leftView setHidden:!isShow];
        
        // 刷新界面
        [self reLayout];
    }
}

- (void)showTitleView:(BOOL)isShow
{
    // 重新设置TitleView的属性
    if(_viewTitle != nil)
    {
        [_viewTitle setHidden:!isShow];
        
        // 刷新界面
        [self reLayout];
    }
}

- (void)showRightBarItem:(BOOL)isShow
{
    // 重新设置右View的属性
    if(_rightView != nil)
    {
        [_rightView setHidden:!isShow];
        
        // 刷新界面
        [self reLayout];
    }
}
- (void)showLeftTitleView:(BOOL)isShow
{
    // 重新设置右View的属性
    if(_leftTitleLab != nil)
    {
        [_leftTitleLab setHidden:!isShow];
        
        // 刷新界面
        [self reLayout];
    }
}

- (void)setHiddenBottomLine:(BOOL)isShow {

    [self.bottomLine setHidden:isShow];
    self.bottomLine.hidden = YES;// 产品要求全部隐藏
    [self reLayout];

}

- (void)showBlurView:(BOOL)isShow {
    if (isShow) {
        [self setBackgroundImage:nil];
        self.backgroundColor = [UIColor clearColor];
    } else {
        self.backgroundColor = kWhiteColor;// 606 NaviBarUI
    }
    [self.backToolBar setHidden:!isShow];
    
}

- (void)clearAllView {
    [self.rightView removeFromSuperview];
    [self.titleView removeFromSuperview];
    [self.leftTitleLab removeFromSuperview];
}

- (void)setLeftTitle:(NSString *)title {
    
    if (self.leftTitleLab != nil) {
        [self.leftTitleLab removeFromSuperview];
    }

    self.leftTitleLab.text = title;
    [self.leftTitleLab sizeToFit];
//    self.leftTitleLab.hidden = !self.leftTitleLab.hidden;
    [self addSubview:self.leftTitleLab];
    [self reLayout];
}

// 刷新Layout
- (void)reLayout
{
    // 父窗口尺寸
    CGRect parentFrame = self.frame;

    // 子窗口高宽
    NSInteger spaceXStart = 0;
    NSInteger spaceXEnd = parentFrame.size.width;
    
    UIEdgeInsets safeAreaInsets = SafeAreaInsets;
    
    CGFloat fNew_ITEM_Y = 0.f;
    if ([UIDevice systemVersion] < 11.0) {
        fNew_ITEM_Y = SYS_STATUSBAR_HEIGHT + (44 - ITEM_H )/2;
    } else {
        fNew_ITEM_Y = safeAreaInsets.top + (44 - ITEM_H )/2;
    }
    // 重新设置左View的Frame属性
    if((_leftView != nil) && ([_leftView isHidden] == NO))
    {
        [_leftView sizeToFit];
        
        if (_leftView.height > 0) {
            [_leftView setFrame:CGRectMake(([UIDevice systemVersion] < 11.0 ? 0 : safeAreaInsets.left) + ITEM_X, fNew_ITEM_Y, ITEM_W, ITEM_H)];
            spaceXStart = _leftView.right;
        }
    }
    
    if((_leftTitleLab != nil) && ([_leftTitleLab isHidden] == NO))
    {
        float tmp = _leftTitleLab.height - _leftView.height;
        _leftTitleLab.origin = CGPointMake(kNaviBarWMargine + spaceXStart,fNew_ITEM_Y - tmp/2);
        
        spaceXStart = _leftTitleLab.right;
    }
    
    // 重新设置右View的Frame属性
    if((_rightView != nil) && ([_rightView isHidden] == NO))
    {
        CGSize viewRightSize = [_rightView frame].size;
        _rightView.origin = CGPointMake(spaceXEnd - viewRightSize.width - ITEM_X - ([UIDevice systemVersion] < 11.0 ? 0 : safeAreaInsets.right),fNew_ITEM_Y);
        if((_leftView != nil) && ([_leftView isHidden] == NO)) {
            _rightView.centerY = _leftView.centerY;
        }
        // 调整子窗口高宽
        spaceXEnd = [_rightView frame].origin.x;
        
        shareButtonRect = [TheAppWindow convertRect:_rightView.frame fromView:_rightView.superview];
    }
    
    // 重新设置标题View的Frame属性
    if((_titleLabel != nil) && ([_titleLabel isHidden] == NO))
    {
        /* 间距 */
        spaceXStart += kNaviBarWMargine;
        spaceXEnd -= kNaviBarWMargine;
        
        // 计算字符串的高宽
        NSString *title = [(UILabel *)_titleLabel text];
        if(STRINGHASVALUE(title))
        {
//            UIFont *fontTitle = [(UILabel *)_titleLabel font];
////            CGSize titleSize = [title sizeWithFont:fontTitle forWidth:(spaceXEnd - spaceXStart) lineBreakMode:NSLineBreakByTruncatingTail];
//            
//            NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:fontTitle,NSFontAttributeName,nil];
//            CGSize titleSize = [title boundingRectWithSize:CGSizeMake(self.width, MAXFLOAT)
//                                    options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
//                                 attributes:tdic
//                                    context:nil].size;
            // 重新设置Label的Frame属性
//            [_titleLabel setFrame:CGRectMake((NSInteger)(parentFrame.size.width - titleSize.width) / 2, 8,
//                                            titleSize.width, titleSize.height)];
            [_titleLabel setFrame:CGRectMake(spaceXStart, kTitleLabelTop,
                                             spaceXEnd-spaceXStart, parentFrame.size.height - kTitleLabelTop)];
            _titleLabel.centerX = parentFrame.size.width/2.0;
        }
    }
    
    if((_viewTitle != nil) && ([_viewTitle isHidden] == NO))
    {
        CGSize viewTitleSize = [_viewTitle frame].size;
        
        
        CGFloat titleInitX = (spaceXStart == 0) ? [_viewTitle frame].origin.x : spaceXStart;
        
        // 计算viewTitle的真实可用Size
        NSInteger viewTitleWidthMax = spaceXEnd - spaceXStart;
        if(viewTitleSize.width > viewTitleWidthMax)
        {
            viewTitleSize.width = viewTitleWidthMax;
        }
        // 当右边item不存在时
        /*如果右边item不存在但是titleview居中后起始位置左边越界时，不做居中处理*/
        if (spaceXEnd == parentFrame.size.width && (viewTitleWidthMax-viewTitleSize.width)>spaceXStart)
        {
            viewTitleWidthMax -= spaceXStart;
        }
        
        // 设置新的Frame
        [_viewTitle setFrame:CGRectMake((NSInteger)(titleInitX+(viewTitleWidthMax - viewTitleSize.width) / 2), kTitleViewTop, viewTitleSize.width, viewTitleSize.height)];
        //居中
        _viewTitle.centerX = parentFrame.size.width/2.0;
    }
}

+ (CGRect)getShareButtonSourceRect {
    return shareButtonRect;
}
@end

