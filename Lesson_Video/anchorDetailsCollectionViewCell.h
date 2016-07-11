//
//  anchorDetailsCollectionViewCell.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#define anchorDetailsCollectionViewCell_Identify @"anchorDetailsCollectionViewCell_Identify"

@class anchorDetailsCollectionViewCell;
@protocol VideoCollectionViewCellDelegate <NSObject>

-(void)videoCollectionViewPlayBtnClicked:(anchorDetailsCollectionViewCell *)cell;

@end

@interface anchorDetailsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *timeLengthLabel;

@property (strong, nonatomic) IBOutlet UIButton *playBtn;


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property(assign,nonatomic)int type;


@property(assign,nonatomic)id<VideoCollectionViewCellDelegate>delegate;

@property(nonatomic,strong)VideoModel *videoModel;

@end
