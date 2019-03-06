//
//  DBOperation.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"

@interface DBOperation : NSObject

+ (void)createDBIfNotExist;
+ (void)initTableIfNotExist;
+ (void)dropTable;
+ (void)insertData:(ItemModel *)model;
+ (NSMutableArray<ItemModel *> *)getAllData;
+ (void)deleteData:(ItemModel *)model;

@end
