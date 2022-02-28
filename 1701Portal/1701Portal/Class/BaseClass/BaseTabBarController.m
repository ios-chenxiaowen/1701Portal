//
//  BaseTabBarController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//


#import "BaseTabBarController.h"

#define MallClassKey   @"rootVCClassString"
#define MallTitleKey   @"title"
#define MallImgKey     @"imageName"
#define MallSelImgKey  @"selectedImageName"

@interface BaseTabBarController ()<UITabBarDelegate,UITabBarControllerDelegate>
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * imageArray;
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    self.tabBarController.tabBar.delegate = self;
    self.delegate = self;
}


/**
 *  添加子控制器
 */
- (void)setupChildViewControllers
{
    NSArray *childArray = @[
                            @{MallClassKey  : @"HomePageViewController",
                              MallTitleKey  : @"首页",
                              MallImgKey    : @"首页_底部标签_首页",
                              MallSelImgKey : @"首页_底部标签_首页_选中"},
                            
                            @{MallClassKey  : @"MessageViewController",
                              MallTitleKey  : @"消息",
                              MallImgKey    : @"首页_底部标签_消息",
                              MallSelImgKey : @"首页_底部标签_消息_选中"},
                            
                            @{MallClassKey  : @"UserAccountViewController",
                              MallTitleKey  : @"我的",
                              MallImgKey    : @"首页_底部标签_我的",
                              MallSelImgKey : @"首页_底部标签_我的_选中"},
                            ];
    
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
        vc.navigationItem.title = dict[MallTitleKey];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[MallTitleKey];
        item.image = [UIImage imageNamed:dict[MallImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
        [self addChildViewController:nav];
        
    }];

}
/**
 *  设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes
{
    //[UIColor colorWithRed:206/255.0 green:10/255.0 blue:36/255.0 alpha:1.0];
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = kMainColor;
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

#pragma mark ---UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
}
#pragma mark ---UITabBarControllerDelegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    BaseNavigationController *selectednav = (BaseNavigationController *)tabBarController.selectedViewController;
//    BaseNavigationController *nav = (BaseNavigationController *)viewController;
//    BaseNavigationController *messegeNav = (BaseNavigationController *)self.viewControllers[1];
//    BaseNavigationController *shoppingNav = (BaseNavigationController *)self.viewControllers[2];
//    if (nav == messegeNav) {
//        //消息
//        //判断是否登录
//        if ([NSObject czf_isNullOrNilOrBankWithObject:[LGUserInfo sharedLGUserInfo].token]) {
//            //未登录
//            LGLoginViewController *loginVC = [[LGLoginViewController alloc]init];
//            [selectednav pushViewController:loginVC animated:YES];
//            return NO;
//        }
//    }else if (nav == shoppingNav){
//        //购物车
//        //判断是否登录
//        if ([NSObject czf_isNullOrNilOrBankWithObject:[LGUserInfo sharedLGUserInfo].token]) {
//            //未登录
//            LGLoginViewController *loginVC = [[LGLoginViewController alloc]init];
//            [selectednav pushViewController:loginVC animated:YES];
//            return NO;
//        }
//        //已登录
//        LGShopingCarViewController *vc = (LGShopingCarViewController *)nav.viewControllers[0];
//        //刷新
//        [vc headerRereshing];
//    }
    return YES;
    
}


@end
