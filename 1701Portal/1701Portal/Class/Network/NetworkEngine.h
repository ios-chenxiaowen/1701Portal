//
//  NetworkEngine.h
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

#define CXAPITimeOut 60

typedef void (^SuccessBlock) (id result);
typedef void (^FailureBlock) (NSError *error);
typedef id _Nullable (^ProcessResult) (id result);

typedef enum _HttpMethod {
    GET = 0,
    POST
} HttpMethod;


@interface NetworkEngine : NSObject

+ (AFHTTPSessionManager *)manager;

+ (AFHTTPSessionManager *)jsonRequestManager;

/**
 *  设置BaseUrl
 */
+ (void)setBaseUrl:(NSString *)baseUrl;

/**
 *  获取baseURL
 */
+ (NSURL *)baseUrl;

/**
 *  取消所有请求
 */
+ (void)cancelAllRequests;

/**
 *  网络请求 GET/POST
 *
 *  @param apiPath            接口名
 *  @param method             请求类型(GET/POST)
 *  @param params             参数
 *  @param customHeaderFields 自定义请求头
 *  @param requestProgress    请求进度回调
 *  @param success            成功的回调
 *  @param failure            失败的回调
 */
+ (void)requestDataAPI:(NSString *)apiPath
                method:(HttpMethod)method
                params:(NSDictionary *)params
     customHeaderField:(NSDictionary *)customHeaderFields
              progress:(void (^)(NSProgress *progress))requestProgress
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;


/**
 *  网络请求 GET/POST
 *
 *  @param apiPath            接口名
 *  @param method             请求类型(GET/POST)
 *  @param params             参数
 *  @param customHeaderFields 自定义请求头
 *  @param requestProgress    请求进度回调
 *  @param success            成功的回调
 *  @param failure            失败的回调
 */
+ (void)requestDataWithAPI:(NSString *)apiPath
                                      method:(HttpMethod)method
                                      params:(NSDictionary *)params
                           customHeaderField:(NSDictionary *)customHeaderFields
                                    progress:(void (^)(NSProgress *progress))requestProgress
                                     success:(SuccessBlock)success
                                     failure:(FailureBlock)failure;

/**
 *  网络请求 GET/POST
 *
 *  @param apiPath            接口名
 *  @param method             请求类型(GET/POST)
 *  @param isJsonRequest      是否为json参数请求
 *  @param params             参数
 *  @param customHeaderFields 自定义请求头
 *  @param requestProgress    请求进度回调
 *  @param success            成功的回调
 *  @param failure            失败的回调
 */
+ (void)requestDataWithAPI:(NSString *)apiPath
                                      method:(HttpMethod)method
                               isJsonRequest:(BOOL)isJsonRequest
                                      params:(NSDictionary *)params
                           customHeaderField:(NSDictionary *)customHeaderFields
                                    progress:(void (^)(NSProgress *progress))requestProgress
                                     success:(SuccessBlock)success
                                     failure:(FailureBlock)failure;

/**
 *  文件上传
 *
 *  @param apiPath            接口名
 *  @param params             参数
 *  @param dataArray               文件数据
 *  @param customHeaderFields 自定义请求头
 *  @param requestProgress    请求进度回调
 *  @param success            成功回调
 *  @param failure            失败回调
 */
+ (void)uploadFileAPI:(NSString *)apiPath
               params:(NSDictionary *)params
                 data:(NSArray *)dataArray
    customHeaderField:(NSDictionary *)customHeaderFields
             progress:(void (^)(NSProgress *progress))requestProgress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;


/**
 * 获取请求头信息, customHeaderFields为空则传nil
 */
+ (NSMutableDictionary *)getRequestHeader:(NSDictionary *)customHeaderFields;

@end

NS_ASSUME_NONNULL_END
