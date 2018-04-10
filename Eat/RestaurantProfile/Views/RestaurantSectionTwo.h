//
//  RestaurantSectionTwo.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantSectionTwo : UIView

@property (weak, nonatomic) IBOutlet UILabel *establishmentType;
@property (weak, nonatomic) IBOutlet UILabel *priceLevel;
@property (weak, nonatomic) IBOutlet UILabel *attire;

- (void)setUpRestaurantSectionTwo:(RestaurantModel*)restaurant;

@end
