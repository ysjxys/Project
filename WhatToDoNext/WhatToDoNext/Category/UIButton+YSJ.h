//
//  UIButton+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YSJ)

/**
 *  设定各个状态下的UIButton背景色
 */
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
