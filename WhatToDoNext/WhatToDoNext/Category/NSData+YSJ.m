//
//  NSData+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "NSData+YSJ.h"

@implementation NSData (YSJ)

/**
 *  NSData转为NSDictionary
 */
- (NSDictionary *)toDictionary {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableLeaves error:nil];
}

/**
 *  NSData转为NSArray
 */
- (NSArray *)toArray {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableLeaves error:nil];
}

@end
