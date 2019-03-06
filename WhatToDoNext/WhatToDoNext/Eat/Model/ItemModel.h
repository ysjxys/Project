//
//  ItemModel.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/12.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSJObject.h"

@interface ItemModel : YSJObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int weight;

@property (nonatomic, copy) NSString *idNum;

+ (instancetype)itemModelWithName:(NSString *)name weight:(int)weight;

@end
