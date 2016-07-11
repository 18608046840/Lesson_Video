//
//  anchorListTableViewCell.m
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "anchorListTableViewCell.h"

@implementation anchorListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAuchormodel:(AuchorModel *)auchormodel{
    _auchormodel = auchormodel;
    [self.headerImageV setImageWithURL:[NSURL URLWithString:auchormodel.icon] placeholderImage:nil];
    self.nameLable.text = auchormodel.name;
    self.dateLable.text = auchormodel.detail;
    self.rangeLabel.text = [NSString stringWithFormat:@"排名:%@",auchormodel.pop];
}

@end
