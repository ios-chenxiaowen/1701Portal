//
//  BaseViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
        
    if (_navBar) {
        [self.view bringSubviewToFront:_navBar];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bulidNavBar];
    [self buildView];
    
}
- (void)bulidNavBar {
    
    if (_navBar) {
        return;
    }
    _navBar = [[NaviBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NavgationbarHeight)];
    [self.view addSubview:_navBar];
    
    if (!self.isShowBackBtn) {
        return;
    }
    
    [self addBackBtnWithSelector:nil];
}
- (void)buildView {
    
}
- (void)addBackBtnWithSelector:(SEL)sel {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectZero];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    if (sel) {
        [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    } else {
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.navBar setLeftBarItem:btn];
}
- (void)setHiddenNavBarBottomLine:(BOOL)hiddenNavBarBottomLine {
    _hiddenNavBarBottomLine = hiddenNavBarBottomLine;
    [self.navBar setHiddenBottomLine:hiddenNavBarBottomLine];
}
- (void)setBackImage:(UIImage *)image {
    if (image) {
        [(UIButton *)self.navBar.leftBarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.navBar reLayout];
    }
}
- (void)back {
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
