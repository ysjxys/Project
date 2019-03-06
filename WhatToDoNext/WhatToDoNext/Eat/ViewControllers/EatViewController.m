//
//  EatViewController.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/9.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "EatViewController.h"
#import "UIFont+YSJ.h"
#import "Common.h"
#import "UIImage+YSJ.h"
#import "UIColor+YSJ.h"
#import "EatSettingViewController.h"
#import "MagicPieLayer.h"
#import "NSMutableArray+pieEx.h"
#import "Masonry.h"
#import "ItemModel.h"
#import "ReactiveObjC.h"
#import "FMDBHelper.h"
#import "DBOperation.h"
#import "NSArray+YSJ.h"
#import "NSDate+YSJ.h"

@interface EatViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) EatSettingViewController *eatSettingVC;
@property (nonatomic, strong) PieLayer *pieLayer;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIButton *decideBtn;

@property (nonatomic, strong) CALayer *arrowLayer;

@property (nonatomic, strong) NSMutableArray<ItemModel *> *itemArray;
@property (nonatomic, copy) NSArray<UIColor *> *colorArray;

@property (nonatomic, assign, readonly) CGFloat radius;

@property (nonatomic, assign) int playedTimes;

@end

@implementation EatViewController

static const CGFloat distance = 10.2;

// MARK: - LifeCircle Method
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updatePie];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (!self.decideBtn.isEnabled) {
        [self.decideBtn setEnabled:YES];
        [self.arrowLayer removeAllAnimations];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNotification];
    [self initViews];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// MARK: - Init Method
- (void)initNotification {
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:ReplaceItemArrayNotificationName object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        self.itemArray = [NSMutableArray arrayWithArray:[NSArray fullCopyWithCopyedArray:x.userInfo[@"itemArray"]]];
    }];
}

- (void)initViews {
    [self setTitle:@"今天吃啥子捏" titleColor:[UIColor whiteColor] titleFont:[UIFont fontR:UIScale(18)]];
    
    [self initNavigation];
    [self initMagicPieLayer];
    [self initDecideBtn];
}

- (void)initDecideBtn {
    CGFloat btnWidth = UIScale(70);
    
    [self.view addSubview:self.decideBtn];
    
    self.decideBtn.backgroundColor = TintColor;
    [self.decideBtn setTitle:@"走起" forState:UIControlStateNormal];
    self.decideBtn.layer.cornerRadius = btnWidth / 2;
    self.decideBtn.layer.shadowOffset = CGSizeMake(4, 4);
    self.decideBtn.layer.shadowOpacity = 0.7;
    self.decideBtn.layer.shadowRadius = 5;
    self.decideBtn.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    [self.decideBtn addTarget:self action:@selector(decideBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.decideBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(btnWidth, btnWidth));
        make.bottom.equalTo(self.view).offset(-Common.shareCommon.heightTabBar - UIScale(80));
    }];
}

- (void)initMagicPieLayer {
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
//    self.pieLayer.backgroundColor = [[UIColor lightGrayColor] CGColor];
    self.pieLayer.frame = CGRectMake((screenWidth - self.radius * 2) / 2, UIScale(60), self.radius * 2, self.radius * 2);
    self.pieLayer.shadowOffset = CGSizeMake(4, 4);
    self.pieLayer.shadowOpacity = 0.7;
    self.pieLayer.shadowRadius = 5;
    self.pieLayer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.pieLayer.showTitles = ShowTitlesAlways;
    self.pieLayer.transformTitleBlock = ^(PieElement* elem, float percent){
        return [(PieElement *)elem title];
    };
    [self.view.layer addSublayer:self.pieLayer];
    
    
    self.arrowLayer.contents = (id)[UIImage imageNamed:@"arrow"].CGImage;
    self.arrowLayer.frame = CGRectMake(screenWidth * 0.5 - UIScale(10) / 2, self.pieLayer.frame.origin.y + self.radius - UIScale(distance), UIScale(10), self.radius / 2);
    self.arrowLayer.anchorPoint = CGPointMake(0.5, UIScale(distance) / self.arrowLayer.frame.size.height);
    self.arrowLayer.position = CGPointMake(self.pieLayer.frame.origin.x + self.radius, self.pieLayer.frame.origin.y + self.radius);
    [self.view.layer addSublayer:self.arrowLayer];
}

- (void)initNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemClick)];
    rightBarItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

// MARK: - Custom Method
- (void)updatePie {
    [self.pieLayer deleteValues:self.pieLayer.values animated:YES];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.itemArray.count; i++) {
        if (i >= self.colorArray.count) {
            break;
        }
        ItemModel *model = [self.itemArray objectAtIndex:i];
        PieElement *element = [PieElement pieElementWithValue:model.weight color:self.colorArray[i] title:model.name];
        [tempArray addObject:element];
    }
    [self.pieLayer addValues:tempArray animated:YES];
}

// MARK: - Click Selector Method
- (void)rightBarItemClick {
    self.eatSettingVC.itemArray = [NSMutableArray arrayWithArray:[NSArray fullCopyWithCopyedArray:self.itemArray]];
    self.eatSettingVC.colorArray = [NSMutableArray arrayWithArray:[NSArray fullCopyWithCopyedArray:self.colorArray]];
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.eatSettingVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)decideBtnClick {
    [self.arrowLayer removeAllAnimations];
    float x = (float)(arc4random() % 999) / 1000;
    float resultRadian = 2 * M_PI * x;
//    NSLog(@"%lf", resultRadian2);
    
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.keyPath = @"transform.rotation.z";
    animation.fromValue = [NSNumber numberWithFloat:0];
    
    animation.toValue = [NSNumber numberWithFloat:M_PI * 20 + resultRadian];
    animation.repeatCount = 0;
    animation.duration = 5;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.arrowLayer addAnimation:animation forKey:@"transformAnimation"];
    
    self.playedTimes++;
    if (self.playedTimes % 3 == 0) {
        [self showHudWithTitle:@"老婆~ 你要控制你治己~" lastTime:2.5];
    }
}

// MARK: - CAAnimation Deleagte Method
- (void)animationDidStart:(CAAnimation *)anim {
    [self.decideBtn setEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.decideBtn setEnabled:YES];
}

// MARK: - Getter Method
- (EatSettingViewController *)eatSettingVC {
    if (!_eatSettingVC) {
        _eatSettingVC = [[EatSettingViewController alloc]init];
    }
    return _eatSettingVC;
}

- (PieLayer *)pieLayer {
    if (!_pieLayer) {
        _pieLayer = [[PieLayer alloc]init];
    }
    return _pieLayer;
}

- (NSMutableArray<ItemModel *> *)itemArray {
    if (!_itemArray) {
        _itemArray = [DBOperation getAllData];
    }
    return _itemArray;
}

- (NSArray<UIColor *> *)colorArray {
    if (!_colorArray) {
        _colorArray = @[RGB(134, 204, 240),
                        RGB(197, 181, 224),
                        RGB(164, 251, 209),
                        RGB(254, 194, 128),
                        RGB(253, 187, 207),
                        RGB(254, 235, 122),
                        RGB(130, 241, 240),
                        RGB(229, 166, 220),
                        RGB(220, 223, 232),
                        RGB(253, 181, 170),];
    }
    return _colorArray;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc]init];
    }
    return _arrowImageView;
}

- (CALayer *)arrowLayer {
    if (!_arrowLayer) {
        _arrowLayer = [CALayer layer];
    }
    return _arrowLayer;
}

- (UIButton *)decideBtn {
    if (!_decideBtn) {
        _decideBtn = [[UIButton alloc]init];
    }
    return _decideBtn;
}

- (CGFloat)radius {
    return UIScreen.mainScreen.bounds.size.width * 0.9 / 2;
}

@end



