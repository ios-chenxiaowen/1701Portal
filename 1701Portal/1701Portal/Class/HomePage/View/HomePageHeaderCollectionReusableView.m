//
//  HomePageHeaderCollectionReusableView.m
//  1701Portal
//
//  Created by aaa on 2022/3/8.
//

#import "HomePageHeaderCollectionReusableView.h"

@interface HomePageHeaderCollectionReusableView()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView * sdScrollView;
@end

@implementation HomePageHeaderCollectionReusableView

- (void)buildView {
    self.backgroundColor = UIColor.redColor;
    [self addSubview:self.sdScrollView];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"---点击了第%ld张图片", (long)index);
}
- (void)setTitleArray:(NSArray *)titleArray {
    _sdScrollView.titlesGroup = titleArray;
}
- (void)setImagesURLStringsArray:(NSArray *)imagesURLStringsArray {
    _sdScrollView.imageURLStringsGroup = imagesURLStringsArray;
}

- (SDCycleScrollView *)sdScrollView {
    if (_sdScrollView == nil) {
        _sdScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.width, self.height) delegate:self placeholderImage:nil];
        _sdScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _sdScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    }
    return _sdScrollView;
}
@end
