//
//  RestaurantsListInteractor.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsListInteractor.h"
#import <AFNetworking.h>
#import "RestaurantModel.h"

@implementation RestaurantsListInteractor

- (void)getRestaurantsForRegion:(NSString*)region complete:(void (^)(NSArray *regions))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", @"https://api.eatapp.co", @"consumer/v1/restaurants"];
    
    NSDictionary *params = @{
                             @"region_id": region,
                             };

    [manager GET:url parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSMutableArray *restaurants = [[NSMutableArray alloc] init];
        for (NSDictionary *restaurantResponse in responseObject) {
            NSError *error;
            RestaurantModel *restaurant = [[RestaurantModel alloc] initWithDictionary:restaurantResponse error:&error];
            [restaurants addObject:restaurant];
        }
        
        completionBlock(restaurants);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
