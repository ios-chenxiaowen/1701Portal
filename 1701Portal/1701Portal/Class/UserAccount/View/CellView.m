//
//  CellView.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import "CellView.h"

@implementation CellView
- (void)buildView {
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self addGestureRecognizer:tap];
    
    [self addSubview:self.bcView];
    [self.bcView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(60);
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bcView.mas_top);
        make.bottom.equalTo(self.bcView.mas_bottom);
        make.left.equalTo(self.bcView.mas_left);
        make.right.equalTo(self.bcView.mas_right);
    }];
    

//    [self addSubview:self.rightImage];
//    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.bcView.mas_right).offset(-5);
//        make.centerY.equalTo(self.bcView.mas_height);
//        make.width.mas_equalTo(10);
//        make.height.mas_equalTo(30);
//    }];
    
}

- (void)tapClick {
    if (self.btnBlock) {
        self.btnBlock();
    }
}


- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLab.textColor = [UIColor colorWithHexString:@"#F5F6F8"];
        _titleLab.font = kfont(15);
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
- (UIView *)bcView {
    if (_bcView == nil) {
        _bcView = [[UIView alloc] initWithFrame:CGRectZero];
        _bcView.layer.masksToBounds = YES;
        _bcView.layer.cornerRadius = 5.0;
        _bcView.layer.borderWidth = 1;
        _bcView.layer.borderColor = kMoneyColor.CGColor;
    }
    return _bcView;
}

- (UIImageView *)rightImage {
    if (_rightImage == nil) {
        _rightImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImage.backgroundColor = UIColor.redColor;
        //_iconImage.image = [[UIImage imageNamed:@"audio_playing"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        //_iconImage.tintColor = [UIColor hexStringToColor:@"#B2E0F8"];
    }
    return _rightImage;
}

@end
