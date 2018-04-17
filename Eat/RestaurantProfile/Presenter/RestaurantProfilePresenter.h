//
//  RestaurantProfilePresenter.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RestaurantProfilePresenterProtocol

- (void)showRestaurantsByCuisine:(NSArray*)restaurants;
- (void)showRestaurantsByNeighbourhood:(NSArray*)restaurants;

@end

@interface RestaurantProfilePresenter : NSObject

@property (weak, nonatomic) id<RestaurantProfilePresenterProtocol> delegate;

- (void)getRestaurantsByRegion:(NSString*)region andCusine:(NSString*)cusine;
- (void)getRestaurantsByNeighbourhood:(NSString*)cusine;

@end
