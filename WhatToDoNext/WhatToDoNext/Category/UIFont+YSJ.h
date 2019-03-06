//
//  UIFont+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YSJ)

/**
 *  获得 PingFangSC-Light 字体
 */
+ (UIFont *)fontL:(CGFloat)fontSize;

/**
 *  获得 PingFangSC-Medium 字体
 */
+ (UIFont *)fontM:(CGFloat)fontSize;

/**
 *  获得 PingFangSC-Regular 字体
 */
+ (UIFont *)fontR:(CGFloat)fontSize;

/**
 *  获得 PingFangSC-Semibold 字体
 */
+ (UIFont *)fontS:(CGFloat)fontSize;

/**
 *  获得 Bold 字体
 */
+ (UIFont *)fontB:(CGFloat)fontSize;

@end
