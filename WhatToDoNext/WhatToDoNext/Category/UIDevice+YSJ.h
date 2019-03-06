//
//  UIDevice+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeviceModel) {
    DeviceSimulator = 0,
    DeviceiPhone4,
    DeviceiPhone4S,
    DeviceiPhone5,
    DeviceiPhone5S,
    DeviceiPhone5C,
    DeviceiPhone6,
    DeviceiPhone6plus,
    DeviceiPhone6S,
    DeviceiPhone6Splus,
    DeviceiPhoneSE,
    DeviceiPhone7,
    DeviceiPhone7plus,
    DeviceiPhone8,
    DeviceiPhone8plus,
    DeviceiPhoneX,
    DeviceUnrecognized,
};

@interface UIDevice (YSJ)

@property (nonatomic, assign, readonly) DeviceModel deviceModel;

@end
