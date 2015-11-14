//
//  CookBookTableViewCell.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-7.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "CookBookTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CookBookTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _nameLabelOne.adjustsFontSizeToFitWidth = YES;
    _nameLabelTwo.adjustsFontSizeToFitWidth = YES;
    _nameLabelThree.adjustsFontSizeToFitWidth = YES;
}

- (void)configWithModel:(CookBookModel *)model indexPath:(NSIndexPath *)indexPath{

    self.indexPath = indexPath;
    
    self.titleLabel.text = model.name;
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:model.imageFilename]];
    [self.bgImageOne sd_setImageWithURL:[NSURL URLWithString:[[model.vegetableList objectAtIndex:0]objectForKey:@"imagePathThumbnails"]]];
    [self.bgImageTwo sd_setImageWithURL:[NSURL URLWithString:[[model.vegetableList objectAtIndex:1]objectForKey:@"imagePathThumbnails"]]];
    [self.bgImageThree sd_setImageWithURL:[NSURL URLWithString:[[model.vegetableList objectAtIndex:2]objectForKey:@"imagePathThumbnails"]]];
    self.nameLabelOne.text = [model.vegetableList[0]objectForKey:@"name"];
    self.nameLabelTwo.text = [model.vegetableList[1]objectForKey:@"name"];
    self.nameLabelThree.text = [model.vegetableList[2]objectForKey:@"name"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
