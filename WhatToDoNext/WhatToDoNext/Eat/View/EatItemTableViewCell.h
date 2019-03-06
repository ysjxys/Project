//
//  EatItemTableViewCell.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface EatItemTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath ItemArray:(NSArray<ItemModel *> *)itemArray colorArray:(NSArray<UIColor *> *)colorArray;

@end
