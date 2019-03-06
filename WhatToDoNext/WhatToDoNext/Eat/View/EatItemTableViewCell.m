//
//  EatItemTableViewCell.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "EatItemTableViewCell.h"
#import "Common.h"
#import "UIImage+YSJ.h"

@interface EatItemTableViewCell()

@property (nonatomic, copy) NSArray<ItemModel *> *itemArray;
@property (nonatomic, copy) NSArray<UIColor *> *colorArray;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation EatItemTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath ItemArray:(NSArray<ItemModel *> *)itemArray colorArray:(NSArray<UIColor *> *)colorArray {
    EatItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EatItemTableViewCell"];
    if (!cell) {
        cell = [[EatItemTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"EatItemTableViewCell"];
    }
    cell.indexPath = indexPath;
    cell.itemArray = itemArray;
    cell.colorArray = colorArray;
    [cell updateCell];
    return cell;
}

- (void)updateCell {
    ItemModel *model = self.itemArray[self.indexPath.row];
    
    self.textLabel.text = model.name;
    self.imageView.image = [UIImage imageWithColor:self.colorArray[self.indexPath.row] size:CGSizeMake(EatCellHeight * 0.7, EatCellHeight * 0.7)];
    
    float weightSum = 0.0;
    for (ItemModel *m in self.itemArray) {
        weightSum += m.weight;
    }
    self.detailTextLabel.text = [NSString stringWithFormat:@"%.1f%%         %d  ", ((float)model.weight / weightSum) * 100.0, model.weight];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
