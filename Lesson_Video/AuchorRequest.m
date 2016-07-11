//
//  AuchorRequest.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AuchorRequest.h"

static AuchorRequest *request = nil;
@implementation AuchorRequest

// 单例
+(instancetype)shareAutchorRequest{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[self alloc] init];
});
    return request;
    
}

//+(id)allocWithZone:(struct _NSZone *)zone{
//    @synchronized(request) {
//        if (!request) {
//            request = [super allocWithZone:zone];
//        }
//    }
//    return request;
//}


//+(id)copyWithZone:(struct _NSZone *)zone{
//    return request;
//}

// 请求data所有主播
-(void)requestDotaAllAuchorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure{
    
    [self requestAllAuthorsWithUrl:DotaAllAuchorsRequest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
    
}

// 请求LOL所有主播
-(void)requestLOLAllAuchorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure{
    
    [self requestAllAuthorsWithUrl:LOLAllAuchorsRequest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}



-(void)requestAllAuthorsWithUrl:(NSString *)url
                        success:(SuccessResponse)success
                        failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}




@end
