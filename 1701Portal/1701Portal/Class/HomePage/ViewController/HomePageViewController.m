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
@property (nonatomic, strong)UIView * view1;
@property (nonatomic, strong)UIView * view2;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
    [self createUI];
}
- (void)createUI {
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.scrollview addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(self.scrollview.mas_width);
    }];
    
    [self.contentView addSubview:self.view1];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(400);
    }];
    [self.contentView addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.view1.mas_bottom);
        make.height.mas_equalTo(400);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
    
    
    
    
}


- (UIView *)view1 {
    if (_view1 == nil) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = UIColor.redColor;
    }
    return _view1;
}

- (UIView *)view2 {
    if (_view2 == nil) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = UIColor.orangeColor;
    }
    return _view2;
}

- (UIScrollView *)scrollview {
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] init];
        _scrollview.scrollEnabled = YES;
        _scrollview.backgroundColor = UIColor.blueColor;
    }
    return _scrollview;
}
-(UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = UIColor.greenColor;
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
