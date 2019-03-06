//
//  UILabel+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "UILabel+YSJ.h"

@implementation UILabel (YSJ)

/**
 *  输入行间距、文字内容、字体与排列方式，直接设置AttributeText
 */
- (void)setAttText:(NSString *)text withLineSpacing:(CGFloat)lineSpacing textFont:(UIFont *)textFont alignment:(NSTextAlignment)alignment {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = lineSpacing - (textFont.lineHeight - textFont.pointSize);
    paragraphStyle.alignment = alignment;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName: paragraphStyle};
    self.numberOfLines = 0;
    self.attributedText = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}

/**
 *  设定最大高度，获得当前label.text下的文字占用宽度
 */
- (CGFloat)getFitWidthWithHeight:(CGFloat)maxHeight {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, CGFLOAT_MAX, maxHeight);
    label.numberOfLines = self.numberOfLines;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = self.font;
    label.text = self.text;
    [label sizeToFit];
    return label.frame.size.width;
}

/**
 *  设定最大宽度，获得当前label.text下的文字占用高度
 */
- (CGFloat)getFitHeightWithWidth:(CGFloat)maxWidth {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, maxWidth, CGFLOAT_MAX);
    label.numberOfLines = self.numberOfLines;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = self.font;
    label.text = self.text;
    [label sizeToFit];
    return label.frame.size.height;
}

@end
