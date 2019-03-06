//
//  VideoModel.m
//  AirPlayer
//
//  Created by ysj on 2018/8/28.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+ (instancetype)videoWithAttribute:(NSDictionary *)attribute name:(NSString *)name path:(NSString *)path {
    VideoModel *model = [[VideoModel alloc] init];
    model.name = name;
    
    NSDate *date = [attribute fileModificationDate];
    NSDateFormatter *ff = [[NSDateFormatter alloc]init];
    [ff setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    model.modifyDate = [ff stringFromDate:date];
    
    model.fileSize = [self sizeOfFile:[attribute fileSize] needRound:NO];
    
    model.path = path;
    
    return model;
}

+ (NSString *)sizeOfFile:(double)size needRound:(BOOL)needRound{
    NSString *result=nil;
    if(size <1024) {
        if (needRound) {
            result = @"1KB";
        } else {
            result = [NSString stringWithFormat:@"%.1fB",size];
        }
    }else if (size>=1024&&size<1024*1024) {
        result = [NSString stringWithFormat:@"%.1fKB",size/1024.0];
    }else if (size>=1024*1024&&size<1024*1024*1024) {
        result = [NSString stringWithFormat:@"%.1fMB",size/1024.0/1024.0];
    }else {
        result = [NSString stringWithFormat:@"%.1fGB",size/1024.0/1024.0/1024.0];
    }
    result = [result stringByReplacingOccurrencesOfString:@".0B" withString:@"B"];
    result = [result stringByReplacingOccurrencesOfString:@".0KB" withString:@"KB"];
    result = [result stringByReplacingOccurrencesOfString:@".0MB" withString:@"MB"];
    result = [result stringByReplacingOccurrencesOfString:@".0GB" withString:@"GB"];
    return result;
}

@end
