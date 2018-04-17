//
//  NotesCell.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@protocol NotesSectionProtocol

- (void)didExpandCollapseNote;

@end

@interface NotesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UIButton *readMoreBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *readMoreBtnConstraint;
@property (weak, nonatomic) id<NotesSectionProtocol> delegate;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
