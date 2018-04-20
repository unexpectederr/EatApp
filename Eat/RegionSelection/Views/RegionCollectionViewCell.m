//
//  RegionCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RegionCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RegionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 3.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithWhite:0.9f alpha:0.65].CGColor;
    self.layer.masksToBounds = YES;
    self.regionImage.layer.cornerRadius = self.regionImage.bounds.size.width/2;
    self.regionImage.layer.masksToBounds = YES;
}

- (void)buildCell:(RegionModel*)region {
    
    [self.regionImage sd_setImageWithURL:[NSURL URLWithString:region.image_url] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {}];
    
    self.regionName.text = region.name;
    
}

@end
