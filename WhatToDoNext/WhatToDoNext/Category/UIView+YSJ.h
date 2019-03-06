//
//  UIView+YSJ.h
//  ysjLib
//
//  Created by ysj on 15/12/4.
//  Copyright © 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YSJ)

/**
 *  返回x坐标
 */
- (CGFloat)left;

/**
 *  设置x坐标
 */
- (void)setLeft:(CGFloat)left;

/**
 *  返回y坐标
 */
- (CGFloat)right;

/**
 *  设置y坐标
 */
- (void)setRight:(CGFloat)right;

/**
 *  返回顶部坐标
 */
- (CGFloat)top;

/**
 *  设置顶部坐标
 */
- (void)setTop:(CGFloat)top;

/**
 *  返回底部坐标
 */
- (CGFloat)bottom;

/**
 *  设置底部部坐标
 */
- (void)setBottom:(CGFloat)bottom;

/**
 *  返回中心点x坐标
 */
- (CGFloat)centerX;

/**
 *  设置中心点x坐标
 */
- (void)setCenterX:(CGFloat)centerX;

/**
 *  返回中心点y坐标
 */
- (CGFloat)centerY;

/**
 *  设置中心点y坐标
 */
- (void)setCenterY:(CGFloat)centerY;

/**
 *  返回宽度值
 */
- (CGFloat)width;

/**
 *  设置宽度值
 */
- (void)setWidth:(CGFloat)width;

/**
 *  返回高度值
 */
- (CGFloat)height;

/**
 *  设置高度值
 */
- (void)setHeight:(CGFloat)height;

/**
 *  返回原点值
 */
- (CGPoint)origin;

/**
 *  设置原点值
 */
- (void)setOrigin:(CGPoint)origin;

/**
 *  返回尺寸
 */
- (CGSize)size;

/**
 *  设置尺寸
 */
- (void)setSize:(CGSize)size;

/**
 *  设定粗细与颜色，为View添加顶部线条
 */
- (void)addTopLineWithThick:(CGFloat)thick andColor:(UIColor *)color;

/**
 *  设定颜色与默认粗细（CGFloat 0.5），为View添加顶部线条
 */
- (void)addTopLineWithColor:(UIColor *)color;

/**
 *  设定默认颜色（lightGrey Color） 与默认粗细（CGFloat 0.5），为View添加顶部线条
 */
- (void)addTopLine;

/**
 *  设定粗细与颜色，为View添加顶部线条
 */
- (void)addBottomLineWithThick:(CGFloat)thick andColor:(UIColor *)color;

/**
 *  设定颜色与默认粗细（CGFloat 0.5），为View添加顶部线条
 */
- (void)addBottomLineWithColor:(UIColor *)color;

/**
 *  设定默认颜色（lightGrey Color） 与默认粗细（CGFloat 0.5），为View添加顶部线条
 */
- (void)addBottomLine;

/**
 *  设定粗细与颜色，为View添加左侧线条
 */
- (void)addLeftLineWithThick:(CGFloat)thick andColor:(UIColor *)color;

/**
 *  设定颜色与默认粗细（CGFloat 0.5），为View添加左侧线条
 */
- (void)addLeftLineWithColor:(UIColor *)color;

/**
 *  设定默认颜色（lightGrey Color） 与默认粗细（CGFloat 0.5），为View添加左侧线条
 */
- (void)addLeftLine;

/**
 *  设定粗细与颜色，为View添加右侧线条
 */
- (void)addRightLineWithThick:(CGFloat)thick andColor:(UIColor *)color;

/**
 *  设定颜色与默认粗细（CGFloat 0.5），为View添加右侧线条
 */
- (void)addRightLineWithColor:(UIColor *)color;

/**
 *  设定默认颜色（lightGrey Color） 与默认粗细（CGFloat 0.5），为View添加右侧线条
 */
- (void)addRightLine;

@end
