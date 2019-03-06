//
//  EditItemViewController.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/18.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "YSJViewController.h"
#import "ItemModel.h"

typedef NS_ENUM(NSInteger, EditType){
    TypeEdit = 0,
    TypeAdd,
};

@interface EditItemViewController : YSJViewController

@property (nonatomic, strong) ItemModel *itemModel;

- (instancetype)initWithEditType:(EditType)editType;

@end
