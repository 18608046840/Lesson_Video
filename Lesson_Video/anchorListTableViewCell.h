//
//  anchorListTableViewCell.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuchorModel.h"
#define anchorListTableViewCell_Identify @"anchorListTableViewCell_Identify"

@interface anchorListTableViewCell : UITableViewCell
// 头像
@property (strong, nonatomic) IBOutlet UIImageView *headerImageV;
// 名字
@property (strong, nonatomic) IBOutlet UILabel *nameLable;
// 日期
@property (strong, nonatomic) IBOutlet UILabel *dateLable;
// 排名
@property (strong, nonatomic) IBOutlet UILabel *rangeLabel;

@property(nonatomic,strong)AuchorModel *auchormodel;

@end
