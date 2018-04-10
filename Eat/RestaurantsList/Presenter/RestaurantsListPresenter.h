//
//  RestaurantsListPresenter.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RestaurantsListPresenterProtocol

- (void)didGetRestaurants:(NSArray*)restaurants;

@end

@interface RestaurantsListPresenter : NSObject

@property (weak, nonatomic) id<RestaurantsListPresenterProtocol> delegate;

- (void)getRestaurantsForRegion:(NSString*)region;

@end
