//
//  MyOrderViewController.h
//  1701Portal
//
//  Created by ios小文 on 2022/3/10.
//

#import <UIKit/UIKit.h>

typedef enum {
    MyOrderTypeLiveHouse = 0,//livehouse
    MyOrderTypeRecording, //录音混音
    MyOrderTypeCurriculum//课程
} MyOrderType;

NS_ASSUME_NONNULL_BEGIN

@interface MyOrderViewController : BaseViewController
@property (nonatomic, assign)MyOrderType orderType;
@end

NS_ASSUME_NONNULL_END
