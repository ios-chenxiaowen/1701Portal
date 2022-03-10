//
//  UserInfoView.m
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import "UserInfoView.h"

@implementation UserInfoView

- (void)buildView {
    
    [self addSubview:self.iconImage];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(80);
    }];
    
    [self addSubview:self.nickNameLab];
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage.mas_top);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.idLab];
    [self.idLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLab.mas_bottom).offset(20);
        make.left.equalTo(self.nickNameLab.mas_left);
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.editBtn];
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
}

- (void)editBtnClick {
    if (self.btnBlock) {
        self.btnBlock();
    }
}


- (UILabel *)nickNameLab {
    if (_nickNameLab == nil) {
        _nickNameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _nickNameLab.textColor = [UIColor colorWithHexString:@"#000000"];
        _nickNameLab.font = kfont(15);
        _nickNameLab.text = @"i想熬完呢";
        _nickNameLab.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _nickNameLab;
}
- (UILabel *)idLab {
    if (_idLab == nil) {
        _idLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _idLab.textColor = [UIColor colorWithHexString:@"#000000"];
        _idLab.text = @"1231231";
        _idLab.font = kfont(15);
        _idLab.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _idLab;
}

- (UIImageView *)iconImage {
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImage.backgroundColor = UIColor.redColor;
        _iconImage.layer.masksToBounds = YES;
        _iconImage.layer.cornerRadius = 40.0;
        //_iconImage.image = [[UIImage imageNamed:@"audio_playing"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        //_iconImage.tintColor = [UIColor hexStringToColor:@"#B2E0F8"];
    }
    return _iconImage;
}

- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_editBtn setTitle:@"编辑资料" forState:UIControlStateNormal];
        [_editBtn setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        _editBtn.titleLabel.font = kfont(13);
        _editBtn.backgroundColor = UIColor.systemPinkColor;
//        [_editBtn setImage:[[UIImage imageNamed:GetSkinImageName(@"operation_close")] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//        _editBtn.tintColorName = CXC_181818_E0E0E0;
    }
    return _editBtn;
}



@end
