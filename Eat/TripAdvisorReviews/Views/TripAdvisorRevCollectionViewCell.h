//
//  TripAdvisorRevCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReviewModel.h"

@interface TripAdvisorRevCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *reviewTitle;
@property (weak, nonatomic) IBOutlet UILabel *reviewText;
@property (weak, nonatomic) IBOutlet UILabel *reviewPublishedTime;
@property (weak, nonatomic) IBOutlet UIImageView *reviewRating;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

- (void)setUpCell:(ReviewModel*)review;

@end
