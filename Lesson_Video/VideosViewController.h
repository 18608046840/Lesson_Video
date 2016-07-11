//
//  VideosViewController.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseViewController.h"

@interface VideosViewController : BaseViewController


@property(nonatomic,copy)NSString *authorID;

@property(nonatomic,copy)NSString *videoID;

// 判断是从dota主播界面进来，还是从lol主播界面进来
@property(nonatomic,assign)int sourceFrom;



@end
