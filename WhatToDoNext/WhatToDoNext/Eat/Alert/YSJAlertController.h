//
//  YSJAlertController.h
//  WhatToDoNext
//
//  Created by ysj on 2018/7/17.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSJAlertController : UIAlertController

typedef void (^ __nullable Selecthandle)(UIAlertAction *action);

//rightHandle:(void (^ __nullable)(void))rightHandle
+ (instancetype)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message leftBtnTitle:(NSString *)leftBtnTitle rightBtnTitle:(nullable NSString *)rightBtnTitle leftHandle:(Selecthandle)leftHandle rightHandle:(Selecthandle)rightHandle;

@end
