//
//  NotesCollectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "NotesCollectionCell.h"
#import "UIHelper.h"

@implementation NotesCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
    
    self.note.superview.layer.borderWidth = 1.0f;
    self.note.superview.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.note.superview.layer.cornerRadius = 3.0f;
    self.note.superview.layer.masksToBounds = YES;
}

- (void)buildCell:(RestaurantModel*)restaurant{
    
    self.note.text = restaurant.description;
    
}

- (IBAction)readMoreBtn:(id)sender {
    
    self.note.numberOfLines = 0;
    self.readMoreBtn.hidden = YES;
    self.readMoreBtnConstraint.constant = -15;
    
    [self.delegate didExpandCollapseNote];
    
}

@end
