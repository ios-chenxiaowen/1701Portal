//
//  PagingViewController.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/1.
//

#import <UIKit/UIKit.h>
#import "JXPagerView.h"
#import "PagingViewTableHeaderView.h"
#import "ListViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryIndicatorLineView.h"

static const CGFloat JXTableHeaderViewHeight = 200;
static const CGFloat JXheightForHeaderInSection = 50;


NS_ASSUME_NONNULL_BEGIN

@interface PagingViewController : BaseViewController<JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate>

@property (nonatomic, strong) JXPagerView *pagerView;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryIndicatorLineView *lineView;
@property (nonatomic, assign) BOOL isNeedFooter;
@property (nonatomic, assign) BOOL isNeedHeader;
- (JXPagerView *)preferredPagingView;

@property (nonatomic, strong) PagingViewTableHeaderView *userHeaderView;

@end

NS_ASSUME_NONNULL_END
