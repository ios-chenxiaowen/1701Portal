//
//  LookOrderViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/11.
//

#import "LookOrderViewController.h"
#import "PerfectInformationViewController.h"

#import "InfoView.h"

@interface LookOrderViewController ()
@property (nonatomic, strong)InfoView *infoView;
@property (nonatomic, strong)UIButton * perfectInformationBtn;
@property (nonatomic, strong)UIButton * openbillBtn;
@property (nonatomic, strong)UIButton * payBtn;
@end

@implementation LookOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    // Do any additional setup after loading the view.
}
- (void)bulidNavBar {
    self.isShowBackBtn = YES;
    [super bulidNavBar];
    self.navBar.titleLabel.text = @"订单详情";
}
- (void)buildView {
    
    [self.view addSubview:self.payBtn];
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-IS_SAFETY-20);
    }];
    [self.view addSubview:self.openbillBtn];
    [self.openbillBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.payBtn.mas_top).offset(-20);
    }];
    [self.view addSubview:self.perfectInformationBtn];
    [self.perfectInformationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.openbillBtn.mas_top).offset(-20);
    }];
    
    [self.view addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NavgationbarHeight + 20);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(self.perfectInformationBtn.mas_top).offset(-40);
    }];
   
  


}
- (void)perfectInformationBtnClick {
    PerfectInformationViewController * perfectVC = [[PerfectInformationViewController alloc] init];
    [self.navigationController pushViewController:perfectVC animated:YES];
}

- (void)openbillBtnClick {
    
}

- (void)payBtnClick {
    
}
-(InfoView *)infoView {
    if (_infoView == nil) {
        _infoView = [[InfoView alloc] initWithFrame:CGRectZero];
    }
    return _infoView;
}


- (UIButton *)perfectInformationBtn {
    if (!_perfectInformationBtn) {
        _perfectInformationBtn = [[UIButton alloc] init];
        _perfectInformationBtn.backgroundColor = [UIColor purpleColor];
        _perfectInformationBtn.titleLabel.font = kfont(14);
        [_perfectInformationBtn setTitle:@"完善信息" forState:UIControlStateNormal];
        [_perfectInformationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_perfectInformationBtn addTarget:self action:@selector(perfectInformationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _perfectInformationBtn;
}
- (UIButton *)openbillBtn {
    if (!_openbillBtn) {
        _openbillBtn = [[UIButton alloc] init];
        _openbillBtn.backgroundColor = [UIColor purpleColor];
        _openbillBtn.titleLabel.font = kfont(14);
        [_openbillBtn setTitle:@"开发票" forState:UIControlStateNormal];
        [_openbillBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_openbillBtn addTarget:self action:@selector(openbillBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openbillBtn;
}

- (UIButton *)payBtn {
    if (!_payBtn) {
        _payBtn = [[UIButton alloc] init];
        _payBtn.backgroundColor = [UIColor purpleColor];
        _payBtn.titleLabel.font = kfont(14);
        [_payBtn setTitle:@"支付演出费用" forState:UIControlStateNormal];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}


@end
