//
//  UIColor+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/16.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YSJ)

/**
 *  输入hex值返回颜色
 */
+ (UIColor *)fromHex:(NSString *)hex;

@end
