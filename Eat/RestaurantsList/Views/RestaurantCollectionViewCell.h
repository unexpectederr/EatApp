//
//  RestaurantCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"
#import "EatImageView.h"

@interface RestaurantCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UILabel *restaurnatAddress;
@property (weak, nonatomic) IBOutlet UILabel *neighbourhoodName;
@property (weak, nonatomic) IBOutlet UILabel *cuisineName;
@property (weak, nonatomic) IBOutlet UILabel *priceLevel;
@property (weak, nonatomic) IBOutlet UILabel *tripAdvisorRating;
@property (weak, nonatomic) IBOutlet UILabel *deals;
@property (weak, nonatomic) IBOutlet EatImageView *restaurantImage;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
