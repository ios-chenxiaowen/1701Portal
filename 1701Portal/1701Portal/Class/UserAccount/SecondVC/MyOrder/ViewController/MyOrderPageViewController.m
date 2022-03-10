//
//  MyOrderPageViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/10.
//

#import "MyOrderPageViewController.h"

@interface MyOrderPageViewController ()

@end

@implementation MyOrderPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryView.titles = @[@"LIVEHOUSE", @"商城", @"排练录音混音",@"课程"];
    self.isNeedHeader = YES;
    self.isNeedFooter = YES;
    self.pagerView.mainTableView.bounces = false;
    //self.pagerView.pinSectionHeaderVerticalOffset = 0;
    [self.categoryView reloadData];
   // [self.pagerView reloadData];
}

- (void)bulidNavBar {
    [super bulidNavBar];
    self.navBar.titleLabel.text = @"订单";

    
}


- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return 0;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    ListViewController *list = [[ListViewController alloc] init];
    list.title =self.categoryView.titles[index];
    list.isNeedHeader = self.isNeedHeader;
    list.isNeedFooter = self.isNeedFooter;
    if (index == 0) {
        list.dataSource = @[@"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮", @"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮"].mutableCopy;
    }else if (index == 1) {
        list.dataSource = @[@"吃烤肉", @"吃鸡腿肉", @"吃牛肉", @"各种肉"].mutableCopy;
    }else {
        list.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾"].mutableCopy;
    }
    return list;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
