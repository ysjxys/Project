//
//  UIImage+YSJ.h
//  ysjLib
//
//  Created by ysj on 16/5/16.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YSJ)
/**
 *  根据颜色创建图片
 *
 *  @param color 需要图片的颜色
 *
 *  @return 相应颜色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据颜色创建图片
 *
 *  @param color 需要图片的颜色
 *  @param size  图片大小
 *
 *  @return 相应颜色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  裁剪图片为圆形
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)circleImage;

/**
 *  截取view为图片
 *
 *  @return 截取后的图片
 */
+ (instancetype)captureWithView:(UIView *)view;

/**
 *  判断图片是否为亮色
 */
- (BOOL)isLightColor;
@end
