//
//  GenericSectionItemModel.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "GenericSectionItemModel.h"

@implementation GenericSectionItemModel

- (id)initWithTitle:(NSString*)title andIcon:(UIImage*)icon andType:(NSString*)type isClickable:(BOOL)isClickable{
    if( self = [super init] )
    {
        _title = title;
        _icon = icon;
        _type = type;
        _isClickable = isClickable;
    }
    return self;
}

@end
