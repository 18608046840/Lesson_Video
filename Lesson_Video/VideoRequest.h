//
//  VideoRequest.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VideoRequest : NSObject

+(instancetype)shareVideoRequest;

// dota 单个主播请求
-(void)requestDotaSingleAuthorAllVideoWithID:(NSString*)ID suceess:(SuccessResponse)success
                                     failure:(FailureResponse)failure;

// lol 单个主播请求
- (void)requestLOLSingleAuthorAllVideWithID:(NSString *)ID
                                    success:(SuccessResponse)success
                                    failure:(FailureResponse)failure;
@end
