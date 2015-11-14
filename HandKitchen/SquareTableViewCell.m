//
//  SquareTableViewCell.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "SquareTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation SquareTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _commentLabelOne.adjustsFontSizeToFitWidth = YES;
    _commentLabelTwo.adjustsFontSizeToFitWidth = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithModel:(PlazaModel *)model1 model:(PlazaModel *)model2 indexPath:(NSIndexPath *)indexPath{
    
    [self.titleImageOne sd_setImageWithURL:[NSURL URLWithString:model1.userPortraitImageFileName]];
    [self.titleImageTwo sd_setImageWithURL:[NSURL URLWithString:model2.userPortraitImageFileName]];
    self.titleLabelOne.text = model1.title;
    self.titleLableTwo.text = model2.title;
    [self.bgImageOne sd_setImageWithURL:[NSURL URLWithString:model1.imageFileName]];
    [self.bgImageTwo sd_setImageWithURL:[NSURL URLWithString:model2.imageFileName]];
    self.commentLabelOne.text = model1.label;
    self.commentLabelTwo.text = model2.label;
}

@end
