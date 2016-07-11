//
//  anchorDetailsCollectionViewCell.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "anchorDetailsCollectionViewCell.h"

@implementation anchorDetailsCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setType:(int)type{
    _type = type;
    if (_type == 1) {
        _playBtn.hidden = NO;
    }else{
        _playBtn.hidden = YES;
    }
}
// controller 执行btn 的方法。这个btn 是cell 的方法、点击事件
- (IBAction)PlayBtnClicked:(UIButton *)sender {
    // 设这个判断，就是谁遵守代理，就回调。没有遵守，就不调用
    // 后面这个条件是：遵循这个代理，并且实现了这个方法才会调用这个方法。保证程序不崩，怕遵循这个代理不实现方法。
    if (_delegate && [_delegate respondsToSelector:@selector(videoCollectionViewPlayBtnClicked:)]) {
        [_delegate videoCollectionViewPlayBtnClicked:self];
    }
}


-(void)setVideoModel:(VideoModel *)videoModel{
    _videoModel = videoModel;
    [_backgroundImageView setImageWithURL:[NSURL URLWithString:videoModel.thumb] placeholderImage:nil];
    _timeLengthLabel.text = [NSString stringWithFormat:@"%@",videoModel.time];
    _dateLabel.text = videoModel.date;
    _titleLabel.text = videoModel.title;
    
}

@end
