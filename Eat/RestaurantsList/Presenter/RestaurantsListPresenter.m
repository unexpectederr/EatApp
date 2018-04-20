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

    RestaurantsListPresenter* __weak welf = self;

    if (page == 1 || [restaurantsListInteractor.restaurantsLoadingLink containsString:[NSString stringWithFormat:@"page=%li", (long)page]]) {
        
        [restaurantsListInteractor getRestaurantsForRegion:region andPage:page complete:^(NSArray *restaurants) {
           
            RestaurantsListPresenter* strongSelf = welf;
            
            if (!strongSelf)
                return;
            
            if (restaurants.count) {
                
                if (page > 1) {
                    [strongSelf.delegate addNewSetOfRestaurnats:restaurants];
                } else {
                    [strongSelf.delegate showRestaurantsList:restaurants];
                }
            } else {
                [strongSelf.delegate showEmptyContainer];
            }
        }];
        
    } else if (page > 1 && !restaurantsListInteractor.restaurantsLoadingLink) {
        
        [self.delegate removeLoadingItem];
        
    }
}

@end
