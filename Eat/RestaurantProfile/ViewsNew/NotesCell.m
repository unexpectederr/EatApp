//
//  NotesCell.m
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "NotesCell.h"
#import "UIHelper.h"

@implementation NotesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.note.superview.layer.borderWidth = 1.0f;
    self.note.superview.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.note.superview.layer.cornerRadius = 3.0f;
    self.note.superview.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
