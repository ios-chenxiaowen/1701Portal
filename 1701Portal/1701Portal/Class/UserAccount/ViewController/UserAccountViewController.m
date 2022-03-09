//
//  UserAccountViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "UserAccountViewController.h"
#import "UserInfoView.h"
#import "CellView.h"

@interface UserAccountViewController ()
@property (nonatomic, strong)UIView * view2;
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
- (void)buildView {
    self.titleArray = @[@"我的订单",@"我的收藏",@"收货地址",@"联系方式"];
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
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
        cellView.tag = 100 + i;
        [self.contentView addSubview:cellView];
        [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userInfoView.mas_bottom).offset(20*i + 80);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        
    }
    
    
    
    
    
    [self.contentView addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.userInfoView.mas_bottom).offset(100*4 + 40);
        make.height.mas_equalTo(400);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(0);
    }];
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

@end
