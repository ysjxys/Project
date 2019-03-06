//
//  Common.h
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

/**
 *  公共实例获取方法
 */
+ (Common *)shareCommon;

/**
 *  导航栏高度
 */
@property (nonatomic, assign) CGFloat heightNavBar;

/**
 *  状态栏高度
 */
@property (nonatomic, assign) CGFloat heightSystemStatus;

/**
 *  底部栏高度
 */
@property (nonatomic, assign) CGFloat heightTabBar;

/**
 *  底部安全区域高度
 */
@property (nonatomic, assign) CGFloat heightBottomSafeArea;

/**
 *  顶部安全区域高度
 */
@property (nonatomic, assign) CGFloat heightTopSafeArea;

/**
 *  顶部额外高度
 */
@property (nonatomic, assign) CGFloat heightNavBarDistance;

/**
 *  UI适配形变
 */
+ (CGFloat)uiScale:(CGFloat)x;



@end
