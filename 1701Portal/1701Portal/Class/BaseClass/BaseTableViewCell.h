//
//  BaseTableViewCell.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^CellBtnClickBlock)(NSIndexPath * indexPath);

@interface BaseTableViewCell : UITableViewCell
@property (nonatomic, strong)NSIndexPath * indexPath;
@property (nonatomic, copy)CellBtnClickBlock cellBtnClickBlock;
- (void)buildView;
- (void)loadData:(id)data;
@end

NS_ASSUME_NONNULL_END
