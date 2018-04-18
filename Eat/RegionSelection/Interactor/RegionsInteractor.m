//
//  RegionsInteractor.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RegionsInteractor.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "RegionModel.h"
#import "CuisineModel.h"
#import "CacheManager.h"
#import "Constants.h"

@implementation RegionsInteractor

- (void)getRegions:(void (^)(NSArray *regions))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"regions"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
       
        NSMutableArray *regions = [[NSMutableArray alloc] init];
        for (NSDictionary *regionResponse in responseObject) {
            NSError *error;
            RegionModel *region = [[RegionModel alloc] initWithDictionary:regionResponse error:&error];
            [regions addObject:region];
        }
        
        [[CacheManager sharedInstance] saveData:regions withId:REGIONS_DATA];
        
        completionBlock(regions);
     
     } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)getNeigbourhoods:(void (^)(id responseObject))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"neighborhoods"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        completionBlock(responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)getCuisines:(void (^)(id responseObject))completionBlock {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@/consumer/%@/%@", ENDPOINT_URL, API_VERSION, @"cuisines"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSMutableArray *cuisines = [[NSMutableArray alloc] init];
        for (NSDictionary *cuisinesResponse in responseObject) {
            NSError *error;
            CuisineModel *cuisine = [[CuisineModel alloc] initWithDictionary:cuisinesResponse error:&error];
            [cuisines addObject:cuisine];
        }
        
        [[CacheManager sharedInstance] saveData:cuisines withId:CUISINES_DATA];
        
        completionBlock(responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


@end
