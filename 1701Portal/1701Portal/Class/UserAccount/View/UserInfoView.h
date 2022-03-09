//
//  UserInfoView.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UserInfoView : BaseView
@property (nonatomic, strong)UIImageView * iconImage;
@property (nonatomic, strong)UILabel * nickNameLab;
@property (nonatomic, strong)UILabel * idLab;
@property (nonatomic, strong)UIButton * editBtn;
@property (nonatomic, copy)BtnClickBlock btnBlock;
@end

NS_ASSUME_NONNULL_END
