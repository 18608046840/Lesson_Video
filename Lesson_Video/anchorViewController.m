//
//  anchorViewController.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "anchorViewController.h"
#import "anchorListTableViewCell.h"
#import "AuchorRequest.h"
#import "AuchorModel.h"
#import "VideosViewController.h"
@interface anchorViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (strong, nonatomic) IBOutlet UITableView *anchorTableView;
@property (strong, nonatomic) IBOutlet UITableView *LoLTableView;

@property(nonatomic,strong)NSMutableArray *dotaAllArray;

@property(nonatomic,strong)NSMutableArray *LOLAllArray;

@property (strong, nonatomic) IBOutlet UIScrollView *ScollView;



@end

@implementation anchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dotaAllArray = [NSMutableArray array];
    self.LOLAllArray = [NSMutableArray array];
    
    [self.anchorTableView registerNib:[UINib nibWithNibName:@"anchorListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:anchorListTableViewCell_Identify];
    
    
    [self.LoLTableView registerNib:[UINib nibWithNibName:@"anchorListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:anchorListTableViewCell_Identify];
    
    // 调用两个请求方法
    
    [self requestDataAuchor];
    [self requestLOLAuchor];
    
    
    
    
    
}
// 请求data主播数据
-(void)requestDataAuchor{
    __weak typeof(self) weakSelf = self;
    [[AuchorRequest shareAutchorRequest] requestDotaAllAuchorsSuccess:^(NSDictionary *dic) {
        NSLog(@"dota dic = %@",dic);
        weakSelf.dotaAllArray = [AuchorModel parseAuchorsWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.anchorTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"data error = %@",error);
    }];
    
}
// 请求lol主播数据
-(void)requestLOLAuchor{
    
    __weak typeof(self) weakSelf = self;
    [[AuchorRequest shareAutchorRequest] requestLOLAllAuchorsSuccess:^(NSDictionary *dic) {
        NSLog(@"lol dic ===============%@",dic);
        weakSelf.LOLAllArray = [AuchorModel parseAuchorsWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.LoLTableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"lol error = %@",error);
    }];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.anchorTableView) {
        return self.dotaAllArray.count;
    }
    return self.LOLAllArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    anchorListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:anchorListTableViewCell_Identify];
    AuchorModel *model = nil;
    if (tableView == self.anchorTableView) {
        
        model = self.dotaAllArray[indexPath.row];
     cell.auchormodel = model;
    }else{
        model = self.LOLAllArray[indexPath.row];
      cell.auchormodel = model;
    }
  
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *mainsb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VideosViewController *VC = [mainsb instantiateViewControllerWithIdentifier:@"VideosViewController"];
    if (tableView == self.anchorTableView) {
        AuchorModel *model = self.dotaAllArray[indexPath.row];
        VC.authorID = model.authorId;
        VC.sourceFrom = 0;
    }else{
        AuchorModel *model = self.LOLAllArray[indexPath.row];
        VC.authorID = model.authorId;
        VC.sourceFrom = 1;
    }
    
    
    
    [self.navigationController pushViewController:VC animated:YES];
    
    
    
}

- (IBAction)clickSegment:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
       
        self.ScollView.contentOffset = CGPointMake(self.view.frame.size.width*0, 0);
        
    }else{
        
        self.ScollView.contentOffset = CGPointMake(self.view.frame.size.width *1, 0);
        
    }
    
//    [self.ScollView setcontentOffset:CGPointMake(self.view.bounds.size.width * sender.selectedSegmentIndex, 0)];
}

// 用于返回视图显示tabbar。
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",self.parentViewController);
    
    RootViewController *rootVC = (RootViewController *)self.navigationController.parentViewController;
    rootVC.dbTabBar.hidden = NO;
//    self.rootvc.dbTabBar.hidden = NO;
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
