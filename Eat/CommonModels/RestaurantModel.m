//
//  RestaurantModel.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantModel.h"

@implementation RestaurantModel

@synthesize description;

+ (BOOL)propertyIsOptional:(NSString*)propertyName {
    if([propertyName isEqualToString:@"isLoadingItem"]) {
        return YES;
    }
    return NO;
}

- (id)initLoadingItem {
    if( self = [super init] )
    {
        _isLoadingItem = YES;
    }
    return self;
}

@end
