//
//  VideoDetailRequest.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoDetailRequest : NSObject

+(instancetype)shareVideoDetailRequest;

// dota 单个主播请求
-(void)requestDotaAllVideoAdressWithID:(NSString*)ID suceess:(SuccessResponse)success
                                     failure:(FailureResponse)failure;

// lol 单个主播请求
- (void)requestLOLAllVideAdressWithID:(NSString *)ID
                                    success:(SuccessResponse)success
                                    failure:(FailureResponse)failure;


@end
