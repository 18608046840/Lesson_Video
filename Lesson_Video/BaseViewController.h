//
//  BaseViewController.h
//  Lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface BaseViewController : UIViewController
// 引入文件，用于隐藏tabbar.
@property(nonatomic,strong)RootViewController *RootVC;
@end
