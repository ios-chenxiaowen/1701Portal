//
//  NetworkEngine.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "NetworkEngine.h"
#import "AFNetworkActivityIndicatorManager.h"


static NSString *privateNetworkBaseUrl = @"";
@implementation NetworkEngine

// 设置baseUrl
+ (void)setBaseUrl:(NSString *)baseUrl {
    privateNetworkBaseUrl = baseUrl;
}

// baseUrl
+ (NSURL *)baseUrl {
    
    NSURL *baseUrl = [NSURL URLWithString:privateNetworkBaseUrl];
    return baseUrl;
}

// 取消所有请求
+ (void)cancelAllRequests {
    [[NetworkEngine manager].operationQueue cancelAllOperations];
    // 取消菊花
    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
}

+ (AFHTTPSessionManager *)manager {

    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 开启菊花
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        // 初始化
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        // 超时时长
        manager.requestSerializer.timeoutInterval = CXAPITimeOut;
        // 最大并发数
        manager.operationQueue.maxConcurrentOperationCount = 3;
        // 缓存类型，忽略本地缓存
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
        // response类型
        NSMutableSet *contetType = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
        [contetType addObjectsFromArray:@[@"text/html",@"text/plain"]];
        manager.responseSerializer.acceptableContentTypes = contetType;
    });
    
    return manager;
}

+ (AFHTTPSessionManager *)jsonRequestManager {
    static AFHTTPSessionManager *jsonRequestManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 开启菊花
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        // 初始化
        jsonRequestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        jsonRequestManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [jsonRequestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        // 超时时长
        jsonRequestManager.requestSerializer.timeoutInterval = CXAPITimeOut;
        // 最大并发数
        jsonRequestManager.operationQueue.maxConcurrentOperationCount = 3;
        // 缓存类型，忽略本地缓存
        jsonRequestManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    });
    
    return jsonRequestManager;
}


+ (void)requestDataAPI:(NSString *)apiPath
                method:(HttpMethod)method
                params:(NSDictionary *)params
     customHeaderField:(NSDictionary *)customHeaderFields
              progress:(void (^)(NSProgress *progress))requestProgress
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [NetworkEngine manager];
    
    if (!STRINGHASVALUE(apiPath)) {
        if (failure) {
            NSError *error = [[NSError alloc] initWithDomain:@"无效地址" code:9999 userInfo:nil];
            failure(error);
            return;
        }
    }
        
    // 自定义请求头
    NSMutableDictionary *headerDic = [self getRequestHeader:customHeaderFields];
    
    if (headerDic) {
        [headerDic enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    // 请求进度
    void (^theAFHRequestProgress)(NSProgress *progress) = ^void(NSProgress *progress) {
        if (requestProgress) {
            requestProgress(progress);
        }
    };
    
    
    // 成功回调
    void (^theAFHTTPRequestSuccess)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^void(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            APILog(@"API:%@ \nParams:%@ \nJSON: %@", task.response.URL, [params mj_JSONString] , [responseObject mj_JSONString]);
            success(responseObject);
        }
    };
    
    // 失败回调
    void (^theAFHTTPRequestFailure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^void(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
            
            NSInteger responseStatusCode = [httpResponse statusCode];
            APILog(@"Error %tu: %@", responseStatusCode, error);
            // 错误处理
            failure(error);
        }
    };
    
    switch (method) {
        case GET:
            APILog(@"==================================\nGET->%@\nParams:%@\n---------------------------------",apiPath,params);

            [manager GET:apiPath parameters:params headers:nil progress:theAFHRequestProgress success:theAFHTTPRequestSuccess failure:theAFHTTPRequestFailure];
            break;
        case POST:
            APILog(@"==================================\nPOST->%@\nParams:%@\n---------------------------------",apiPath,[params mj_JSONString]);
            [manager POST:apiPath parameters:params headers:nil progress:theAFHRequestProgress success:theAFHTTPRequestSuccess failure:theAFHTTPRequestFailure];
            
            break;
            
        default:
            break;
    }
}

#pragma mark newRequest
+ (void)requestDataWithAPI:(NSString *)apiPath
                                      method:(HttpMethod)method
                                      params:(NSDictionary *)params
                           customHeaderField:(NSDictionary *)customHeaderFields
                                    progress:(void (^)(NSProgress *))requestProgress
                                     success:(SuccessBlock)success
                                     failure:(FailureBlock)failure {
    
    [NetworkEngine requestDataWithAPI:apiPath
                                     method:method
                              isJsonRequest:NO params:params
                          customHeaderField:customHeaderFields
                                   progress:requestProgress
                                    success:success
                                    failure:failure];
}

+ (void)requestDataWithAPI:(NSString *)apiPath
                                      method:(HttpMethod)method
                               isJsonRequest:(BOOL)isJsonRequest
                                      params:(NSDictionary *)params
                           customHeaderField:(NSDictionary *)customHeaderFields
                                    progress:(void (^)(NSProgress *))requestProgress
                                     success:(SuccessBlock)success
                                     failure:(FailureBlock)failure {
    AFHTTPSessionManager *manager;
    if (isJsonRequest) {
        manager = [NetworkEngine jsonRequestManager];
    } else {
        manager = [NetworkEngine manager];
    }
    
    if (!STRINGHASVALUE(apiPath)) {
        if (failure) {
            NSError *error = [[NSError alloc] initWithDomain:@"无效地址" code:9999 userInfo:nil];
            failure(error);
        }
    }
        
    // 自定义请求头
    NSMutableDictionary *headerDic = [self getRequestHeader:customHeaderFields];
    
    // 自定义请求头
    if (headerDic) {
        [headerDic enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    // 请求进度
    void (^theAFHRequestProgress)(NSProgress *progress) = ^void(NSProgress *progress) {
        if (requestProgress) {
            requestProgress(progress);
        }
    };
    
    
    // 成功回调
    void (^theAFHTTPRequestSuccess)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^void(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            APILog(@"API:%@ \nParams:%@ \nJSON: %@", task.response.URL, [params mj_JSONString], [responseObject mj_JSONString]);
            success(responseObject);
        }
    };
    
    // 失败回调
    void (^theAFHTTPRequestFailure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^void(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
            
            NSInteger responseStatusCode = [httpResponse statusCode];
            APILog(@"Error %tu: %@", responseStatusCode, error);
            // 错误处理
            failure(error);
        }
    };
    
    
    switch (method) {
        case GET:
            APILog(@"==================================\nGET->%@\nParams:%@\n---------------------------------",apiPath,params);
        
           [manager GET:apiPath parameters:params headers:nil progress:theAFHRequestProgress success:theAFHTTPRequestSuccess failure:theAFHTTPRequestFailure];
            break;
        case POST:
            if (isJsonRequest) {
                APILog(@"==================================\nPOST->%@\nParams:%@\n---------------------------------",apiPath,[params mj_JSONString]);
            } else {
                APILog(@"==================================\nPOST->%@\nParams:%@\n---------------------------------",apiPath,[params mj_JSONString]);
            }
            [manager POST:apiPath parameters:params headers:nil progress:theAFHRequestProgress success:theAFHTTPRequestSuccess failure:theAFHTTPRequestFailure];
            break;
            
        default:
            break;
    }
}


+ (void)uploadFileAPI:(NSString *)apiPath
               params:(NSDictionary *)params
                 data:(NSArray *)dataArray
    customHeaderField:(NSDictionary *)customHeaderFields
             progress:(void (^)(NSProgress *progress))requestProgress
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure
{
    
    AFHTTPSessionManager *manager = [NetworkEngine manager];
        
    // 自定义请求头
    NSMutableDictionary *headerDic = [self getRequestHeader:customHeaderFields];
    
    if (headerDic) {
        [headerDic enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    // 请求进度
    void (^theAFHRequestProgress)(NSProgress *progress) = ^void(NSProgress *progress) {
        if (requestProgress) {
            requestProgress(progress);
        }
    };
    
    // 成功回调
    void (^theAFHTTPRequestSuccess)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^void(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            APILog(@"API:%@ \nParams:%@ \nJSON: %@", task.response.URL, [params mj_JSONString], [responseObject mj_JSONString]);
            success(responseObject);
        }
    };
    
    // 失败回调
    void (^theAFHTTPRequestFailure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^void(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
            NSInteger responseStatusCode = [httpResponse statusCode];
            APILog(@"Error %tu: %@", responseStatusCode, error);
            failure(error);
        }
    };
    
    APILog(@"==================================\nPOST->%@\nParams:%@\n---------------------------------",apiPath,[params mj_JSONString]);
    [manager POST:apiPath parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //在这个block 中上传文件数据
        //formData就是专门用于保存需要上传文件的二进制数据的
        /*
         第一个参数：需要上传的文件二进制
         第二个参数：服务器对应的参数名称
         第三个参数：文件的文件
         第四个参数：文件的MIME类型
         */
        NSInteger i = 1;
        for (CXUploadDataModel *model in dataArray) {
            switch (model.uploadType) {
                case UploadTypeZip:
                [formData appendPartWithFileData:model.data
                                            name:model.keyName
                                        fileName:model.fileName
                                        mimeType:@"zip"];
                    break;
                
                case UploadTypeImage:
                {
                    NSData *data = nil;
                    if (model.imageCompressData) {
                        data = model.imageCompressData;
                    } else {
                        data = UIImagePNGRepresentation(model.image);
                    }
                    
                    [formData appendPartWithFileData:data
                                                name:model.keyName?:[NSString stringWithFormat:@"file%ld",(long)i]
                                            fileName:[NSString stringWithFormat:@"123.jpg"]
                                            mimeType:@"image/jpg"];
                    i++;
                }
                    break;
            }
        }
    } progress:theAFHRequestProgress success:theAFHTTPRequestSuccess failure:theAFHTTPRequestFailure];
}

/**
 * 获取请求头信息, customHeaderFields为空则传nil
 */
+ (NSMutableDictionary *)getRequestHeader:(NSDictionary *)customHeaderFields {
    NSMutableDictionary *headerDic = [NSMutableDictionary dictionary];
//    if (DICTIONARYHASVALUE(customHeaderFields)) {
//        [headerDic addEntriesFromDictionary:customHeaderFields];
//    }
    
//    // 设置请求头
//    NSMutableString *requestHeader = [NSMutableString string];
//    [requestHeader appendFormat:@"systype=iOS&"];
//    [requestHeader appendFormat:@"channel=AppStore&"];
//    [requestHeader appendFormat:@"sysversion=%f&",[UIDevice systemVersion]];
//    [requestHeader appendFormat:@"apptype=%@&",PARAMS_UNIT];
//    [requestHeader appendFormat:@"appversion=%@&",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
//    //7.0.1版本添加
//    [requestHeader appendFormat:@"appversionbulid=%@&",CurrentBundleVersion];
//    [requestHeader appendFormat:@"device=%@&",[CXBootstrap deviceId]];
////    NSString *deviceName = [[UIDevice currentDevice].name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSString *deviceName = [[UIDevice currentDevice].name replaceUrlSpecialChar];
//    [requestHeader appendFormat:@"device_name=%@&",deviceName];
////    [requestHeader appendFormat:@"device_name=%@&",[UIDevice currentDevice].name];
//    [requestHeader appendFormat:@"push_token=%@",[USER_DEFAULT objectForKey:DEVICE_TOKEN]];
//
//    if ([CXUserInfo isLogin]) {
//        [requestHeader appendFormat:@"&uid=%@",[CXUserInfo userID]];
//        [requestHeader appendFormat:@"&code=%@",[CXUserInfo loginCode]];
//    } else {
//        [requestHeader appendFormat:@"&uid=0"];
//        [requestHeader appendFormat:@"&code=0"];
//    }
//    [requestHeader appendFormat:@"&unit=%@",CXUnit];
//    [requestHeader appendFormat:@"&deviceType=%@",CXDeviceType];
//    [requestHeader appendFormat:@"&transactionid=%@",[CXUUID getUUID]];
//    NSString *encr = [NSString stringWithFormat:@"%@",[CXEncryptUtil encryptTextWithKey:requestHeader key:@"1234abcd"]];
//
//    NSString *encodedString =  [encr URLEncodedString];
//    [headerDic setObject:encodedString forKey:@"appinfo"];
//
//
//    //用户信息
//    if ([CXUserInfo isLogin]) {
//        NSString *userInfoStr = [NSString stringWithFormat:@"uid=%@&code=%@",[CXUserInfo userID], [CXUserInfo loginCode]];
//        NSString *userInfoEncr = [CXEncryptUtil encryptTextWithKey:userInfoStr key:@"1234abcd"];
//        NSString *userInfoEncode = [userInfoEncr URLEncodedString];
//        [headerDic setObject:userInfoEncode forKey:@"authentication"];
//
//        NSLog(@"header origin:%@",userInfoStr);
//    } else {
//        [headerDic setObject:@"" forKey:@"authentication"];
//    }
    
//    NSLog(@"header encode:%@", headerDic);
    
    return headerDic;
}


@end
