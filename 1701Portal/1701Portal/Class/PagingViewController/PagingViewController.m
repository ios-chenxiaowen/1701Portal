//
//  PagingViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/1.
//

#import "PagingViewController.h"
#import "JXCategoryIndicatorLineView.h"

@interface PagingViewController ()<JXCategoryViewDelegate>

@end

@implementation PagingViewController

- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, JXheightForHeaderInSection)];
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.cellSpacing = 10; //title间距
        _categoryView.contentEdgeInsetLeft = 10;//左边
        _categoryView.contentEdgeInsetRight = 10;//右边
        _categoryView.averageCellSpacingEnabled = NO;
        _categoryView.cellWidth = ([UIScreen mainScreen].bounds.size.width - 50)/4;
        _categoryView.delegate = self;
        _categoryView.titleSelectedColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
        _categoryView.titleColor = [UIColor blackColor];
        _categoryView.titleColorGradientEnabled = NO;
        _categoryView.titleLabelZoomEnabled = NO;
        _categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;
    }
    return _categoryView;
}
- (JXCategoryIndicatorLineView *)lineView {
    if (!_lineView) {
        _lineView = [[JXCategoryIndicatorLineView alloc] init];
        _lineView.indicatorColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
        _lineView.indicatorWidth = ([UIScreen mainScreen].bounds.size.width - 50)/4;
    }
    return _lineView;
}
- (JXPagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [self preferredPagingView];
        _pagerView.mainTableView.gestureDelegate = self;
    }
    return _pagerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.translucent = false;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    _titles = @[@"LIVEHOUSE", @"商城", @"排练录音混音",@"课程"];

//    _userHeaderView = [[PagingViewTableHeaderView alloc] init];
//
//    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, JXheightForHeaderInSection)];
//    //self.categoryView.titles = self.titles;
//    self.categoryView.backgroundColor = [UIColor whiteColor];
//    self.categoryView.cellSpacing = 10;
//    self.categoryView.contentEdgeInsetLeft = 10;
//    self.categoryView.contentEdgeInsetRight = 10;
//    self.categoryView.averageCellSpacingEnabled = NO;
//    self.categoryView.cellWidth = ([UIScreen mainScreen].bounds.size.width - 50)/4;
//    self.categoryView.delegate = self;
//    self.categoryView.titleSelectedColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
//    self.categoryView.titleColor = [UIColor blackColor];
//    self.categoryView.titleColorGradientEnabled = NO;
//    self.categoryView.titleLabelZoomEnabled = NO;
//    self.categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;

//    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//    lineView.indicatorColor = [UIColor colorWithRed:105/255.0 green:144/255.0 blue:239/255.0 alpha:1];
//    lineView.indicatorWidth = ([UIScreen mainScreen].bounds.size.width - 50)/4;
    self.categoryView.indicators = @[self.lineView];
    [self.view addSubview:self.pagerView];
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
    
    //导航栏隐藏的情况，处理扣边返回，下面的代码要加上
//    [self.pagerView.listContainerView.scrollView.panGestureRecognizer requireGestureRecognizerToFail:self.navigationController.interactivePopGestureRecognizer];
//    [self.pagerView.mainTableView.panGestureRecognizer requireGestureRecognizerToFail:self.navigationController.interactivePopGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (JXPagerView *)preferredPagingView {
    return [[JXPagerView alloc] initWithDelegate:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.pagerView.frame = CGRectMake(0, NavgationbarHeight, ScreenWidth, ScreenHeight - NavgationbarHeight);
}

#pragma mark - JXPagerViewDelegate

//- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
//    return self.userHeaderView;
//}
//
//- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
//    return JXTableHeaderViewHeight;
//}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return JXheightForHeaderInSection;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    //和categoryView的item数量一致
    return self.categoryView.titles.count;
}

//- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
////    ListViewController *list = [[ListViewController alloc] init];
////    list.title = self.titles[index];
////    list.isNeedHeader = self.isNeedHeader;
////    list.isNeedFooter = self.isNeedFooter;
////    if (index == 0) {
////        list.dataSource = @[@"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮", @"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮"].mutableCopy;
////    }else if (index == 1) {
////        list.dataSource = @[@"吃烤肉", @"吃鸡腿肉", @"吃牛肉", @"各种肉"].mutableCopy;
////    }else {
////        list.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾"].mutableCopy;
////    }
////    return list;
//    return @[];
//}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark - JXPagerMainTableViewGestureDelegate

- (BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    //禁止categoryView左右滑动的时候，上下和左右都可以滚动
    if (otherGestureRecognizer == self.categoryView.collectionView.panGestureRecognizer) {
        return NO;
    }
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

@end
