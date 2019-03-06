//
//  VideoTableViewCell.h
//  AirPlayer
//
//  Created by ysj on 2018/8/29.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface VideoTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView videoModel:(VideoModel *)model;

@end
