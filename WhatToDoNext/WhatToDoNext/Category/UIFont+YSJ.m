//
//  UIFont+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "UIFont+YSJ.h"
#import "UIDevice+YSJ.h"

@implementation UIFont (YSJ)

/**
 *  获得 PingFangSC-Light 字体
 */
+ (UIFont *)fontL:(CGFloat)fontSize {
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    if (UIDevice.currentDevice.deviceModel == DeviceiPhone4 || UIDevice.currentDevice.deviceModel == DeviceiPhone4S) {
        return systemFont;
    } else {
        UIFont *resultFont = [UIFont fontWithName:@"PingFangSC-Light" size:fontSize];
        return  resultFont ? resultFont : systemFont;
    }
}

/**
 *  获得 PingFangSC-Medium 字体
 */
+ (UIFont *)fontM:(CGFloat)fontSize {
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    if (UIDevice.currentDevice.deviceModel == DeviceiPhone4 || UIDevice.currentDevice.deviceModel == DeviceiPhone4S) {
        return systemFont;
    } else {
        UIFont *resultFont = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
        return  resultFont ? resultFont : systemFont;
    }
}

/**
 *  获得 PingFangSC-Regular 字体
 */
+ (UIFont *)fontR:(CGFloat)fontSize {
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    if (UIDevice.currentDevice.deviceModel == DeviceiPhone4 || UIDevice.currentDevice.deviceModel == DeviceiPhone4S) {
        return systemFont;
    } else {
        UIFont *resultFont = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
        return  resultFont ? resultFont : systemFont;
    }
}

/**
 *  获得 PingFangSC-Semibold 字体
 */
+ (UIFont *)fontS:(CGFloat)fontSize {
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    if (UIDevice.currentDevice.deviceModel == DeviceiPhone4 || UIDevice.currentDevice.deviceModel == DeviceiPhone4S) {
        return systemFont;
    } else {
        UIFont *resultFont = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
        return  resultFont ? resultFont : systemFont;
    }
}

/**
 *  获得 Bold 字体
 */
+ (UIFont *)fontB:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:fontSize];
}

@end
