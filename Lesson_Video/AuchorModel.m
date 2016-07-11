//
//  AuchorModel.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AuchorModel.h"

@implementation AuchorModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _authorId = value;
    }
    
    
}

+(NSMutableArray *)parseAuchorsWithDic:(NSDictionary *)dic{
    NSArray *authors = [dic objectForKey:@"authors"];
    NSMutableArray *returnAuthors = [NSMutableArray array];
    for (NSDictionary *dict in authors) {
        AuchorModel *model = [[AuchorModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [returnAuthors addObject:model];
    }
    return returnAuthors;
}

@end
