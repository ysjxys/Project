//
//  YSJAlertController.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "YSJAlertController.h"

@interface YSJAlertController ()

@end

@implementation YSJAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (instancetype)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message leftBtnTitle:(NSString *)leftBtnTitle rightBtnTitle:(nullable NSString *)rightBtnTitle leftHandle:(Selecthandle)leftHandle rightHandle:(Selecthandle)rightHandle {
    YSJAlertController *alert = (YSJAlertController *)[super alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftBtnTitle style:UIAlertActionStyleCancel handler:leftHandle];
    [alert addAction:leftAction];
    
    if (rightBtnTitle) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightBtnTitle style:UIAlertActionStyleDestructive handler:rightHandle];
        [alert addAction:rightAction];
    }
    return alert;
}

@end
