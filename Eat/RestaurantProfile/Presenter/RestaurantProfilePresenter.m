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

- (void)getRestaurantsByRegion:(NSString*)region andCusine:(NSString*)cusine {
    
    RestaurantProfilePresenter* __weak welf = self;

    [restaurantProfileInteractor getRestaurantsByRegion:region andCusine:cusine complete:^(NSArray *restaurants) {
        
        RestaurantProfilePresenter* strongSelf = welf;
        
        if (!strongSelf)
            return;
        
        [strongSelf.delegate showRestaurantsByCuisine:restaurants];
    
    }];
}

- (void)getRestaurantsByNeighbourhood:(NSString*)neighbourhood {

    RestaurantProfilePresenter* __weak welf = self;

    [restaurantProfileInteractor getRestaurantsByNeighbourhood:neighbourhood complete:^(NSArray *restaurants) {
        
        RestaurantProfilePresenter* strongSelf = welf;
        
        if (!strongSelf)
            return;
        
        [strongSelf.delegate showRestaurantsByNeighbourhood:restaurants];
    
    }];
}

@end
