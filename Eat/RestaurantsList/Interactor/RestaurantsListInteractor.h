//
//  RestaurantsListInteractor.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantsListInteractor : NSObject

@property (strong, nonatomic) NSString* restaurantsLoadingLink;
- (void)getRestaurantsForRegion:(NSString*)region andPage:(NSInteger)page complete:(void (^)(NSArray *restaurants))completionBlock;

@end
