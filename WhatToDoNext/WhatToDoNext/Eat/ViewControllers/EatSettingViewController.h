//
//  EatSettingViewController.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/11.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "YSJViewController.h"
#import "ItemModel.h"

@interface EatSettingViewController : YSJViewController

@property (nonatomic, strong) NSMutableArray<ItemModel *> *itemArray;
@property (nonatomic, copy) NSArray<UIColor *> *colorArray;

@end
