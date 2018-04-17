//
//  GenericSectionItemModel.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GenericSectionItemModel : NSObject

@property (copy, nonatomic) NSString* title;
@property (strong, nonatomic) UIImage* icon;
@property (assign, nonatomic) BOOL isClickable;
@property (copy, nonatomic) NSString* type;

- (id)initWithTitle:(NSString*)title andIcon:(UIImage*)icon andType:(NSString*)type isClickable:(BOOL)isClickable;

@end
