//
//  CacheManager.m
//  Eat
//
//  Created by Haris Muharemovic on 18/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager

+ (instancetype)sharedInstance {
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)saveData:(NSArray*)array withId:(NSString*)dataId {
    
    Cashier* cashier = [Cashier cacheWithId:@"dataCache"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    [cashier setData: data forKey:dataId];
    
}

- (NSArray*)loadData:(NSString*)dataId {
    
    Cashier* cashier = [Cashier cacheWithId:@"dataCache"];
    NSData* data = [cashier dataForKey:dataId];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return array;
    
}

@end
