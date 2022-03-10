//
//  CellView.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CellView;
typedef void (^TapBlock)(CellView * cellView);

@interface CellView : BaseView
@property (nonatomic, strong)UIView  * bcView;
@property (nonatomic, strong)UILabel * titleLab;
@property (nonatomic, strong)UIImageView * rightImage;
@property (nonatomic, copy)TapBlock tapBlock;
@end


NS_ASSUME_NONNULL_END
