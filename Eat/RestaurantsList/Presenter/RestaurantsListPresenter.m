//
//  RestaurantsListPresenter.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsListPresenter.h"
#import "RestaurantsListInteractor.h"

@implementation RestaurantsListPresenter {
    
    RestaurantsListInteractor *restaurantsListInteractor;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        restaurantsListInteractor = [[RestaurantsListInteractor alloc] init];
    }
    return self;
}

- (void)getRestaurantsForRegion:(NSString*)region {

    [restaurantsListInteractor getRestaurantsForRegion:region complete:^(NSArray *regions) {
        [self.delegate didGetRestaurants:regions];
    }];
}

@end
