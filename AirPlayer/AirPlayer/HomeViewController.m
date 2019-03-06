//
//  HomeViewController.m
//  AirPlayer
//
//  Created by ysj on 2018/8/28.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "HomeViewController.h"
#import "MJRefresh.h"
#import "ReactiveObjC.h"
#import "VideoModel.h"
#import "VideoTableViewCell.h"
#import <AVKit/AVKit.h>
#import "Masonry.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *videoArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initData {
    [self.videoArray removeAllObjects];
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    NSArray *arr = [fileManage contentsOfDirectoryAtPath:documentPath error:nil];
    
    for (NSString *fileTitle in arr) {
        NSString *unit = [fileTitle substringFromIndex:fileTitle.length - 3];
        if ([unit isEqualToString:@"MOV"] || [unit isEqualToString:@"mov"] || [unit isEqualToString:@"MP4"] || [unit isEqualToString:@"mp4"]) {
            NSString *filePath = [documentPath stringByAppendingPathComponent:fileTitle];
            NSDictionary *attburtes = [fileManage attributesOfItemAtPath:filePath error:nil];
            VideoModel *model = [VideoModel videoWithAttribute:attburtes name:fileTitle path:filePath];
            [self.videoArray addObject:model];
        }
    }
}

- (void)initViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"投TM的";
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc]init];
    @weakify(self);
    [header setRefreshingBlock:^{
        @strongify(self)
        [self initData];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    [self.tableView setMj_header:header];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoModel *model = [self.videoArray objectAtIndex:indexPath.row];
    
    VideoTableViewCell *cell = [VideoTableViewCell cellWithTableView:tableView videoModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    VideoModel *model = [self.videoArray objectAtIndex:indexPath.row];
    
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    
    NSURL *url = [NSURL fileURLWithPath:model.path];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
    playerVC.player = player;
    
    [self presentViewController:playerVC animated:YES completion:^{
        [playerVC.player play];
    }];
}

- (NSMutableArray *)videoArray {
    if (!_videoArray) {
        _videoArray = [[NSMutableArray alloc] init];
    }
    return _videoArray;
}

@end
