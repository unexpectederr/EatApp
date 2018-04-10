//
//  TripAdvisorReviewsViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReviewModel.h"

@interface TripAdvisorReviewsViewController : UIViewController

@property (strong, nonatomic) NSArray<ReviewModel*> *reviews;
@property (weak, nonatomic) IBOutlet UICollectionView *reviewsCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *numberOfReviews;

@end
