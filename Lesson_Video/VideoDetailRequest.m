//
//  VideoDetailRequest.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "VideoDetailRequest.h"
static VideoDetailRequest *request = nil;
@implementation VideoDetailRequest
+(instancetype)shareVideoDetailRequest{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoDetailRequest alloc] init];
    });
    return request;
}

// dota 单个主播请求
-(void)requestDotaAllVideoAdressWithID:(NSString*)ID suceess:(SuccessResponse)success
                               failure:(FailureResponse)failure{
    
    [self requestSingleAuthorAllVideoWithUrl:dotaSingleVideoAdressRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

// lol 单个主播请求
- (void)requestLOLAllVideAdressWithID:(NSString *)ID
                              success:(SuccessResponse)success
                              failure:(FailureResponse)failure{
    
    [self requestSingleAuthorAllVideoWithUrl:lolSingleVideoAdressRequest_Url(ID) success:^(NSDictionary *dic) {
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
