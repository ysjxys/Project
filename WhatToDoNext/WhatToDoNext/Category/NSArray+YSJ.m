//
//  NSArray+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "NSArray+YSJ.h"

@implementation NSArray (YSJ)

/**
 *  NSArray转为NSData
 */
- (NSData *)toData {
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

/**
 *  通过解档（NSKeyedUnarchiver）完全拷贝一份NSArray
 */
+ (NSArray *)fullCopyWithCopyedArray:(NSArray *)copyedArray {
    NSArray *copyArr = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:copyedArray]];
    return copyArr;
}

@end
