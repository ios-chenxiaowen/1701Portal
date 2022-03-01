//
//  UIConfigurationFile.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#ifndef UIConfigurationFile_h
#define UIConfigurationFile_h


// 判断字符串是否有值
#define STRINGHASVALUE(str)        (str && [str isKindOfClass:[NSString class]] && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

// 判断字典是否有值
#define DICTIONARYHASVALUE(dic)    (dic && [dic isKindOfClass:[NSDictionary class]] && [dic count] > 0)

// 判断数组是否有值
#define ARRAYHASVALUE(array)    (array && [array isKindOfClass:[NSArray class]] && [array count] > 0)

// 判断NSNumber是否有值
#define NUMBERHASVALUE(number)    (number && [number isKindOfClass:[NSNumber class]])

// 获取合法字符串
#define GETVALIDSTRING(str) (STRINGHASVALUE(str) ? str : @"")

// 获取合法字典
#define GETVALIDDICTIONARY(dic) (DICTIONARYHASVALUE(dic) ? dic : @{})

// 获取合法数组
#define GETVALIDARRAY(array) (ARRAYHASVALUE(array) ? array : @[])

// 获取合法Number
#define GETVALIDNUMBER(number) (NUMBERHASVALUE(number) ? number : @"")








/*颜色*/
#define ColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

/*颜色*/
#define COLOR(value) [UIColor colorWithHex:value]
/*颜色带透明度*/
#define COLOR_ALPHA(value,alpha1) [UIColor colorWithHex:value alpha:alpha1]



//主调色
#define kMainColor  [UIColor colorWithRed:0/255.0 green:117/255.0 blue:229/255.0 alpha:1.0]
//[UIColor colorWithHex:0xe8374c]
#define searchBarColor   [UIColor colorWithHex:0xfd6375]
#define kemptyshoppingCartColor  [UIColor colorWithHex:0xc9c9c9]
//导航白色
#define kWhiteColor [UIColor whiteColor]
//红色
#define kMoneyColor   [UIColor colorWithHex:0xff0008]
//按钮按下效果
#define ButtonColor   [UIColor colorWithHex:0x08628e]
//分割线颜色
#define klineColor   [UIColor colorWithRed:241/255.0 green:242/255.0 blue:243/255.0 alpha:1.0]
//字体颜色
#define kTitleColor   [UIColor colorWithHex:0x222222]    //偏黑
#define kBodyColor   [UIColor colorWithHex:0x777777]     //偏灰
//字体样式
#define kfont(size)   [UIFont systemFontOfSize:size]     //字体
#define kBoldFont(size)   [UIFont boldSystemFontOfSize:size]     //字体
//字体大小
#define kHeaderSize_18 18
#define kTitleSize_16 16
#define kBodySize_14 14
#define ksearchSize_13 13
#define ksmallBodySize_12 12
#define kLittleSize_11 11
#define ksmallLittleSize_9 9

//系统版本号
//#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//系统版本判断
#define IOS_VERSION_8  kSystemVersion >= 8.0
#define IOS_VERSION_9  kSystemVersion >= 9.0
#define IOS_VERSION_10 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max)?(YES):(NO)
#define IOS_VERSION_11  kSystemVersion >= 11.0

//判断是否是iPhonex
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iPhoneX [[UIScreen mainScreen] bounds].size.width >= 375.0f && [[UIScreen mainScreen] bounds].size.height >= 812.0f && IS_IPHONE
// 适配iPhone x 底栏高度
#define TabbarHeight (iPhoneX?83:49)
#define NavgationbarHeight (iPhoneX?88:64)
#define StatusBarHeight  (iPhoneX?44:20)

#define IS_SAFETY (iPhoneX? 34 : 0)

//获取当前设备屏幕的物理尺寸
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)


#define TITLE_SIZE(str,font)   [str boundingRectWithSize:CGSizeMake(300, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size



#endif /* UIConfigurationFile_h */
