//
//  EatSettingViewController.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/11.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "EatSettingViewController.h"
#import "Common.h"
#import "UIFont+YSJ.h"
#import "YSJAlertController.h"
#import "DBOperation.h"
#import "ReactiveObjC.h"
#import "Masonry.h"
#import "EatItemTableViewCell.h"
#import "UIImage+YSJ.h"
#import "UIColor+YSJ.h"
#import "EditItemViewController.h"
#import "YSJNavigationController.h"
#import "DBOperation.h"
#import "MJRefresh.h"

@interface EatSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *eatTable;
@property (nonatomic, assign) int newWeight;
@property (nonatomic, assign) int playedTimes;

@end

@implementation EatSettingViewController

// MARK: - LifeCircle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNotification];
    [self initNavigation];
    [self initViews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// MARK: - Init Method
- (void)initNotification {
    @weakify(self)
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:AddItemModelNotificationName object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self)
        ItemModel *itemModel = x.userInfo[@"itemModel"];
        [DBOperation insertData:itemModel];
        self.itemArray = [DBOperation getAllData];
        [self.eatTable reloadData];
    }];

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:EditItemModelNotificationName object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self)
        [self.eatTable reloadData];
    }];
}

- (void)initViews {
    
    [self setTitle:@"设置" titleColor:[UIColor whiteColor] titleFont:[UIFont fontR:UIScale(18)]];
    
    self.eatTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.eatTable.delegate = self;
    self.eatTable.dataSource = self;
    [self.view addSubview:self.eatTable];
    [self.eatTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc]init];
    @weakify(self);
    [header setRefreshingBlock:^{
        @strongify(self)
        self.itemArray = [DBOperation getAllData];
        [self.eatTable reloadData];
        [self.eatTable.mj_header endRefreshing];
    }];
    [self.eatTable setMj_header:header];
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingBlock:^{
        self.playedTimes++;
        if (self.playedTimes > 4) {
            [self showHudWithTitle:@"祝老婆纪念日快乐 越来越美 天天开森~~" lastTime:3.5];
        } else {
            [self showHudWithTitle:@"木有更多了哦~"];
        }
        
        [self.eatTable.mj_footer endRefreshing];
    }];
    [self.eatTable setMj_footer:footer];
    
    UITableViewCell *headerView = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"none"];
    headerView.frame = CGRectMake(0, 0, ScreenWidth, UIScale(50));
    [headerView setBackgroundColor:[UIColor whiteColor]];
    headerView.imageView.image = [UIImage imageNamed:@"caihong"];
    headerView.textLabel.text = @" 名称 ";
    headerView.detailTextLabel.text = @"概率        权重";
    headerView.textLabel.textColor = headerView.detailTextLabel.textColor;
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height - 0.5, ScreenWidth, 0.5)];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    lineLabel.alpha = 0.3;
    [headerView addSubview:lineLabel];
    self.eatTable.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth * 1.5, EatCellHeight * 1.5)];
    footerView.backgroundColor = [UIColor clearColor];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - EatCellHeight) / 2, EatCellHeight * 0.5 * 0.5, EatCellHeight, EatCellHeight)];
    addBtn.backgroundColor = TintColor;
    [addBtn setTitle:@"新增" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont fontR:UIScale(15)];
    addBtn.layer.cornerRadius = EatCellHeight / 2;
    addBtn.layer.shadowOffset = CGSizeMake(3, 3);
    addBtn.layer.shadowOpacity = 0.7;
    addBtn.layer.shadowRadius = 3;
    addBtn.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    [[addBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        if (self.itemArray.count >= self.colorArray.count) {
            [self showHudWithTitle:@"数目太多啦"];
        }
        EditItemViewController *editVC = [[EditItemViewController alloc]initWithEditType:TypeAdd];
        YSJNavigationController *nav = [[YSJNavigationController alloc]initWithRootViewController:editVC];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }];
    [footerView addSubview:addBtn];
    self.eatTable.tableFooterView = footerView;
}

- (void)initNavigation {
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"hall_icon_return_w"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClick)];
    leftBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"恢复默认" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemClick)];
    rightBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

// MARK: - Click Selector Method
- (void)leftBarItemClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:ReplaceItemArrayNotificationName object:nil userInfo:@{@"itemArray": self.itemArray}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarItemClick {
    YSJAlertController *alert = [YSJAlertController alertWithTitle:@"真的要恢复默认么" message:@"恢复默认了现在的数据可就木有了" leftBtnTitle:@"emmmm不了" rightBtnTitle:@"就要" leftHandle:nil rightHandle:^(UIAlertAction *action) {
        [DBOperation dropTable];
        [DBOperation initTableIfNotExist];
        self.itemArray = [DBOperation getAllData];
        [self.eatTable reloadData];
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

// MARK: - TableView Delegate & DataSource Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.itemArray.count > 0) {
        return 1;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UIScale(60);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle != UITableViewCellEditingStyleDelete) {
        return;
    }
    @weakify(self)
    YSJAlertController *alert = [YSJAlertController alertWithTitle:@"真的要删除么" message:@"删除了这条数据可就木有了" leftBtnTitle:@"emmmm不了" rightBtnTitle:@"就要" leftHandle:nil rightHandle:^(UIAlertAction *action) {
        @strongify(self)
        [DBOperation deleteData:self.itemArray[indexPath.row]];
        [self.itemArray removeObjectAtIndex:indexPath.row];
        if (self.itemArray.count == 0) {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        } else {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EatItemTableViewCell *cell = [EatItemTableViewCell cellWithTableView:tableView indexPath:indexPath ItemArray:self.itemArray colorArray:self.colorArray];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EditItemViewController *editVC = [[EditItemViewController alloc]initWithEditType:TypeEdit];
    editVC.itemModel = self.itemArray[indexPath.row];
    YSJNavigationController *nav = [[YSJNavigationController alloc]initWithRootViewController:editVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

// MARK: - Getter Method
- (UITableView *)eatTable {
    if (!_eatTable) {
        _eatTable = [[UITableView alloc] init];
    }
    return _eatTable;
}

@end
