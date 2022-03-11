//
//  LiveHouseTableViewCell.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/11.
//

#import "LiveHouseTableViewCell.h"

@interface LiveHouseTableViewCell()
@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)UILabel *  orderNumberLab;
@property (nonatomic, strong)UILabel *  siteNameLab;
@property (nonatomic, strong)UILabel *  paidLab;
@property (nonatomic, strong)UILabel *  amountLab;
@property (nonatomic, strong)UIButton * lookOrderBtn;
@end

@implementation LiveHouseTableViewCell

- (void)buildView {
    self.backgroundColor = kBodyColor;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(25);
        make.height.mas_equalTo(150);
    }];
    
    [self.bgView addSubview:self.orderNumberLab];
    [self.orderNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(20);
    }];
    [self.bgView addSubview:self.siteNameLab];
    [self.siteNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(30);
    }];
    [self.bgView addSubview:self.paidLab];
    [self.paidLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-10);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(30);
    }];
    [self.bgView addSubview:self.amountLab];
    [self.amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.paidLab.mas_right).offset(5);
        make.bottom.equalTo(self.paidLab.mas_bottom);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(30);
    }];
    [self.bgView addSubview:self.lookOrderBtn];
    [self.lookOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
}
- (void)loadData:(id)data {
//    self.orderNumberLab.text = STR_FORMAT(@"订单号: %@",@"123");
//    self.siteNameLab.text = @"123";
//    self.amountLab.text = @"123";
//    self.siteNameLab.text = @"123";
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)lookOrderBtnClick {
    if (self.cellBtnClickBlock) {
        self.cellBtnClickBlock(self.indexPath);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kWhiteColor;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 5.0;
    }
    return _bgView;
}
- (UILabel *)orderNumberLab {
    if (!_orderNumberLab) {
        _orderNumberLab = [[UILabel alloc] init];
        _orderNumberLab.font = kfont(13);
        _orderNumberLab.text = @"订单号码: 9879909890kkjkj";
        _orderNumberLab.textColor = kBodyColor;
        _orderNumberLab.backgroundColor = [UIColor clearColor];
    }
    return _orderNumberLab;
}

- (UILabel *)siteNameLab {
    if (!_siteNameLab) {
        _siteNameLab = [[UILabel alloc] init];
        _siteNameLab.font = kfont(13);
        _siteNameLab.text = @"PRO场地 2022年7月11日";
        _siteNameLab.textColor = kBodyColor;
        _siteNameLab.backgroundColor = [UIColor clearColor];
    }
    return _siteNameLab;
}


- (UILabel *)paidLab {
    if (!_paidLab) {
        _paidLab = [[UILabel alloc] init];
        _paidLab.font = kfont(13);
        _paidLab.text = @"实付款";
        _paidLab.textColor = kBodyColor;
        _paidLab.backgroundColor = [UIColor clearColor];
    }
    return _paidLab;
}

- (UILabel *)amountLab {
    if (!_amountLab) {
        _amountLab = [[UILabel alloc] init];
        _amountLab.font = kfont(13);
        _amountLab.text = @"¥800";
        _amountLab.textColor = UIColor.redColor;
        _amountLab.backgroundColor = [UIColor clearColor];
    }
    return _amountLab;
}
- (UIButton *)lookOrderBtn {
    if (!_lookOrderBtn) {
        _lookOrderBtn = [[UIButton alloc] init];
        _lookOrderBtn.backgroundColor = [UIColor purpleColor];
        _lookOrderBtn.titleLabel.font = kfont(14);
        [_lookOrderBtn setTitle:@"查看订单" forState:UIControlStateNormal];
        [_lookOrderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_lookOrderBtn addTarget:self action:@selector(lookOrderBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lookOrderBtn;
}




@end
