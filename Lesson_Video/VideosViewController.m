//
//  VideosViewController.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "VideosViewController.h"
#import "anchorDetailsCollectionViewCell.h"
#import "VideoRequest.h"
#import "VideoModel.h"
#import "VideoDetailRequest.h"
#import "PlayView.h"
#import "VideoDetailModel.h"

@interface VideosViewController ()
<
   UICollectionViewDataSource,
   UICollectionViewDelegate,
   UICollectionViewDelegateFlowLayout,
   VideoCollectionViewCellDelegate
>
@property (strong, nonatomic) IBOutlet UICollectionView *VideoCollctionView;

// 布局的形式
@property(nonatomic,assign)NSInteger layoutType;

// 数组用于接收
@property(nonatomic,strong)NSMutableArray *videos;

@property(nonatomic,strong)PlayView *playView;




@end

@implementation VideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.videos = [NSMutableArray array];
    
    // 0 是1 行显示两个Item;
    self.layoutType = 0;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(WindownWidth / 2.0, 178);
    self.VideoCollctionView.collectionViewLayout = layout;
    
    [self.VideoCollctionView registerNib:[UINib nibWithNibName:@"anchorDetailsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:anchorDetailsCollectionViewCell_Identify];
    
    
    [self addRightItem];
    
    if (self.sourceFrom == 0) {
        [self requestDotaVideos];
        
    }else if (self.sourceFrom == 1){
        [self requestLOLvideos];
    }
    
}


-(void)addRightItem{
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(changeLayoutType:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)requestDotaVideos{
    __weak typeof(self) weakSelf = self;
    // 用单例调用的方法dota 单个主播的请求方法
    [[VideoRequest shareVideoRequest] requestDotaSingleAuthorAllVideoWithID:self.authorID suceess:^(NSDictionary *dic) {
        NSLog(@"success ==================== %@",dic);
        weakSelf.videos = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.VideoCollctionView reloadData];
        });
        
        
    } failure:^(NSError *error) {
        NSLog(@"error ================ %@",error);
    }];
    
}


-(void)requestLOLvideos{
    __weak typeof(self) weakSelf = self;
    [[VideoRequest shareVideoRequest] requestLOLSingleAuthorAllVideWithID:self.authorID success:^(NSDictionary *dic) {
        NSLog(@"success =============== %@",dic);
        weakSelf.videos = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.VideoCollctionView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"failure ================  %@",error);
    }];
        
        
   
}

-(void)requestDotaVideoAdress{
    __weak typeof(self) weakSelf = self;
    [[VideoDetailRequest shareVideoDetailRequest] requestDotaAllVideoAdressWithID:self.videoID suceess:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        weakSelf.videos = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.VideoCollctionView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}



-(void)changeLayoutType:(UIBarButtonItem *)item{
    
    if (self.layoutType == 0) {
        self.layoutType = 1;
    }else if (self.layoutType == 1){
        self.layoutType = 0;
    }
    [self.VideoCollctionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layoutType == 0) {
        return CGSizeMake(WindownWidth / 2.0, 178);
    }else if (self.layoutType == 1){
        return CGSizeMake(WindownWidth, 178);
    }
    return CGSizeMake(WindownWidth /2.0, 178);
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.videos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    anchorDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:anchorDetailsCollectionViewCell_Identify forIndexPath:indexPath];
    
    cell.type = (int)self.layoutType;
    cell.delegate = self;
    cell.videoModel = self.videos[indexPath.row];
    
    
    
    return cell;
}

// 回调自定义的delegate 的方法.代理传值
-(void)videoCollectionViewPlayBtnClicked:(anchorDetailsCollectionViewCell *)cell{
    
    [self requestDotaVideoAdress];
    
    if (self.playView) {
        // 播放一个不能播放下一个
        [self.playView.player pause];
        [self.playView removeFromSuperview];
    }
    
    VideoModel *model = cell.videoModel;
    // 根据model 的id 去请求视频的url
    [[VideoDetailRequest shareVideoDetailRequest] requestDotaAllVideoAdressWithID:model.vedioId suceess:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        VideoDetailModel *videoDetailModel = [[VideoDetailModel alloc] init];
        [videoDetailModel setValuesForKeysWithDictionary:dic];
        // 播放视频
        self.playView = [[PlayView alloc] initWithUrl:videoDetailModel.url frame:cell.bounds];
        [cell.contentView addSubview:self.playView];
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    // 请求完url之后，初始化playerview
    // playerview 增加到cell 上
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}


//  当cell 划出去的时候，放到右下角播放
-(void)putTorightCorner{
    [self.playView removeFromSuperview];
    [self.view addSubview:self.playView];
    CGRect rightFrame = CGRectMake(WindownWidth / 2.0, WindowHeight * 3/4, WindownWidth / 2.0, WindowHeight / 4.0);
    [UIView animateWithDuration:0.5 animations:^{
        self.playView.frame = rightFrame;
    }];
    
}


-(void)backToCell{
    
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
