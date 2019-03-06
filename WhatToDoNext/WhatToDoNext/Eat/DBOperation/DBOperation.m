//
//  DBOperation.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "DBOperation.h"
#import "FMDBHelper.h"

@implementation DBOperation

+ (void)createDBIfNotExist {
    [FMDBHelper dataBaseWithName:@"EatDB.sqlite"];
}

+ (void)initTableIfNotExist {
    if (![FMDBHelper isTableExist:TableName]) {
        NSDictionary *dic = @{@"id":@"integer PRIMARY KEY AUTOINCREMENT",
                              @"name":@"text NOT NULL",
                              @"weight":@"integer"};
        [FMDBHelper createTable:TableName withKeyTypeDic:dic];
        
        NSDictionary *insertDic1 = @{@"name": @"买菜做", @"weight": @"10"};
        [FMDBHelper insertKeyValues:insertDic1 intoTable:TableName];
        
        NSDictionary *insertDic2 = @{@"name": @"楼下吃", @"weight": @"10"};
        [FMDBHelper insertKeyValues:insertDic2 intoTable:TableName];
        
        NSDictionary *insertDic3 = @{@"name": @"速冻", @"weight": @"10"};
        [FMDBHelper insertKeyValues:insertDic3 intoTable:TableName];
        
        NSDictionary *insertDic4 = @{@"name": @"下馆子", @"weight": @"10"};
        [FMDBHelper insertKeyValues:insertDic4 intoTable:TableName];
    }
}

+ (void)dropTable {
    [FMDBHelper dropTable:TableName];
}

+ (void)insertData:(ItemModel *)model {
    NSDictionary *insertDic = @{@"name": model.name, @"weight": [NSString stringWithFormat:@"%d", model.weight]};
    [FMDBHelper insertKeyValues:insertDic intoTable:TableName];
}

+ (NSMutableArray<ItemModel *> *)getAllData {
    NSArray *dic = [FMDBHelper selectDataFromTable:TableName];
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < dic.count; i++) {
        ItemModel *model = [ItemModel itemModelWithName:dic[i][@"name"] weight:[dic[i][@"weight"] intValue]];
        model.idNum = dic[i][@"id"];
        [tempArray addObject:model];
    }
    return tempArray;
}

+ (void)deleteData:(ItemModel *)model {
    [FMDBHelper deleteTable:TableName andOrKey:AndKey compareKeyArr:@[[FMDBHelper compareKey:CompareKeyEqual]] columnArr:@[@{@"id": model.idNum}]];
}

@end
