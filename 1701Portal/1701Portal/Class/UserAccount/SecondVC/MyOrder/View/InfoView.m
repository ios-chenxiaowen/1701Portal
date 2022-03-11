//
//  InfoView.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/11.
//

#import "InfoView.h"

@interface InfoView()
@property (nonatomic, strong)UILabel * orderNumberLab;
@property (nonatomic, strong)UILabel * orderStateLab;
@property (nonatomic, strong)UIScrollView * scrollview;
@property (nonatomic, strong)UIView * contentView;
@property (nonatomic, strong)UITextField *text1;
@property (nonatomic, strong)UITextField *text2;
@property (nonatomic, strong)UITextField *text3;
@property (nonatomic, strong)UITextField *text4;
@property (nonatomic, strong)UITextField *text5;
@property (nonatomic, strong)UITextField *text6;
@property (nonatomic, strong)UITextField *text7;
@property (nonatomic, strong)UITextField *text8;
@property (nonatomic, strong)UITextField *text9;
@end

@implementation InfoView

- (void)buildView {
    self.backgroundColor = UIColor.purpleColor;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.orderNumberLab];
    [self.orderNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(20);
    }];
    [self addSubview:self.orderStateLab];
    [self.orderStateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.left.right.bottom.mas_equalTo(0);
    }];
    [self.scrollview addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(self.scrollview.mas_width);
    }];
    
    [self.contentView addSubview:self.text1];
    [self.text1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text2];
    [self.text2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text1.mas_left);
        make.right.mas_equalTo(self.text1.mas_right);
        make.top.mas_equalTo(self.text1.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text3];
    [self.text3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text2.mas_left);
        make.right.mas_equalTo(self.text2.mas_right);
        make.top.mas_equalTo(self.text2.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text4];
    [self.text4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text3.mas_left);
        make.right.mas_equalTo(self.text3.mas_right);
        make.top.mas_equalTo(self.text3.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text5];
    [self.text5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text4.mas_left);
        make.right.mas_equalTo(self.text4.mas_right);
        make.top.mas_equalTo(self.text4.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text6];
    [self.text6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text5.mas_left);
        make.right.mas_equalTo(self.text5.mas_right);
        make.top.mas_equalTo(self.text5.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.contentView addSubview:self.text7];
    [self.text7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.text6.mas_left);
        make.right.mas_equalTo(self.text6.mas_right);
        make.top.mas_equalTo(self.text6.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
    }];
   

    
    
    
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
- (UILabel *)orderStateLab {
    if (!_orderStateLab) {
        _orderStateLab = [[UILabel alloc] init];
        _orderStateLab.font = kfont(13);
        _orderStateLab.text = @"定金已支付";
        _orderStateLab.textColor = kTitleColor;
        _orderStateLab.backgroundColor = [UIColor clearColor];
    }
    return _orderStateLab;
}

- (UIScrollView *)scrollview {
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] init];
        _scrollview.scrollEnabled = YES;
        _scrollview.backgroundColor = UIColor.blueColor;
        _scrollview.showsVerticalScrollIndicator = true;
    }
    return _scrollview;
}
-(UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        //_contentView.backgroundColor = UIColor.whiteColor;
    }
    return _contentView;
}
- (UITextField *)text1 {
    if(!_text1) {
        _text1 = [[UITextField alloc] init];
        _text1.textColor = kTitleColor;
        _text1.font = kfont(kBodySize_14);
        _text1.borderStyle = UITextBorderStyleNone;
        _text1.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text1.backgroundColor = kWhiteColor;
        _text1.placeholder = @"姓名1";
    }
    return _text1;
}
- (UITextField *)text2 {
    if(!_text2) {
        _text2 = [[UITextField alloc] init];
        _text2.textColor = kTitleColor;
        _text2.font = kfont(kBodySize_14);
        _text2.borderStyle = UITextBorderStyleNone;
        _text2.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text2.backgroundColor = kWhiteColor;
        _text2.placeholder = @"姓名2";
    }
    return _text2;
}
- (UITextField *)text3{
    if(!_text3) {
        _text3 = [[UITextField alloc] init];
        _text3.textColor = kTitleColor;
        _text3.font = kfont(kBodySize_14);
        _text3.borderStyle = UITextBorderStyleNone;
        _text3.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text3.backgroundColor = kWhiteColor;
        _text3.placeholder = @"姓名3";
    }
    return _text3;
}
- (UITextField *)text4 {
    if(!_text4) {
        _text4 = [[UITextField alloc] init];
        _text4.textColor = kTitleColor;
        _text4.font = kfont(kBodySize_14);
        _text4.borderStyle = UITextBorderStyleNone;
        _text4.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text4.backgroundColor = kWhiteColor;
        _text4.placeholder = @"姓名4";
    }
    return _text4;
}
- (UITextField *)text5 {
    if(!_text5) {
        _text5 = [[UITextField alloc] init];
        _text5.textColor = kTitleColor;
        _text5.font = kfont(kBodySize_14);
        _text5.borderStyle = UITextBorderStyleNone;
        _text5.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text5.backgroundColor = kWhiteColor;
        _text5.placeholder = @"姓名5";
    }
    return _text5;
}
- (UITextField *)text6 {
    if(!_text6) {
        _text6 = [[UITextField alloc] init];
        _text6.textColor = kTitleColor;
        _text6.font = kfont(kBodySize_14);
        _text6.borderStyle = UITextBorderStyleNone;
        _text6.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text6.backgroundColor = kWhiteColor;
        _text6.placeholder = @"姓名6";
    }
    return _text6;
}
- (UITextField *)text7 {
    if(!_text7) {
        _text7 = [[UITextField alloc] init];
        _text7.textColor = kTitleColor;
        _text7.font = kfont(kBodySize_14);
        _text7.borderStyle = UITextBorderStyleNone;
        _text7.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text7.backgroundColor = kWhiteColor;
        _text7.placeholder = @"姓名7";
    }
    return _text7;
}
@end
