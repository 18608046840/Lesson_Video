//
//  VideoRequest.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "VideoRequest.h"
static VideoRequest *request = nil;
@implementation VideoRequest
// 单例。
+(instancetype)shareVideoRequest{
    
    static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    request = [[VideoRequest alloc] init];


});
    return request;
}

// dota 单个主播请求
-(void)requestDotaSingleAuthorAllVideoWithID:(NSString*)ID suceess:(SuccessResponse)success
                                     failure:(FailureResponse)failure{
    
    [self requestSingleAuthorAllVideoWithUrl:DotaSingleAuthorAllVidelosRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

//
- (void)requestLOLSingleAuthorAllVideoWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure
{
    [self requestSingleAuthorAllVideoWithUrl:LOLSingleAuthorAllVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


// 单个主播请求
-(void)requestSingleAuthorAllVideoWithUrl:(NSString *)url
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
