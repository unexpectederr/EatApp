//
//  RestaurantProfileInteractor.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantProfileInteractor : NSObject

- (void)getRestaurantsByRegion:(NSString*)region andCusine:(NSString*)cusine complete:(void (^)(NSArray *restaurants))completionBlock;
- (void)getRestaurantsByNeighbourhood:(NSString*)neighbourhood complete:(void (^)(NSArray *restaurants))completionBlock;

@end
