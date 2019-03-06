//
//  Common.m
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "Common.h"

@implementation Common

/**
 *  公共实例获取方法
 */
+ (Common *)shareCommon{
    static Common *common = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        common = [[self alloc] init];
    });
    return common;
}

/**
 *  导航栏高度
 */
- (CGFloat)heightNavBar {
    return 44;
}

/**
 *  状态栏高度
 */
- (CGFloat)heightSystemStatus {
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}

/**
 *  底部栏高度
 */
- (CGFloat)heightTabBar {
    if (self.heightSystemStatus > 20) {
        return 83;
    } else {
        return 49;
    }
}

/**
 *  底部安全区域高度
 */
- (CGFloat)heightBottomSafeArea {
    if (self.heightSystemStatus > 20) {
        return 34;
    } else {
        return 0;
    }
}

/**
 *  顶部安全区域高度
 */
- (CGFloat)heightTopSafeArea {
    if (self.heightSystemStatus > 20) {
        return 44;
    } else {
        return 0;
    }
}

/**
 *  顶部额外高度
 */
- (CGFloat)heightNavBarDistance {
    return self.heightSystemStatus + self.heightNavBar;
}

+ (CGFloat)uiScale:(CGFloat)x {
    return [self adjustValue:x * (UIScreen.mainScreen.bounds.size.width / (CGFloat)375)];
}

+ (CGFloat)adjustValue:(CGFloat)value {
    CGFloat result = floor(value);
    CGFloat interval = (CGFloat)0.5;
    CGFloat gap = value - result;
    if (gap >= 0.5) {
        result += interval;
    }
    return result;
}


@end
