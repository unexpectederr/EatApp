//
//  RestaurantSmallCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantSmallCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UILabel *cuisineName;
@property (weak, nonatomic) IBOutlet UILabel *tripAdvisorRating;
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
