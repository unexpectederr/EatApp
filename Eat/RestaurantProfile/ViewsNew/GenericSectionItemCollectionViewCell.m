//
//  GenericSectionItemCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "GenericSectionItemCollectionViewCell.h"

@implementation GenericSectionItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(GenericSectionItemModel*)item {
    
    self.title.text = item.title;
    self.icon.image = item.icon;
    self.arrow.hidden = item.isClickable ? NO : YES;
}

@end
