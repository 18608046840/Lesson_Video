//
//  DouBanTabBar.h
//  Lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

@class VideoTabBar;
@protocol VideoTabBarDelegate

-(void)VideoItemDidClicked:(VideoTabBar *)tabBar;

@end


#import <UIKit/UIKit.h>

@interface VideoTabBar : UITabBar

// 当前选中的TabBar的下标
@property(nonatomic,assign)int currentSelected;

// 当前选中的item
@property(nonatomic,strong)UIButton *currentSelectedItem;

// tabbar 上面所有的item
@property(nonatomic,strong)NSArray *allItems;


@property(nonatomic,weak)id <VideoTabBarDelegate>doubanDelegate;

// 初始化方法 : 根据items初始化items
-(id)initWithItems:(NSArray *)items frame:(CGRect)frame;


@end
