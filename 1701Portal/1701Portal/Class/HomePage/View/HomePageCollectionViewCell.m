//
//  HomePageCollectionViewCell.m
//  1701Portal
//
//  Created by aaa on 2022/3/8.
//

#import "HomePageCollectionViewCell.h"

@implementation HomePageCollectionViewCell


- (void)buildView {
    self.contentView.backgroundColor = UIColor.blueColor;
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.right.bottom.mas_equalTo(-5);
    }];
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(-5);
    }];
}

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = kfont(12);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = UIColor.redColor;
        _titleLab.text = @"测试";
        
    }
    return _titleLab;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = UIColor.greenColor;
    }
    return _imageView;
}

@end
