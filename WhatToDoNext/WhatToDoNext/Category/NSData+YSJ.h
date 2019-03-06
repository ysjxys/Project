//
//  NSData+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (YSJ)

/**
 *  NSData转为NSDictionary
 */
- (NSDictionary *)toDictionary;

/**
 *  NSData转为NSArray
 */
- (NSArray *)toArray;

@end
