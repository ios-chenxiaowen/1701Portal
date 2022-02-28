//
//  BaseNavigationController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //取消导航栏的透明效果
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UIBarStyleDefault;
    //设置导航栏的样式，同时可以改变状态栏字体颜色
//    self.navigationBar.barStyle = UIBarStyleBlack;
    
    //设置背景颜色
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    //设置标题字体颜色
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18],NSFontAttributeName,nil]];
    //按钮字体和图标颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backButton.titleLabel.font = [UIFont systemFontOfSize:14];

        UIImage *theImage = [UIImage imageNamed:@"返回"];
        theImage = [theImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [backButton setImage:theImage forState:UIControlStateNormal];
        backButton.tintColor = [UIColor grayColor];
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

        backButton.frame = CGRectMake(0, 0, 40, 40);
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backButton addTarget:self action:@selector(navigationBack) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    // 修改tabBra的frame,适配iPhone X Push过程中TabBar位置上移
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

#pragma mark - 响应事件
-(void)navigationBack
{
    [self popViewControllerAnimated:YES];
}

//同样的在界面出现时候开启隐藏
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.navBarHairlineImageView.hidden = YES;
}

//在页面消失的时候就让出现
 -(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   // self.navBarHairlineImageView.hidden = NO;
}

@end
