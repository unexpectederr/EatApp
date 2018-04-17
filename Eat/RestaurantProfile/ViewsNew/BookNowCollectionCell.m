//
//  BookNowCollectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "BookNowCollectionCell.h"

@implementation BookNowCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
}

@end
