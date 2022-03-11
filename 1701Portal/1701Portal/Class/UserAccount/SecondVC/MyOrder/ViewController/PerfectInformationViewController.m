//
//  PerfectInformationViewController.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/11.
//

#import "PerfectInformationViewController.h"
#import "InfoView.h"

@interface PerfectInformationViewController ()
@property (nonatomic, strong)InfoView *infoView;
@property (nonatomic, strong)UIButton * inputBtn;
@end

@implementation PerfectInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    // Do any additional setup after loading the view.
}
- (void)bulidNavBar {
    self.isShowBackBtn = YES;
    [super bulidNavBar];
    self.navBar.titleLabel.text = @"完善信息";
}
- (void)buildView {
    
    [self.view addSubview:self.inputBtn];
    [self.inputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-IS_SAFETY-20);
    }];
   
    [self.view addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NavgationbarHeight + 20);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(self.inputBtn.mas_top).offset(-40);
    }];
   
  


}
- (void)perfectInformationBtnClick {
    
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


- (UIButton *)inputBtn {
    if (!_inputBtn) {
        _inputBtn = [[UIButton alloc] init];
        _inputBtn.backgroundColor = [UIColor purpleColor];
        _inputBtn.titleLabel.font = kfont(14);
        [_inputBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_inputBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_inputBtn addTarget:self action:@selector(perfectInformationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _inputBtn;
}


@end
