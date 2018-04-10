//
//  RestaurantMarker.h
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "RestaurantModel.h"

@interface RestaurantMarker : GMSMarker

@property (strong, nonatomic) RestaurantModel *restaurant;

@end
