//
//  UIColor+Hex.h
//  ironLGMI
//
//  Created by chengzhengfeng on 2017/7/31.
//  Copyright © 2017年 LanGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  16进制颜色，无透明度
 *
 *  @param hex 16进制颜色值
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithHex:(int)hex;

/**
 *  16禁止颜色，有透明度
 *
 *  @param hex   16进制颜色值
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithHex:(int)hex alpha:(CGFloat)alpha;

+ (UIColor *) colorWithHexString:(NSString *)hexStr;

+ (UIColor *) colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;



@end
