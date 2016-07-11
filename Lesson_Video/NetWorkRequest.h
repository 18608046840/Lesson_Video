//
//  NetWorkRequest.h
//  Lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BassRequest.h"
// 成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);

// 失败回调
typedef void(^FailureResponse)(NSError *error);
@interface NetWorkRequest : BassRequest

// 请求数据
// url:请求数据的url
// parameterDic : 请求的参数
// success :成功回调的block
// failure : 失败回调的block
-(void)requestWithUrl:(NSString *)url
           parameters:(NSDictionary *)parameterDic
      successResponse:(SuccessResponse)success
      failureResponse:(FailureResponse)failure;


// post 方法
// 登录要求用 post 请求。
-(void)sendDataWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponse)success
               failure:(FailureResponse)failure;



// 注册要求用 post 请求
-(void)sendImageWithUrl:(NSString *)url
              parameter:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;



@end
