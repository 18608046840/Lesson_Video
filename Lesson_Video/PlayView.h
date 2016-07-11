//
//  PlayView.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
// 引入视频播放器框架
#import <AVFoundation/AVFoundation.h>
@interface PlayView : UIView

// 播放最基本的单元
@property(nonatomic,strong)AVPlayerItem *playerItem;

// 播放视频的layer（注意类型）
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
// 播放器
@property(nonatomic,strong)AVPlayer *player;

-(id)initWithUrl:(NSString *)url frame:(CGRect)frame;

@end
