//
//  RestaurnatSectionOne.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@protocol RestaurantSectionOneProtocol

- (void)didOpenTripAdvisorReviews;

@end

@interface RestaurantSectionOne : UIView

@property (weak, nonatomic) IBOutlet UIButton *tripAdvisorRating;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) id<RestaurantSectionOneProtocol> delegate;

- (void)setUpRestaurantSectionOne:(RestaurantModel*)restaurant;

@end
