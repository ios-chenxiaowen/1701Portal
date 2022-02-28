//
//  NetworkEngine+NetworkUtil.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "NetworkEngine.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkEngine (NetworkUtil)

+ (void)GETWithUrl:(NSString*)apiString
         prameters:(NSDictionary*)pramaters
           success:(SuccessBlock)successBlock
           failure:(FailureBlock)failBlock
   isShowFailAlert:(BOOL)isShowFailAlert
   failAlertString:(NSString*)failAlertString;

/**
 GET方式获取数据

 @param apiString       api地址
 @param pramaters       参数
 @param processReult    对返回值进行处理，可以为nil。处理结果将在success中返回。
 @param successBlock    成功回调
 @param failBlock       失败回调
 @param isShowFailAlert 是否显示失败提醒
 @param failAlertString 失败提醒文本
 */
+ (void)GETWithUrl:(NSString*)apiString
                           prameters:(NSDictionary*)pramaters
                       processResult:(ProcessResult)processReult
                             success:(SuccessBlock)successBlock
                             failure:(FailureBlock)failBlock
                     isShowFailAlert:(BOOL)isShowFailAlert
                     failAlertString:(NSString*)failAlertString;

+ (void)POSTWithUrl:(NSString*)apiString
                            prameters:(NSDictionary*)pramaters
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString*)failAlertString;

+ (void)POSTWithUrl:(NSString*)apiString
                            prameters:(NSDictionary*)pramaters
                        processResult:(ProcessResult)processReult
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString*)failAlertString;

/**
 post网络请求

 @param apiString api地址
 @param pramaters 参数
 @param isJsonRequset 是否使用json请求参数
 @param processReult 异步处理返回结果bolck：主要用于对数据进行加工，例如将字典转换为对象。当返回值为nil时则返回原始数据
 @param successBlock 请求成功回调
 @param failBlock 请求失败回调
 @param isShowFailAlert 是否显示请求失败HUD
 @param failAlertString 请求失败显示的提示文字，默认值为接口返回的msg字段
 */
+ (void)POSTWithUrl:(NSString *)apiString
                            prameters:(NSDictionary *)pramaters
                        isJsonRequset:(BOOL)isJsonRequset
                        processResult:(ProcessResult)processReult
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString *)failAlertString;

/**
 json格式的POST网络请求
 
 @param apiString api地址
 @param pramaters 参数
 @param processReult 异步处理返回结果bolck：主要用于对数据进行加工，例如将字典转换为对象。当返回值为nil时则返回原始数据
 @param successBlock 请求成功回调
 @param failBlock 请求失败回调
 @param isShowFailAlert 是否显示请求失败HUD
 @param failAlertString 请求失败显示的提示文字，默认值为接口返回的msg字段
 */
+ (void)POSTWithJsonUrl:(NSString*)apiString
                                prameters:(NSDictionary*)pramaters
                            processResult:(ProcessResult)processReult
                                  success:(SuccessBlock)successBlock
                                  failure:(FailureBlock)failBlock
                          isShowFailAlert:(BOOL)isShowFailAlert
                          failAlertString:(NSString*)failAlertString;


@end

NS_ASSUME_NONNULL_END
