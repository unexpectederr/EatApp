//
//  RestaurantInfoCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantInfoItemCollectionViewCell.h"

@implementation RestaurantInfoItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(NSString*)info {
    self.info.text = info;
}

@end
