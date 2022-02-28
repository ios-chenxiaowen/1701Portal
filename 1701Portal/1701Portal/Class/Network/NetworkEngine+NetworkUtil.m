//
//  NetworkEngine+NetworkUtil.m
//  1701Portal
//
//  Created by ios小文 on 2022/2/28.
//

#import "NetworkEngine+NetworkUtil.h"

@implementation NetworkEngine (NetworkUtil)

+ (void)GETWithUrl:(NSString*)apiString
                           prameters:(NSDictionary*)pramaters
                             success:(SuccessBlock)successBlock
                             failure:(FailureBlock)failBlock
                     isShowFailAlert:(BOOL)isShowFailAlert
                     failAlertString:(NSString*)failAlertString {

     [[self class] GETWithUrl:apiString
                          prameters:pramaters
                      processResult:nil
                            success:successBlock
                            failure:failBlock
                    isShowFailAlert:isShowFailAlert
                    failAlertString:failAlertString];
}

+ (void)GETWithUrl:(NSString *)apiString
                           prameters:(NSDictionary *)pramaters
                       processResult:(ProcessResult)processReult
                             success:(SuccessBlock)successBlock
                             failure:(FailureBlock)failBlock
                     isShowFailAlert:(BOOL)isShowFailAlert
                     failAlertString:(NSString *)failAlertString {

    
    [NetworkEngine requestDataWithAPI:apiString method:GET params:pramaters customHeaderField:nil progress:nil success:^(id result) {
        
        NSError *error = [[self class] fiterResult:result];
        if (error) {
            if (failBlock) {
                if (isShowFailAlert) {
                    NSString *message = STRINGHASVALUE(failAlertString) ? failAlertString : [result objectForKey:@"msg"];
                    [self showFailAlert:error message:message];
                }
                failBlock(error);
            }
        } else if (successBlock) {
            
            if (processReult) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    id processData = processReult(result[@"data"]) ;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        successBlock(processData ? processData : result[@"data"]);
                    });
                    
                });
            } else {
                successBlock(result[@"data"]);
            }
        }
        
    } failure:^(NSError *error) {
        if (isShowFailAlert) {
            [self showFailAlert:error message:failAlertString];
        }
        if (failBlock) {
            failBlock(error);
        }
        
    }];
}

+ (void)POSTWithUrl:(NSString*)apiString
                            prameters:(NSDictionary*)pramaters
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString*)failAlertString {
    
        [[self class] POSTWithUrl:apiString
                           prameters:pramaters
                       processResult:nil success:successBlock
                             failure:failBlock
                     isShowFailAlert:isShowFailAlert
                     failAlertString:failAlertString];
}

+ (void )POSTWithUrl:(NSString *)apiString
                            prameters:(NSDictionary *)pramaters
                        processResult:(ProcessResult)processReult
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString *)failAlertString {
    
        [[self class] POSTWithUrl:apiString
                           prameters:pramaters
                       isJsonRequset:NO processResult:processReult
                             success:successBlock failure:failBlock
                     isShowFailAlert:isShowFailAlert
                     failAlertString:failAlertString];
    
}

+ (void)POSTWithJsonUrl:(NSString *)apiString
                                prameters:(NSDictionary *)pramaters
                            processResult:(ProcessResult)processReult
                                  success:(SuccessBlock)successBlock
                                  failure:(FailureBlock)failBlock
                          isShowFailAlert:(BOOL)isShowFailAlert
                          failAlertString:(NSString *)failAlertString {
    
        [[self class] POSTWithUrl:apiString
                           prameters:pramaters
                       isJsonRequset:YES
                       processResult:processReult
                             success:successBlock
                             failure:failBlock
                     isShowFailAlert:isShowFailAlert
                     failAlertString:failAlertString];
}

+ (void)POSTWithUrl:(NSString *)apiString
                            prameters:(NSDictionary *)pramaters
                        isJsonRequset:(BOOL)isJsonRequset
                        processResult:(ProcessResult)processReult
                              success:(SuccessBlock)successBlock
                              failure:(FailureBlock)failBlock
                      isShowFailAlert:(BOOL)isShowFailAlert
                      failAlertString:(NSString *)failAlertString {
    
    [NetworkEngine requestDataWithAPI:apiString method:POST isJsonRequest:isJsonRequset params:pramaters customHeaderField:nil progress:nil success:^(id result) {
        
        NSError *error = [[self class] fiterResult:result];
        if (error) {
            if (failBlock) {
                if (isShowFailAlert) {
                    NSString *message = STRINGHASVALUE(failAlertString) ? failAlertString : [result objectForKey:@"msg"];
                    [self showFailAlert:error message:message];
                }
                
                failBlock(error);
            }
        } else {
            id data = result[@"data"];
            if ([data isKindOfClass:[NSNull class]]) {
                data = nil;
            }
            if (processReult) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    id processData = processReult(data) ;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        successBlock(processData ? processData : data);
                    });
                    
                });
            } else {
                successBlock(data);
            }
        }
        
    } failure:^(NSError *error) {
        if (isShowFailAlert) {
            [self showFailAlert:error message:failAlertString];
        }
        if (failBlock) {
            failBlock(error);
        }
        
    }];

}


//返回数据拦截
+ (NSError*)fiterResult:(id)responseObject {
    
    NSError *error = nil;
    if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSString *code = responseObject[@"code"];
        if (![code isEqualToString:@"0"]) {
            error = [NSError errorWithDomain:@"BussineError" code:[code integerValue] userInfo:responseObject];
        }
    } else {
        error = [[NSError alloc] initWithDomain:@"ServiceError" code:-10000 userInfo:@{@"message" : @"请求失败"}];
    }
    return error;
}

//错误提示
+ (void)showFailAlert:(NSError*)error message:(NSString*)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (STRINGHASVALUE(message)) {
            MBHUD_result(message);
        } else {
            if (error.code == -1001) {
                MBHUD_result(@"请求超时！");
            } else if (error.code == -1009) {
                MBHUD_result(@"请检查网络！");
            } else {
                MBHUD_result(@"请求失败！");
            }
        }
    });
}
@end
