//
//  RestaurantProfilePresenter.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantProfilePresenter.h"
#import "RestaurantProfileInteractor.h"

@implementation RestaurantProfilePresenter {
    
    RestaurantProfileInteractor *restaurantProfileInteractor;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        restaurantProfileInteractor = [[RestaurantProfileInteractor alloc] init];
    }
    return self;
}

- (void)getRestaurantsByRegion:(NSString*)region andCusine:(NSString*)cusine{
    [restaurantProfileInteractor getRestaurantsByRegion:region andCusine:cusine complete:^(NSArray *restaurants) {
        [self.delegate didGetRestaurantsByCuisine:restaurants];
    }];
}

- (void)getRestaurantsByNeighbourhood:(NSString*)neighbourhood{
    [restaurantProfileInteractor getRestaurantsByNeighbourhood:neighbourhood complete:^(NSArray *restaurants) {
        [self.delegate didGetRestaurantsByNeighbourhood:restaurants];
    }];
}

@end
