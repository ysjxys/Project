//
//  VideoTableViewCell.m
//  AirPlayer
//
//  Created by ysj on 2018/8/29.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "Masonry.h"

@interface VideoTableViewCell()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *modifyLabel;
@property (nonatomic, strong) UILabel *sizeLabel;

@end

@implementation VideoTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView videoModel:(VideoModel *)model {
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.frame = CGRectMake(0, 0, UIApplication.sharedApplication.keyWindow.bounds.size.width, 55);
        [cell initView];
    }
    [cell loadModel:model];
    return cell;
}

- (void)loadModel:(VideoModel *)model {
    self.nameLabel.text = model.name;
    self.sizeLabel.text = model.fileSize;
    self.modifyLabel.text = model.modifyDate;
}

- (void)initView {
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.height.mas_equalTo(36);
        make.left.equalTo(self).offset(12);
        make.width.equalTo(self).offset(-12 * 2);
    }];
    
    self.modifyLabel = [[UILabel alloc] init];
    self.modifyLabel.adjustsFontSizeToFitWidth = YES;
    self.modifyLabel.font = [UIFont systemFontOfSize:13];
    self.modifyLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.modifyLabel];
    [self.modifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(2);
        make.height.mas_equalTo(14);
        make.left.equalTo(self.nameLabel);
        make.width.equalTo(self).multipliedBy(0.6);
    }];
    
    self.sizeLabel = [[UILabel alloc] init];
    self.sizeLabel.adjustsFontSizeToFitWidth = YES;
    self.sizeLabel.font = [UIFont systemFontOfSize:13];
    self.sizeLabel.textColor = [UIColor lightGrayColor];
    self.sizeLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.sizeLabel];
    [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(2);
        make.height.mas_equalTo(14);
        make.right.equalTo(self.mas_right).offset(-12);
        make.left.equalTo(self.modifyLabel.mas_right).offset(2);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
