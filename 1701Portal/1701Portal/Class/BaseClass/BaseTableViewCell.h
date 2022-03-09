//
//  BaseTableViewCell.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
- (void)buildView;
- (void)loadData:(id)data;
@end

NS_ASSUME_NONNULL_END
