//
//  VideoModel.h
//  AirPlayer
//
//  Created by ysj on 2018/8/28.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileSize;
@property (nonatomic, copy) NSString *modifyDate;
@property (nonatomic, copy) NSString *path;


+ (instancetype)videoWithAttribute:(NSDictionary *)attribute name:(NSString *)name path:(NSString *)path;

@end
