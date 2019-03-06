//
//  UIColor+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/16.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "UIColor+YSJ.h"

@implementation UIColor (YSJ)

/**
 *  输入hex值返回颜色
 */
+ (UIColor *)fromHex:(NSString *)hex {
    return [self fromHex:hex alpha:1.0];
}

+ (UIColor *)fromHex:(NSString *)hex alpha:(CGFloat)alpha {
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    NSString *rString = [hex substringToIndex:2];
    NSString *gString = [hex substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [hex substringFromIndex:4];
    
    unsigned r = 0;
    unsigned g = 0;
    unsigned b = 0;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0  blue:(float)b / 255.0  alpha:alpha];
}

@end
