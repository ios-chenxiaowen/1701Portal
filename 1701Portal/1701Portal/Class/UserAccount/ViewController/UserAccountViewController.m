//
//  UserAccountViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "UserAccountViewController.h"
#import "UserInfoView.h"
#import "CellView.h"

#import "MyOrderPageViewController.h"

@interface UserAccountViewController ()
@property (nonatomic, strong)UIButton * loginOutBtn;
@property (nonatomic, strong)UIScrollView * scrollview;
@property (nonatomic, strong)UIView * contentView;
@property (nonatomic, strong)UserInfoView * userInfoView;
@property (nonatomic, strong)NSArray * titleArray;

@end

@implementation UserAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    
}
- (void)bulidNavBar {
    [super bulidNavBar];
    self.navBar.titleLabel.text = @"我的";
}
- (void)buildView {
    self.titleArray = @[@"我的订单",@"我的收藏",@"收货地址",@"联系方式"];
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NavgationbarHeight);
        make.left.right.bottom.mas_equalTo(0);
    }];
    [self.scrollview addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(self.scrollview.mas_width);
    }];



    [self.contentView addSubview:self.userInfoView];
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(120);
    }];

    for (int i = 0; i< 4; i++) {
        CellView * cellView = [[CellView alloc] initWithFrame:CGRectZero];
        cellView.titleLab.text = self.titleArray[i];
        cellView.tag = 100 + i;
        [self.contentView addSubview:cellView];
        
        cellView.tapBlock = ^(CellView * _Nonnull cellView) {
            if (cellView.tag == 100) {
                MyOrderPageViewController * myOrderVC = [[MyOrderPageViewController alloc] init];
                [self.navigationController pushViewController:myOrderVC animated:YES];
                
            } else if (cellView.tag == 101) {
                
            } else if (cellView.tag == 102) {
                
            } else if (cellView.tag == 103) {
                
            }
        };
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfoView.mas_bottom).offset(80*i + 20);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        
    }
    
    
    
    
    [self.contentView addSubview:self.loginOutBtn];
    [self.loginOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.equalTo(self.userInfoView.mas_bottom).offset(340+80);
        make.height.mas_equalTo(60);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-75);
    }];
}

//点击退出登录
-(void)loginOutBtnClick {
    
}
- (UserInfoView *)userInfoView {
    if (!_userInfoView) {
        _userInfoView = [[UserInfoView alloc] initWithFrame:CGRectZero];
       // __weak typeof(self) weakSelf = self;
        _userInfoView.btnBlock = ^{
            
        };
    }
    return _userInfoView;
}

- (UIButton *)loginOutBtn {
    if (_loginOutBtn == nil) {
        _loginOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginOutBtn addTarget:self action:@selector(loginOutBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_loginOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_loginOutBtn setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        _loginOutBtn.titleLabel.font = kfont(13);
        _loginOutBtn.backgroundColor = UIColor.systemPinkColor;
    }
    return _loginOutBtn;
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
        _contentView.backgroundColor = UIColor.whiteColor;
    }
    return _contentView;
}

@end
