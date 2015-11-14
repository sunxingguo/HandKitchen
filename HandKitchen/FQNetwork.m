//
//  FQNetwork.m
//  kitchen
//
//  Created by fq on 15/6/3.
//  Copyright (c) 2015年 fangqian. All rights reserved.
//

#import "FQNetwork.h"
#import "FQinterface.h"
static NSString *hostIP = nil;

@implementation AFHTTPRequestOperationManager (QFPKRequest)

- (AFHTTPRequestOperation *)GETRequest:(NSString *)URLString parameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    AFHTTPRequestOperation *operation = nil;
    // 如果没有ip就先去请求ip，如果有ip就拼接成完整的路径
    if (hostIP == nil) {
        
        // 先去请求ip，拿到ip之后再去做实际的请求
        operation = [self getHostIPCompletion:^ {
            
            // 调用AFNetworking原本的请求方法
            NSString *fullURL = [NSString stringWithFormat:@"http://%@:80%@", hostIP, URLString];
            //NSLog(@"%@", fullURL);
            [self GET:fullURL parameters:parameters success:success failure:failure];
        }];
    }
    else {  // 如果ip已经存在
        
        // 调用AFNetworking原本的请求方法
        NSString *fullURL = [NSString stringWithFormat:@"http://%@:80%@", hostIP, URLString];
        NSLog(@"fullURL = %@", fullURL);
        operation = [self GET:fullURL parameters:parameters success:success failure:failure];
    }
    
    return operation;
}


+ (AFHTTPRequestOperation *)GETRequest:(NSString *)URLString parameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *,id responseObject))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    // 下载数据
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    
    return [requestManager GETRequest:URLString parameters:parameters success:success failure:failure];
}


- (AFHTTPRequestOperation *)getHostIPCompletion:(void (^)(void))completion
{
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [requestManager GET:URL_HOSTIP parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 把二进制数据转成文本   
        NSString *responseText = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        // 保存IP
        hostIP = responseText;
        
        completion();
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        completion();
        NSLog(@"get host ip error: %@", error);
    }];
}

@end
