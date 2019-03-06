//
//  NSDictionary+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "NSDictionary+YSJ.h"

@implementation NSDictionary (YSJ)

/**
 *  NSDictionary转为NSData
 */
- (NSData *)toData {
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

/**
 *  通过解档（NSKeyedUnarchiver）完全拷贝一份NSDictionary
 */
+ (NSDictionary *)fullCopyWithCopyedDictionary:(NSDictionary *)copyedDictionary {
    NSDictionary *copyDic = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:copyedDictionary]];
    return copyDic;
}

@end
