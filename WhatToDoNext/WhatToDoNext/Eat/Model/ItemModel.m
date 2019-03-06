//
//  ItemModel.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/12.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

+ (instancetype)itemModelWithName:(NSString *)name weight:(int )weight {
    ItemModel *model = [[ItemModel alloc]init];
    model.name = name;
    model.weight = weight;
    return model;
}

@end
