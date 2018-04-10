//
//  RestaurantsListInteractor.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantsListInteractor : NSObject

- (void)getRestaurantsForRegion:(NSString*)region complete:(void (^)(NSArray *regions))completionBlock;

@end
