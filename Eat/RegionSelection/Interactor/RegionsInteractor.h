//
//  RegionsInteractor.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegionsInteractor : NSObject

- (void)getRegions:(void (^)(NSArray *regions))completionBlock;
- (void)getCuisines:(void (^)(id responseObject))completionBlock;
- (void)getNeigbourhoods:(void (^)(id responseObject))completionBlock;

@end
