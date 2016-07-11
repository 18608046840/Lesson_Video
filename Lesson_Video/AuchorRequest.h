//
//  AuchorRequest.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface AuchorRequest : NSObject

+(instancetype)shareAutchorRequest;


// 请求data所有主播
-(void)requestDotaAllAuchorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure;

// 请求LOL所有主播
-(void)requestLOLAllAuchorsSuccess:(SuccessResponse)success
                            failure:(FailureResponse)failure;


// 请求方法
-(void)requestAllAuthorsWithUrl:(NSString *)url
                        success:(SuccessResponse)success
                        failure:(FailureResponse)failure;





@end
