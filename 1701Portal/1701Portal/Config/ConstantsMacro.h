//
//  ConstantsMacro.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#ifndef ConstantsMacro_h
#define ConstantsMacro_h





#pragma mark 常用
//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]
//#define DBPath(sqlString) [kDocumentPath stringByAppendingPathComponent:sqlString]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject]
//获取沙盒Library
#define kLibraryPath [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) firstObject]

//加载xib
#define XibView(nibName)[[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0]


#define MBHUD_Show [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
#define MBHUD_Hide [MBProgressHUD hideAllHUDsForView:kKeyWindow animated:YES];


#define MBHUD_result(string)       ([MBProgressHUD showError:string])
#define MBHUD_resulterror ([MBProgressHUD showError:@"网络错误，请检查您的网络"])


#define USER_DEFAULT_SET(Object,Key) [[NSUserDefaults standardUserDefaults] setObject:Object forKey:Key]
#define USER_DEFAULT_GET(Key) [[NSUserDefaults standardUserDefaults] objectForKey:Key]
#define USER_DEFAULT_REMOVE(Key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:Key]



#endif /* ConstantsMacro_h */
