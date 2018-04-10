//
//  RestaurantProfileInteractor.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantProfileInteractor.h"
#import <AFNetworking.h>
#import "RestaurantModel.h"
#import "Constants.h"

@implementation RestaurantProfileInteractor

- (void)getRestaurantsByRegion:(NSString*)region andCusine:(NSString*)cusine complete:(void (^)(NSArray *restaurants))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"restaurants"];
    
    NSDictionary *params = @{
                             @"region_id": region,
                             @"cuisine_id": cusine,
                             };
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSMutableArray *restaurants = [[NSMutableArray alloc] init];
        for (NSDictionary *restaurantResponse in responseObject) {
            NSError *error;
            RestaurantModel *restaurant = [[RestaurantModel alloc] initWithDictionary:restaurantResponse error:&error];
            if (restaurant)
                [restaurants addObject:restaurant];
        }
        
        completionBlock(restaurants);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)getRestaurantsByNeighbourhood:(NSString*)neighbourhood complete:(void (^)(NSArray *restaurants))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"restaurants"];
    
    NSDictionary *params = @{
                             @"neighborhood_id[]": neighbourhood,
                             };
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSMutableArray *restaurants = [[NSMutableArray alloc] init];
        for (NSDictionary *restaurantResponse in responseObject) {
            NSError *error;
            RestaurantModel *restaurant = [[RestaurantModel alloc] initWithDictionary:restaurantResponse error:&error];
            if (restaurant)
                [restaurants addObject:restaurant];
        }
        
        completionBlock(restaurants);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}



@end
