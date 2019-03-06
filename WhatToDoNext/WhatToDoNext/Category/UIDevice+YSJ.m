//
//  UIDevice+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/7/10.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "UIDevice+YSJ.h"
#import <sys/utsname.h>

@implementation UIDevice (YSJ)

- (DeviceModel)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString*phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if([phoneType  isEqualToString:@"iPhone3,1"])  return DeviceiPhone4;
    
    if([phoneType  isEqualToString:@"iPhone3,2"])  return DeviceiPhone4;
    
    if([phoneType  isEqualToString:@"iPhone3,3"])  return DeviceiPhone4;
    
    if([phoneType  isEqualToString:@"iPhone4,1"])  return DeviceiPhone4S;
    
    if([phoneType  isEqualToString:@"iPhone5,1"])  return DeviceiPhone5;
    
    if([phoneType  isEqualToString:@"iPhone5,2"])  return DeviceiPhone5;
    
    if([phoneType  isEqualToString:@"iPhone5,3"])  return DeviceiPhone5C;
    
    if([phoneType  isEqualToString:@"iPhone5,4"])  return DeviceiPhone5C;
    
    if([phoneType  isEqualToString:@"iPhone6,1"])  return DeviceiPhone5S;
    
    if([phoneType  isEqualToString:@"iPhone6,2"])  return DeviceiPhone5S;
    
    if([phoneType  isEqualToString:@"iPhone7,1"])  return DeviceiPhone6plus;
    
    if([phoneType  isEqualToString:@"iPhone7,2"])  return DeviceiPhone6;
    
    if([phoneType  isEqualToString:@"iPhone8,1"])  return DeviceiPhone6S;
    
    if([phoneType  isEqualToString:@"iPhone8,2"])  return DeviceiPhone6Splus;
    
    if([phoneType  isEqualToString:@"iPhone8,4"])  return DeviceiPhoneSE;
    
    if([phoneType  isEqualToString:@"iPhone9,1"])  return DeviceiPhone7;
    
    if([phoneType  isEqualToString:@"iPhone9,2"])  return DeviceiPhone7plus;
    
    if([phoneType  isEqualToString:@"iPhone10,1"]) return DeviceiPhone8;
    
    if([phoneType  isEqualToString:@"iPhone10,4"]) return DeviceiPhone8;
    
    if([phoneType  isEqualToString:@"iPhone10,2"]) return DeviceiPhone8plus;
    
    if([phoneType  isEqualToString:@"iPhone10,5"]) return DeviceiPhone8plus;
    
    if([phoneType  isEqualToString:@"iPhone10,3"]) return DeviceiPhoneX;
    
    if([phoneType  isEqualToString:@"iPhone10,6"]) return DeviceiPhoneX;
    
    return DeviceUnrecognized;
}

@end
