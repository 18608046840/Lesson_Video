//
//  VideoModel.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _vedioId = value;
    }
}

+(NSMutableArray *)parseVideoWithDic:(NSDictionary *)dic{
    NSMutableArray *returnVideos = [NSMutableArray array];
    NSArray *video = [dic objectForKey:@"videos"];
    for (NSDictionary *tempdic in video) {
        VideoModel *model = [[VideoModel alloc] init];
        [model setValuesForKeysWithDictionary:tempdic];
        [returnVideos addObject:model];
    }
    return returnVideos;
}
@end
