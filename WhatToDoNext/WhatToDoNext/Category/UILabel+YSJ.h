//
//  UILabel+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YSJ)

/**
 *  输入行间距、文字内容、字体与排列方式，直接设置AttributeText
 */
- (void)setAttText:(NSString *)text withLineSpacing:(CGFloat)lineSpacing textFont:(UIFont *)textFont alignment:(NSTextAlignment)alignment;

/**
 *  设定最大高度，获得当前label.text下的文字占用宽度
 */
- (CGFloat)getFitWidthWithHeight:(CGFloat)maxHeight;

/**
 *  设定最大宽度，获得当前label.text下的文字占用高度
 */
- (CGFloat)getFitHeightWithWidth:(CGFloat)maxWidth;

@end
