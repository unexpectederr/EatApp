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

- (void)getRestaurantsForRegion:(NSString*)region andPage:(NSInteger)page {

    __weak typeof(self) welf = self;

    if (page == 1 || [restaurantsListInteractor.restaurantsLoadingLink containsString:[NSString stringWithFormat:@"page=%li", (long)page]]) {
        
        [restaurantsListInteractor getRestaurantsForRegion:region andPage:page complete:^(NSArray *restaurants) {
           
            if (restaurants.count) {
                
                if (page > 1) {
                    [welf.delegate addNewSetOfRestaurnats:restaurants];
                } else {
                    [welf.delegate showRestaurantsList:restaurants];
                }
            } else {
                [welf.delegate showEmptyContainer];
            }
        }];
        
    } else if (page > 1 && !restaurantsListInteractor.restaurantsLoadingLink) {
        
        [welf.delegate removeLoadingItem];
        
    }
}

@end
