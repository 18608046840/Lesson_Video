//
//  AuchorModel.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface AuchorModel : BaseModel

@property (nonatomic, assign)BOOL watchable;
@property (nonatomic, copy)NSString  *name;
@property (nonatomic, copy)NSString  *youku_id;
@property (nonatomic, copy)NSString  *url;
@property (nonatomic, copy)NSString  *detail;
@property (nonatomic, copy)NSString  *authorId;
@property (nonatomic, copy)NSString  *pop;
@property (nonatomic, copy)NSString  *icon;

@property(nonatomic,strong)AuchorModel *authorModel;

+(NSMutableArray *)parseAuchorsWithDic:(NSDictionary *)dic;


@end
