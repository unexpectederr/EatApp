//
//  NSString+Repeat.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "NSString+Repeat.h"

@implementation NSString (Repeat)

- (NSString *)repeatTimes:(NSUInteger)times {
    return [@"" stringByPaddingToLength:times * [self length] withString:self startingAtIndex:0];
}

@end
