//
//  HomePageViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()
@property (nonatomic, strong)UIScrollView * scrollview;
@property (nonatomic, strong)UIView * contentView;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
    
}
- (void)createUI {
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.scrollview addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.width.mas_equalTo(self.scrollview);
    }];
    
    
    
    
}




- (UIScrollView *)scrollview {
    if (_scrollview == nil) {
        _scrollview = [UIScrollView new];
    }
    return _scrollview;
}
-(UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [UIView new];
    }
    return _contentView;
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
