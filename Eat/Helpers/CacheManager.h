//
//  CacheManager.h
//  Eat
//
//  Created by Haris Muharemovic on 18/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cashier.h>

@interface CacheManager : NSObject

+ (instancetype)sharedInstance;

- (void)saveData:(NSArray*)array withId:(NSString*)dataId;
- (NSArray*)loadData:(NSString*)dataId;

@end
