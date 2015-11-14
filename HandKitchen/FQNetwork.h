//
//  FQNetwork.h
//  kitchen
//
//  Created by fq on 15/6/3.
//  Copyright (c) 2015年 fangqian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"

/**
 这是一个用来封装这个项目网络请求的类别
 */
@interface AFHTTPRequestOperationManager (QFPKRequest)




/**
对AFNetworking请求的进一步封装
在请求之前，会先拿到服务器的ip，如果没有ip，就在这个请求之前，先去请求ip，然后才会进行这次请求
这个函数的参数和AFNetworking的参数一致
*/
- (AFHTTPRequestOperation *)GETRequest:(NSString *)URLString
                            parameters:(id)parameters
                               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/**
 对请求操作的进一步封装，使控制器里的请求的代码更简洁
 */
+ (AFHTTPRequestOperation *)GETRequest:(NSString *)URLString
                            parameters:(id)parameters
                               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
