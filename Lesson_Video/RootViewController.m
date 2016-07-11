//
//  RootViewController.m
//  Lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RootViewController.h"



@interface RootViewController ()<VideoTabBarDelegate>



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 隐藏系统的tabbar.
    self.tabBar.hidden = YES;
    
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"first_selected"] forState:(UIControlStateSelected)];
    [button1 setImage:[UIImage imageNamed:@"first_normal"] forState:(UIControlStateNormal)];
    [button1 setTitle:@"主播" forState:(UIControlStateNormal)];
    [button1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
//    button1.backgroundColor = [UIColor yellowColor];
    
//    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"second_selected"] forState:(UIControlStateSelected)];
    [button2 setImage:[UIImage imageNamed:@"second_normal"] forState:(UIControlStateNormal)];
    [button2 setTitle:@"我的" forState:(UIControlStateNormal)];
    [button2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
//    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    self.dbTabBar = [[VideoTabBar alloc] initWithItems:@[button1,button2] frame:CGRectMake(0, 690, self.view.bounds.size.width, 50)];
    self.dbTabBar.currentSelectedItem.selected = YES;
    self.dbTabBar.currentSelectedItem = button1;
    
    [self.view addSubview:self.dbTabBar];
    
    self.dbTabBar.doubanDelegate = self;
}

-(void)VideoItemDidClicked:(VideoTabBar *)tabBar{
    
    self.selectedIndex = tabBar.currentSelected;
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
