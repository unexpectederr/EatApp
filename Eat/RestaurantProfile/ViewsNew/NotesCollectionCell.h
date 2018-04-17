//
//  NotesCollectionCell.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@protocol NotesSectionProtocol

- (void)didExpandCollapseNote;

@end

@interface NotesCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *readMoreBtnConstraint;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UIButton *readMoreBtn;
@property (weak, nonatomic) id<NotesSectionProtocol> delegate;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
