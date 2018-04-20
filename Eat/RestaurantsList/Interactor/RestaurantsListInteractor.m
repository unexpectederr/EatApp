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
#import "Constants.h"

@implementation RestaurantsListInteractor

- (void)getRestaurantsForRegion:(NSString*)region andPage:(NSInteger)page complete:(void (^)(NSArray *restaurants))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"restaurants"];
    
    NSDictionary *params = @{
                             @"region_id": region,
                             @"page": @(page),
                             };

    RestaurantsListInteractor* __weak welf = self;

    [manager GET:url parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        RestaurantsListInteractor* strongSelf = welf;
        
        if (!strongSelf)
            return;
        
        /*
         adding info about request so it can be used for pagination
         */
        NSHTTPURLResponse *httpResponse = ((NSHTTPURLResponse *)[task response]);
        if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
            NSDictionary *dictionary = [httpResponse allHeaderFields];
            if (dictionary[@"Link"])
                strongSelf.restaurantsLoadingLink = dictionary[@"Link"];
        }
        
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
